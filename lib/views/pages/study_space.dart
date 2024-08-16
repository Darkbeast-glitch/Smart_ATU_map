import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:smart_atu_nav/utils/constants.dart';

class StudySpace extends StatelessWidget {
  const StudySpace({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Study Space",
          style: AppConstants.titleTextStyle,
        ),
        centerTitle: true,
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Icon(Icons.person),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // text saying what this page does
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Looking for a place to study on campus?\nChoose a study space",
                  style: AppConstants.subtitleTextStyle,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),

          GFCard(
            image: Image.asset("assets/images/studyplace.jpeg"),
            showImage: true,
          )
        ],
      ),
    );
  }
}
