import 'package:flutter/material.dart';
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

    // the cordinates
    final List<LatLng> coordinates = [
      const LatLng(37.7749, -122.4194),
      const LatLng(34.0522, -118.2437),
      const LatLng(40.7128, -74.0060),
      const LatLng(51.5074, -0.1278),
    ];

    return Scaffold(
      body: CustomGrid(
        items: buildings,
        coordinates: coordinates,
        onTap: (LatLng coordinates) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => MapPage(
                initialCoordinates: coordinates,
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
}
