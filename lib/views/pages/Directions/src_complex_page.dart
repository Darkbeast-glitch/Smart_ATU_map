import 'package:flutter/material.dart';
import 'package:smart_atu_nav/utils/custom_grid.dart';
import 'package:smart_atu_nav/views/pages/home_page.dart';

class SrcComplexPage extends StatelessWidget {
  const SrcComplexPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> buildings = [
      'President\'s office',
      'Vice Pres. Office',
      'Gen. Secreatey Office',
      'Pro\'s Office',
      'GNUT\'s Office',
      'SRC Office',
    ];

    final List<String> images = [
      'assets/images/mayor.png',
      'assets/images/vice.png',
      'assets/images/search.png',
      'assets/images/search.png',
      'assets/images/search.png',
      'assets/images/search.png',
    ];
    return Scaffold(
      body: CustomGrid(
        items: buildings,
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const HomePage(),
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
