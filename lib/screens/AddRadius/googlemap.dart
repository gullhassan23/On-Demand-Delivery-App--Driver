import 'package:driverapp/controllers/user_controller.dart';
import 'package:driverapp/widgets/font.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

import '../../services/user_services.dart';

class MapRadius extends StatefulWidget {
  @override
  _MapRadiusState createState() => _MapRadiusState();
}

class _MapRadiusState extends State<MapRadius> {
  late GoogleMapController mapController;
  UserController _userController = Get.find<UserController>();
  UserServices userservice = Get.find<UserServices>();

  late LatLng _initialPosition = LatLng(0.0, 0.0); // Default initial position
  LatLng _selectedPosition = LatLng(0.0, 0.0); // Selected position
  double _selectedRadiusInKm = 0.0;// Selected radius in kilometers
  double _selectedRadiusInMeters = 0.0; // Selected radius in meters
  @override
  void initState() {
    super.initState();
    _selectedRadiusInKm=double.parse(userservice.driver.radius.toString());
   _selectedRadiusInMeters= _selectedRadiusInKm*1000;
   
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      bool serviceEnabled = await Geolocator.openLocationSettings();
      if (!serviceEnabled) {
        return;
      }
    }

    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      setState(() {
        _initialPosition = LatLng(position.latitude, position.longitude);
        _selectedPosition = _initialPosition;
      });

      mapController.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: _initialPosition,
            zoom: 14,
          ),
        ),
      );
    } catch (e) {
      print('Error obtaining location: $e');
    }
  }

  void _onMapTap(LatLng tappedPosition) {
    setState(() {
      _selectedPosition = tappedPosition;
      _selectedRadiusInKm = 0.0; // Reset the selected radius in kilometers
      _selectedRadiusInMeters = 0.0; // Reset the selected radius in meters
    });
  }

  void _setRadiusInKilometers(double kilometers) {
    setState(() {
      _selectedRadiusInKm = kilometers;
      _selectedRadiusInMeters =
          kilometers * 1000; // Convert kilometers to meters
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Headline("Radius"),
      ),
      body: _initialPosition != LatLng(0.0, 0.0)
          ? Stack(
              children: [
                GoogleMap(
                  initialCameraPosition: CameraPosition(
                    target: _initialPosition,
                    zoom: 12,
                  ),
                  onMapCreated: (GoogleMapController controller) {
                    mapController = controller;
                  },
                  onTap: _onMapTap,
                  myLocationEnabled: true,
                  circles: {
                    if (_selectedPosition != LatLng(0.0, 0.0))
                      Circle(
                        circleId: CircleId('selected_radius'),
                        center: _initialPosition,
                        radius: _selectedRadiusInMeters,
                        fillColor: Colors.blue.withOpacity(0.3),
                        strokeColor: Colors.blue,
                        strokeWidth: 2,
                      ),
                  },
                ),
                Positioned(
                  bottom: 16,
                  left: 16,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Set Radius in Kilometers:',
                        style: TextStyle(fontSize: 18),
                      ),
                      Slider(
                        value: _selectedRadiusInKm,
                        min: 0.0,
                        max: 10.0,
                        divisions: 100,
                        label: _selectedRadiusInKm.toStringAsFixed(1),
                        onChanged: (value) {
                          _setRadiusInKilometers(value);
                        },
                      ),
                      Text(
                        'Selected Radius: $_selectedRadiusInKm kilometers',
                        style: TextStyle(fontSize: 18),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          _userController
                              .updateradius(_selectedRadiusInKm.toString());
                        },
                        child: Text(
                          'Set Radius',
                          style: TextStyle(fontSize: 18),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
