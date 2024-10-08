import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:smart_atu_nav/utils/constants.dart';

class CustomGrid extends StatelessWidget {
  final List<String> items;
  final List<String> images;
  final List<LatLng> coordinates;
  final String shortDescription;
  final String title;
  final void Function(LatLng coordinate)? onTap;

  const CustomGrid({
    super.key,
    required this.items,
    required this.images,
    required this.coordinates,
    required this.title,
    required this.shortDescription,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: AppConstants.titleTextStyle.copyWith(
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            // Simple description
            Text(textAlign: TextAlign.center, shortDescription),
            const Gap(10),

            // Wrap GridView in Flexible to ensure it has proper constraints
            Flexible(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      if (onTap != null) {
                        onTap!(coordinates[index]);
                      }
                    },
                    child: Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            images[index],
                            height: 80,
                            width: 80,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return const Icon(Icons.error, size: 80);
                            },
                          ),
                          const SizedBox(height: 10),
                          Text(items[index]),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
