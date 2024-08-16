import 'package:flutter/material.dart';

class CustomGrid extends StatelessWidget {
  final List<String> items;
  final List<String> images;
  final String short_description;
  final String title;

  const CustomGrid(
      {Key? key,
      required this.items,
      required this.images,
      required this.title,
      required this.short_description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            // simple description
            Text(short_description),

            // grid view setup
            GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: items.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        images[index],
                        height: 100,
                        width: 100,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(height: 10),
                      Text(items[index]),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
