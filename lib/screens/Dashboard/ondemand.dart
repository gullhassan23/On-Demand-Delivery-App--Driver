import 'dart:math';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:driverapp/constants/icons.dart';
import 'package:driverapp/services/user_services.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../controllers/dashboard_controller.dart';
import '../../controllers/user_controller.dart';
import '../../models/jobs.dart';
import '../../widgets/font.dart';
import '../ondemand/ondemand.dart';

class OnDemand extends StatefulWidget {
  const OnDemand({Key? key}) : super(key: key);

  @override
  _OnDemandState createState() => _OnDemandState();
}

class _OnDemandState extends State<OnDemand> {
  String address = '';

  final Completer<GoogleMapController> _controller = Completer();
  late LatLng _initialPosition = LatLng(0.0, 0.0);

  Stream<QuerySnapshot>? _jobsStream;
  final Set<Marker> _markers = {};
  final Set<Marker> _updatemarkers = {};

  List<Marker> list = const [
    Marker(
        markerId: MarkerId('1'),
        position: LatLng(33.6844, 73.0479),
        infoWindow: InfoWindow(title: 'some Info ')),
  ];
  UserServices _userServices = Get.find<UserServices>();

  @override
  void initState() {
    // TODO: implement initState
    // getCurrentPosition();
    // dcontroller.onboardmarkers.addAll(list);
    getCurrentPosition();
    // loadData();

    super.initState();
  }

  Future<void> _getJobsWithinRadius() async {
    if (_userServices.driver.approved.toString() == "true") {
      // Get the current user's location
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      double radiusInKm = double.parse(_userServices.driver.radius
          .toString()); // Set your desired radius in kilometers

      // Get Firestore collection reference
      CollectionReference jobsCollection =
          FirebaseFirestore.instance.collection('Jobs');

      // Create a geographical point based on the user's current location
      GeoPoint userLocation = GeoPoint(position.latitude, position.longitude);

      // Create a query for jobs within the specified radius
      GeoPoint lesserGeopoint = _getNewGeoPoint(userLocation, -radiusInKm);
      GeoPoint greaterGeopoint = _getNewGeoPoint(userLocation, radiusInKm);

      _jobsStream = await jobsCollection
          .where('pickup.point', isLessThanOrEqualTo: greaterGeopoint)
          .where('pickup.point', isGreaterThanOrEqualTo: lesserGeopoint)
          .where('status', isEqualTo: 0)
          .where("type", isEqualTo: 0)
          .where("vehicle", isEqualTo: _userServices.driver.asset!.vehiclecategory!.id)

          .snapshots();

      _jobsStream!.listen((querySnapshot) async {
        // Clear previous markers
        _markers.clear();
        print("list clear successfully");

        for (var document in querySnapshot.docs) {
          GeoPoint jobLocation = document['pickup.point'] as GeoPoint;

          // Create a JobModel instance from Firestore document and add to the list
          JobModel jobModeldata = JobModel(
            amount: document['amount'],
            created: document['created'].toDate(),
            date: document['date'].toDate(),
            delivery: document['delivery'],
            driver: document['driver'],
            dropoff: Dropoff.fromMap({
              'address': document['dropoff.address'],
              'city': document['dropoff.city'],
              'name': document['dropoff.name'],
              'phone': document['dropoff.phone'],
              'point': document['dropoff.point'], // Assuming it's a GeoPoint
            }),
            from: document['from'],
            id: document.id,
            image: document['image'],
            instructions: document['instructions'],
            item: Item.fromMap({
              'name': document['item.name'],
              'height': document['item.height'],
              'length': document['item.length'],
              'width': document['item.width'],
              'weight': document['item.weight'],
            }),
            labor: Labor.fromMap({
              'labor': document['labor.labor'],
              'required': document['labor.required'],
            }),
            marketplace: document['marketplace'],
            package: document['package'],
            pickup: Pickup.fromMap({
              'city': document['pickup.city'],
              'name': document['pickup.name'],
              'phone': document['pickup.phone'],
              'address': document['pickup.address'],
              'location': document['pickup.location'],
              'miles': document['pickup.miles'],
              'point':
                  jobLocation, // Or document['pickup.point'] directly if it's a GeoPoint
            }),
            sender: document['sender'],
            title: document['title'],
            vehicle: document['vehicle'],
            type: document['type'],
            number: document['number'],
            status: document['status'],
            // Map other properties...
            // Continue mapping remaining properties similarly
            // For example:
            // property1: document['property1'],
            // property2: document['property2'],
          );
          await _addMarker(LatLng(jobLocation.latitude, jobLocation.longitude),
              document.id, jobModeldata);
          print("marker add 2 ${_markers}");
        }
      });
    }
  }

