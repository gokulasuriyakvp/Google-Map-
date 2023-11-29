import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Google Maps Example',
      home: MapScreen(),
    );
  }
}

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(
      37.7749, -122.4194); // Replace with your desired initial position

  Set<Marker> markers ={
    Marker(
      markerId: MarkerId('marker'),
      position:LatLng(37.7749, -122.4194),
      infoWindow: InfoWindow(
        title: 'location',
        snippet: 'place',
      ),),
    Marker(
      markerId: MarkerId('marker'),
      position:LatLng(13.067439, 80.237617),
      infoWindow: InfoWindow(
        title: 'chennai',
        snippet: 'place',
      ),),
  };

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Google Maps Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 15.0,
          ),
          markers: markers,
        ),
      ),
    );
  }
}
// https://docs.google.com/presentation/d/1krhhojjbjozmjbkSlPB01XrevOSeuApwT7y_fgPzMpY/edit?usp=sharing
