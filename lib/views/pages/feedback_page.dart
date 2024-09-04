import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:smart_atu_nav/utils/constants.dart';
import 'package:smart_atu_nav/utils/my_buttons.dart';
import 'package:wiredash/wiredash.dart';

class FeedbackPage extends StatelessWidget {
  FeedbackPage({super.key});

  final TextEditingController fullnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Feedback',
          style: AppConstants.titleTextStyle,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                textAlign: TextAlign.center,
                style: AppConstants.subtitleTextStyle,
                "Thanks for using Smart ATU \nYour feedback helps us to improve our app",
              ),
              const Gap(20),
              Image.asset(
                "assets/images/logo.png",
                width: 180,
                height: 180,
              ),
              const Gap(5),
              const Text("Smart ATU", style: AppConstants.titleTextStyle),
              const Gap(10),
              const Text(
                textAlign: TextAlign.center,
                "Click the button below to give detailed feedback using a screenshot, on what you want us to improve",
                style: AppConstants.subtitleTextStyle,
              ),
              const Gap(20), // Add some gap before the button
              MyButton(
                text: "Click to give detailed feedback",
                onTap: () {
                  // call the wiredash
                  Wiredash.of(context).show(inheritMaterialTheme: true);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
