import 'package:flutter/material.dart';
import 'package:smart_atu_nav/utils/customer_grid.dart';

class SrcComplexPage extends StatelessWidget {
  const SrcComplexPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> buildings = [
      'President\'s office',
      'Vice Pres. Office',
      'Registrar\'s Office',
      'SRC Office',
    ];

    final List<String> images = [
      'assets/images/search.png',
      'assets/images/search.png',
      'assets/images/search.png',
      'assets/images/search.png',
    ];
    return Scaffold(
      body: CustomGrid(
        items: buildings,
        images: images,
        title: 'SRC Complex',
        short_description:
            'Get all the information you need about the SRC Complex',
      ),
    );
  }
}
