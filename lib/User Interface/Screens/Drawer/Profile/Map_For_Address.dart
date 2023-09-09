import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

class PlacesSearchWidget extends StatefulWidget {
  @override
  _PlacesSearchWidgetState createState() => _PlacesSearchWidgetState();
}

class _PlacesSearchWidgetState extends State<PlacesSearchWidget> {
  TextEditingController _searchController = TextEditingController();
  GoogleMapController? _mapController;
  List<Marker> _markers = [];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }


  Future<void> _searchPlaces(String query) async {
    final apiKey = 'AIzaSyBKIlvYYdvExdOrvjZZFxvm1KsAC99aLzM'; // Replace with your own API key
    final endpoint = Uri.parse(
        'https://maps.googleapis.com/maps/api/place/textsearch/json?query=$query&key=$apiKey');

    final response = await http.get(endpoint);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final results = data['results'];

      setState(() {
        _markers.clear();

        for (var result in results) {
          final name = result['name'];
          final geometry = result['geometry'];
          final location = geometry['location'];
          final lat = location['lat'];
          final lng = location['lng'];

          _markers.add(
            Marker(
              markerId: MarkerId(name),
              position: LatLng(lat, lng),
              infoWindow: InfoWindow(title: name),
            ),
          );
        }
      });

      // Move the camera to the first result
      if (_mapController != null && _markers.isNotEmpty) {
        final firstMarker = _markers.first;
        _mapController!.animateCamera(CameraUpdate.newLatLng(firstMarker.position));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
        body: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  labelText: 'Search for Places',
                  suffixIcon: IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {
                      final query = _searchController.text;
                      if (query.isNotEmpty) {
                        _searchPlaces(query);
                      }
                    },
                  ),
                ),
              ),
            ),
            Expanded(
              child: GoogleMap(
                onMapCreated: (controller) {
                  setState(() {
                    _mapController = controller;
                  });
                },
                markers: _markers.toSet(),
                initialCameraPosition: CameraPosition(
                  target: LatLng(37.7749, -122.4194), // Initial camera position (San Francisco)
                  zoom: 13.0,
                ),
              ),
            ),
          ],
        ),
      );

  }
}