  Future<void> _addMarker(
      LatLng position, String markerId, JobModel data) async {
    final Uint8List markerIcon =
        await getBytesFromAsset(AppIcons.locationmarker, 100);

    _markers.add(
      Marker(
          markerId: MarkerId(markerId),
          position: position,
          icon: BitmapDescriptor.fromBytes(markerIcon),
          onTap: () {
            // print(data.data());
            showDialog(
              context: context,
              builder: (BuildContext context) {
                var screenSize = MediaQuery.of(context).size;

                return AlertDialog(
                  title: Headline('Order Details'),
                  content: Container(
                    height: screenSize.height *
                        0.3, // Set the height as per your requirement
                    width: double.maxFinite,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Headline('Pickup Address '),
                          SizedBox(
                            width: screenSize.width * 0.008,
                          ),
                          SizedBox(
                            height: screenSize.width * 0.008,
                          ),
                          Text('Pick Up ${data.pickup!.address}'),
                          Headline('Drop off Address '),
                          SizedBox(
                            height: screenSize.width * 0.008,
                          ),
                          Text('Drop Off ${data.dropoff!.address}'),
                          // Add more content here if needed
                        ],
                      ),
                    ),
                  ),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Get.back();
                        Get.to(() => OnDemandScreen(
                              offerdata: data,
                            ));
                        // Perform an action when the button is pressed
                      },
                      child: Text('Show Details'),
                    ),
                  ],
                );
              },
            );

            // Get.to(() => OnDemandScreen(
            //       offerdata: data,
            //     ));
          }),
    );
    print("marker add $_markers");
    setState(() {});
  }

  GeoPoint _getNewGeoPoint(GeoPoint base, double distanceInKm) {
    // Approximate calculation for a square region
    double lat = base.latitude + (distanceInKm / 110.574);
    double lng = base.longitude + (distanceInKm / (111.32 * cos(lat)));

    return GeoPoint(lat, lng);
  }

  // Future<void> addRandomMarkers(LatLng userLocation) async {
  //   // Clear previous markers
  //   // _markers.clear();

  //   final random = Random();
  //   for (int i = 0; i < 5; i++) {
  //     final double randomLat = userLocation.latitude +
  //         (random.nextDouble() - 0.5) * 0.072; // Approx. 5-km in latitude
  //     final double randomLng = userLocation.longitude +
  //         (random.nextDouble() - 0.5) * 0.072; // Approx. 5-km in longitude

  //     final Uint8List markerIcon =
  //         await getBytesFromAsset(images[i % images.length], 70);

  //     _markers.add(
  //       Marker(
  //         markerId: MarkerId(i.toString()),
  //         position: LatLng(randomLat, randomLng),
  //         icon: BitmapDescriptor.fromBytes(markerIcon),
  //         infoWindow: InfoWindow(
  //             title: 'Title of the marker $i',
  //             snippet: 'Additional information for marker $i',
  //             onTap: () {
  //               Get.to(() => OnDemandScreen());
  //             }),
  //       ),
  //     );
  //   }
  //   setState(() {});
  // }

  getCurrentPosition() async {
    dcontroller.onboardmarkers.clear();

    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    _getUserCurrentLocation().then((value) async {
      final GoogleMapController controller = await _controller.future;
      final Uint8List markerIcon =
          await getBytesFromAsset(AppIcons.locationmarker, 200);

      // _markers.add(Marker(
      //   markerId: MarkerId("current location"),
      //   position: LatLng(value.latitude, value.longitude),

      // ));
      CameraPosition _kGooglePlex = CameraPosition(
        target: LatLng(value.latitude, value.longitude),
        zoom: 15,
      );
      dcontroller.onboardkGooglePlex = _kGooglePlex;
      controller.animateCamera(CameraUpdate.newCameraPosition(_kGooglePlex));

      List<Placemark> placemarks =
          await placemarkFromCoordinates(value.latitude, value.longitude);

      final add = placemarks.first;
      address = add.locality.toString() +
          " " +
          add.administrativeArea.toString() +
          " " +
          add.subAdministrativeArea.toString() +
          " " +
          add.country.toString();
      _getJobsWithinRadius();

      // addRandomMarkers(LatLng(value.latitude, value.longitude));
      setState(() {});
    });

    // if (mounted) setState(() {});
  }

  Future<Position> _getUserCurrentLocation() async {
    await Geolocator.requestPermission()
        .then((value) {})
        .onError((error, stackTrace) {
      print(error.toString());
    });

    return await Geolocator.getCurrentPosition();
  }

  DashboardContoller dcontroller = Get.find<DashboardContoller>();

  // final Completer<GoogleMapController> _controller = Completer();

  // List<String> images = [
  //   AppIcons.locationmarker,
  //   AppIcons.locationmarker,
  //   AppIcons.locationmarker,
  //   AppIcons.locationmarker,
  //   AppIcons.locationmarker,
  //   AppIcons.locationmarker,
  // ];

  Uint8List? markerImage;
  // final List<Marker> _markers = <Marker>[];
  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(33.6910, 72.98072),
    zoom: 15,
  );

  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: _jobsStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          // if (snapshot.connectionState == ConnectionState.waiting) {
          //   return Center(child: CircularProgressIndicator());
          // }

          return GoogleMap(
            markers: _markers,
            myLocationButtonEnabled: true,
            myLocationEnabled: true,
            initialCameraPosition: _kGooglePlex,
            onMapCreated: (GoogleMapController controller) {
              // _mapController = controller;
              _controller.complete(controller);
            },
          );
        },
      ),
    );
  }

  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body:
  //      GoogleMap(
  //       initialCameraPosition: _kGooglePlex,
  //       mapType: MapType.normal,
  //       myLocationButtonEnabled: true,
  //       myLocationEnabled: true,
  //       markers: Set<Marker>.of(_markers),
  //       onMapCreated: (GoogleMapController controller) {
  //         _controller.complete(controller);
  //       },
  //       onTap: (LatLng latLng) {
  //         Get.to(() => OnDemandScreen());
  //       },
  //     ),
  //   );
  // }
}

