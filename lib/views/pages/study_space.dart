import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:smart_atu_nav/providers/get_current_position_provider.dart';
import 'package:smart_atu_nav/utils/custom_grid.dart';
import 'package:smart_atu_nav/views/pages/map_page.dart';

class StudySpace extends ConsumerWidget {
  const StudySpace({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final positionAsyncValue = ref.watch(getCurrentPositioniProvider);

    final List<String> buildings = [
      'Learning Center',
      'IT Block Space',
      'WoCom Office',
      //   'Finacial Office',
      //   'PRO\'s Office',
      //   'GNUT\'s Office',
      //   'SRC Conference Room',
    ];

    final List<String> images = [
      'assets/images/mayor.png',
      'assets/images/vice.png',
      'assets/images/operator.png',
      // 'assets/images/office.png',
      // 'assets/images/gnuts.png',
      // 'assets/images/transfer.png',
      // 'assets/images/transfer.png',
      // 'assets/images/transfer.png',
      // 'assets/images/transfer.png',
    ];

    // Coordinates for destinations
    final List<LatLng> coordinates = [
      const LatLng(5.5533, -0.20580),
      const LatLng(34.0522, -118.2437),
      const LatLng(40.7128, -74.0060),
      const LatLng(51.5074, -0.1278),
      // Add other coordinates as needed
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
            title: 'Study Space',
            shortDescription:
                'Looking for a place to study on Campus? Check out our study space',
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
      ),
    );
  }
}
