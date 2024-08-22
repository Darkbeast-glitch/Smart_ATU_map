import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:smart_atu_nav/utils/custom_grid.dart';
import 'package:smart_atu_nav/views/pages/map_page.dart';

class SrcComplexPage extends StatelessWidget {
  const SrcComplexPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> buildings = [
      'President\'s office',
      'Vice Pres. Office',
      'Gen. Secretary Office',
      'PRO\'s Office',
      'GNUT\'s Office',
      'SRC Office',
    ];

    final List<String> images = [
      'assets/images/mayor.png',
      'assets/images/vice.png',
      'assets/images/operator.png',
      'assets/images/office.png',
      'assets/images/gnuts.png',
      'assets/images/transfer.png',
    ];

    // the coordinates for destinations
    final List<LatLng> coordinates = [
      const LatLng(37.7749, -122.4194),
      const LatLng(34.0522, -118.2437),
      const LatLng(40.7128, -74.0060),
      const LatLng(51.5074, -0.1278),
      // Add other coordinates as needed
    ];

    return Scaffold(
      body: CustomGrid(
        items: buildings,
        coordinates: coordinates,
        onTap: (LatLng destinationCoordinates) async {
          // Get the user's current location
          Position position = await _getCurrentPosition();
          LatLng initialCoordinates =
              LatLng(position.latitude, position.longitude);

          // Navigate to MapPage with initial and destination coordinates
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => MapPage(
                initialCoordinates: initialCoordinates,
                destinationCoordinates: destinationCoordinates,
              ),
            ),
          );
        },
        images: images,
        title: 'SRC Complex',
        shortDescription:
            'Get all the information you need about the SRC Complex',
      ),
    );
  }

  Future<Position> _getCurrentPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Check if location services are enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error("Location services are disabled");
    }

    // Check and request location permissions
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error("Location permissions are permanently denied");
    }

    // Get the current position
    Position position = await Geolocator.getCurrentPosition();
    return position;
  }
}
