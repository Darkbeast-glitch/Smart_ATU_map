import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:smart_atu_nav/providers/bottom_navigation_state.dart';
import 'package:smart_atu_nav/providers/map_controller_provider.dart';
import 'package:smart_atu_nav/utils/constants.dart';
import 'package:smart_atu_nav/views/pages/home_page.dart';
import 'package:smart_atu_nav/views/pages/profile_page.dart';

class MapPage extends ConsumerWidget {
  final LatLng initialCoordinates;

  const MapPage({super.key, required this.initialCoordinates});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mapController = ref.watch(mapControllerProvider);
    final currentIndex = ref.watch(currentPageIndexProvider);

    // Initial markers including the initialCoordinates marker
    Set<Marker> markers = {
      Marker(
        markerId: const MarkerId('initialCoordinates'),
        position: initialCoordinates,
        infoWindow: const InfoWindow(
          title: 'Accra Technical University',
        ),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
      ),
    };

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text(
          'Quick Map',
          style: AppConstants.titleTextStyle,
        ),
        centerTitle: true,
      ),
      body: GoogleMap(
        onMapCreated: (GoogleMapController controller) {
          ref.read(mapControllerProvider.notifier).state = controller;
        },
        initialCameraPosition: CameraPosition(
          target: initialCoordinates,
          zoom: 13.0,
        ),
        markers: markers,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Position position = await currentPosition();
          LatLng newPosition = LatLng(position.latitude, position.longitude);

          // Animate the camera to the new position
          mapController?.animateCamera(
            CameraUpdate.newCameraPosition(
              CameraPosition(
                target: newPosition,
                zoom: 16.0,
              ),
            ),
          );

          // Add the new marker for current location
          markers.add(
            Marker(
              markerId: const MarkerId("Current Location"),
              position: newPosition,
              infoWindow: const InfoWindow(
                title: 'Current Location',
              ),
              icon: BitmapDescriptor.defaultMarkerWithHue(
                  BitmapDescriptor.hueGreen),
            ),
          );

          // Update the map with the new marker
          ref.read(mapControllerProvider.notifier).state = mapController;
        },
        child: const Icon(Icons.my_location),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          ref.read(currentPageIndexProvider.notifier).state = index;
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
            );
          } else if (index == 2) {
            // Navigate to the profile page
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>  ProfilePage()),
            );
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Map',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  Future<Position> currentPosition() async {
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
