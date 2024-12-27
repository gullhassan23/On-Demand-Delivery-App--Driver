import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';


class markermovement extends StatefulWidget {
  @override
  _markermovementState createState() => _markermovementState();
}

class _markermovementState extends State<markermovement> {
  late GoogleMapController mapController;
  late Marker marker;

  @override
  void initState() {
    super.initState();
    marker = Marker(markerId: MarkerId('user'), position: LatLng(0, 0));
    _getCurrentLocation();
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  void _updateMarker(Position position) {
    setState(() {
      marker = Marker(
        markerId: MarkerId('user'),
        position: LatLng(position.latitude, position.longitude),
      );
    });
    mapController.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(position.latitude, position.longitude),
          zoom: 15.0,
        ),
      ),
    );
  }

  void _getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      _updateMarker(position);
      Geolocator.getPositionStream().listen((Position position) {
        _updateMarker(position);
      });
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Map with Marker'),
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: LatLng(0, 0),
          zoom: 15.0,
        ),
        markers: Set.of([marker]),
      ),
    );
  }
}
