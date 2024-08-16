import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:smart_atu_nav/utils/constants.dart';
import 'package:smart_atu_nav/utils/my_buttons.dart';
import 'package:smart_atu_nav/views/pages/home_page.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 226, 238, 158),
              Color.fromARGB(255, 162, 185, 163),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // atu logo goes
              const Spacer(),
              Image.asset(
                "assets/images/connect.png",
                width: 300,
              ),
              Image.asset(
                "assets/images/logo.png",
                width: 50,
              ),
              const Spacer(),

              // smart Campus text goes here
              Text(
                textAlign: TextAlign.center,
                "Create a smart campus\nexperience with us",
                style: AppConstants.titleTextStyle.copyWith(
                  fontSize: 30,
                ),
              ),
              const Gap(10),
              Text(
                  "Get the shortest directions to your destination ,\nYou're new to campus, let's show you around ",
                  textAlign: TextAlign.center,
                  style: AppConstants.subtitleTextStyle.copyWith(
                    fontSize: 13,
                    color: Colors.black,
                  )),
              const SizedBox(
                height: 20,
              ),

              // button
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: MyButton(
                  text: "Get Started",
                  onTap: () {
                    Navigator.of(context).push(
                      // navigation to the Homepage
                      MaterialPageRoute(builder: (context) => const HomePage()),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