// import 'dart:math';

// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:geolocator/geolocator.dart';

// class OnDemand extends StatefulWidget {
//   @override
//   _OnDemandState createState() => _OnDemandState();
// }

// class _OnDemandState extends State<OnDemand> {
//   GoogleMapController? _mapController;
//   Stream<QuerySnapshot>? _jobsStream;
//   final Set<Marker> _markers = {};

//   @override
//   void initState() {
//     super.initState();
//     _getJobsWithinRadius();
//   }

//   Future<void> _getJobsWithinRadius() async {
//     // Get the current user's location
//     Position position = await Geolocator.getCurrentPosition(
//         desiredAccuracy: LocationAccuracy.high);

//     double radiusInKm = 10.0; // Set your desired radius in kilometers

//     // Get Firestore collection reference
//     CollectionReference jobsCollection =
//         FirebaseFirestore.instance.collection('Jobs');

//     // Create a geographical point based on the user's current location
//     GeoPoint userLocation = GeoPoint(position.latitude, position.longitude);

//     // Create a query for jobs within the specified radius
//     GeoPoint lesserGeopoint = _getNewGeoPoint(userLocation, -radiusInKm);
//     GeoPoint greaterGeopoint = _getNewGeoPoint(userLocation, radiusInKm);

//     _jobsStream = await jobsCollection
//         // .where('points', isGreaterThanOrEqualTo: lesserGeopoint)
//         // .where('points', isLessThanOrEqualTo: greaterGeopoint)

//         .snapshots();
//     FirebaseFirestore.instance.collection('Jobs').doc().get().then(
//       (value) {
//         print(value.data()!.length);
//         print("jobstream11${value.data()}");
//         print("jobstream leng${value.data()!.length}");

//       },
//     );
//     // print("jobstream${_jobsStream!.data}");
//     _jobsStream!.listen((querySnapshot) {
//       // Clear previous markers
//       _markers.clear();

//       for (var document in querySnapshot.docs) {
//         GeoPoint jobLocation = document['location'] as GeoPoint;
//         _addMarker(
//           LatLng(jobLocation.latitude, jobLocation.longitude),
//           document.id,
//         );
//       }
//     });
//   }

//   GeoPoint _getNewGeoPoint(GeoPoint base, double distanceInKm) {
//     // Approximate calculation for a square region
//     double lat = base.latitude + (distanceInKm / 110.574);
//     double lng = base.longitude + (distanceInKm / (111.32 * cos(lat)));

//     return GeoPoint(lat, lng);
//   }

//   void _addMarker(LatLng position, String markerId) {
//     _markers.add(
//       Marker(
//         markerId: MarkerId(markerId),
//         position: position,
//         // Customize marker icon if needed
//         // icon: BitmapDescriptor.defaultMarker,
//       ),
//     );
//     setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: StreamBuilder<QuerySnapshot>(
//         stream: _jobsStream,
//         builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//           if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           }

//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           }

//           return GoogleMap(
//             markers: _markers,
//             initialCameraPosition: CameraPosition(
//               target: LatLng(0.0, 0.0), // Initial camera position
//               zoom: 10.0, // Initial zoom level
//             ),
//             onMapCreated: (GoogleMapController controller) {
//               _mapController = controller;
//             },
//           );
//         },
//       ),
//     );
//   }
// }
