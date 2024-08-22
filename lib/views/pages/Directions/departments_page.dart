import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:smart_atu_nav/utils/custom_grid.dart';
import 'package:smart_atu_nav/views/pages/map_page.dart';

class DeparmentPage extends StatelessWidget {
  const DeparmentPage({super.key});

  @override
  Widget build(BuildContext context) {
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
      'assets/images/transfer.png',
      'assets/images/transfer.png',
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
        onTap: (coordinates) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => MapPage(
                initialCoordinates: coordinates,
              ),
            ),
          );
        },
        images: images,
        title: 'Departments',
        shortDescription:
            'Get all the information you need about the Departments',
      ),
    );
  }
}
