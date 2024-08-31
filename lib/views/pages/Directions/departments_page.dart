import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:smart_atu_nav/providers/get_current_position_provider.dart';
import 'package:smart_atu_nav/utils/custom_grid.dart';
import 'package:smart_atu_nav/views/pages/map_page.dart';

class DeparmentPage extends ConsumerWidget {
  const DeparmentPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final positionAsyncValue = ref.watch(getCurrentPositioniProvider);

    final List<String> buildings = [
      'Computer Science Dep.',
      'Engineering Dep.',
      'HICM Dep.',
      'Marketing Dep.',
      'Accounting Dep.',
      'Fashion Dep.',
      'Electrical Dep.',
      'Civil Eng Dep.',
      'Interior Design Dep.',
      'Building Dep.',
      'Procuments Dep.'
    ];

    final List<String> images = [
      'assets/images/com_dep.png',
      'assets/images/eng_dep.png',
      'assets/images/hcim.png',
      'assets/images/mar_dep.png',
      'assets/images/gnuts.png',
      'assets/images/fash.png',
      'assets/images/elec.png',
      'assets/images/transfer.png',
      'assets/images/interior-design.png',
      'assets/images/skyscraper.png',
      'assets/images/procurement.png',
    ];

    // the cordinates
    final List<LatLng> coordinates = [
      const LatLng(37.7749, -122.4194),
      const LatLng(34.0522, -118.2437),
      const LatLng(40.7128, -74.0060),
      const LatLng(51.5074, -0.1278),
    ];

    return Scaffold(
      body: positionAsyncValue.when(
        data: (position) {
          return CustomGrid(
            items: buildings,
            coordinates: coordinates,
            onTap: (LatLng destinationCoordinates) {
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
            title: 'Departments',
            shortDescription:
                'Get all the information you need about all the Departments on Campus',
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
      ),
    );
  }
}
