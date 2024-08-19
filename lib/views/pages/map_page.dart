import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
        markers: {
          Marker(
            markerId: MarkerId('initialCoordinates'),
            position: initialCoordinates,
            infoWindow: const InfoWindow(
              title: 'Accra Technical University',
            ),
            icon: BitmapDescriptor.defaultMarkerWithHue(
                BitmapDescriptor.hueGreen),
          ),
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (mapController != null) {
            mapController.animateCamera(
              CameraUpdate.newCameraPosition(
                CameraPosition(
                  target: initialCoordinates,
                  zoom: 16.0,
                ),
              ),
            );
          }
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
              MaterialPageRoute(builder: (context) => const ProfilePage()),
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
}
