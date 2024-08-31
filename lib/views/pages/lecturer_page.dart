import 'package:flutter/material.dart';
import 'package:smart_atu_nav/utils/constants.dart';

class LectureInfoPage extends StatelessWidget {
  const LectureInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Lecturer Track 👨‍🏫",
            style: AppConstants.titleTextStyle,
          ),
          centerTitle: true,
        ),
        body: const Column(children: [
          // Lecturer Info
        ]));
  }
}
