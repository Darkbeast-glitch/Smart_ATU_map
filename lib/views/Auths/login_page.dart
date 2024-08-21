import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:smart_atu_nav/repositories/auth_services.dart';
import 'package:smart_atu_nav/utils/constants.dart';
import 'package:smart_atu_nav/utils/my_buttons.dart';
import 'package:smart_atu_nav/utils/my_textfield.dart';

class LoginPage extends ConsumerWidget {
  LoginPage({super.key});
// Suggested code may be subject to a license. Learn more: ~LicenseLog:2242531192.
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const Gap(50), // Add some spacing from the top
              Image.asset(
                "assets/images/connect.png",
                height: 200,
              ),
              const Gap(20),
              Text(
                "Welcome Back",
                textAlign: TextAlign.center,
                style: AppConstants.titleTextStyle.copyWith(
                  fontSize: 24,
                ),
              ),
              const Gap(5),
              Text(
                "We missed you, please login to continue",
                textAlign: TextAlign.center,
                style: AppConstants.subtitleTextStyle.copyWith(
                  fontSize: 13,
                  color: Colors.black,
                ),
              ),
              const Gap(30),
              MyTextField(
                controller: emailController,
                hintText: 'Email',
                icon: Icons.email,
                obscureText: false,
              ),
              const SizedBox(
                height: 10,
              ),
              MyTextField(
                controller: passwordController,
                hintText: 'Password',
                icon: Icons.lock,
                obscureText: true,
              ),
              const SizedBox(
                height: 5,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Forgot Password?",
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 13,
                        fontFamily: "Product Sans Regular",
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Row(
                children: [
                  Expanded(
                    child: Divider(
                      thickness: 2,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text("Or Sign in with"),
                  ),
                  Expanded(
                    child: Divider(
                      thickness: 2,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),

              // google logo
              GestureDetector(
                onTap: () {
                  ref.read(authSerivceProvider).signInWithGoogle();
                },
                child: Image.asset(
                  "assets/images/google.png",
                  height: 30,
                ),
              ),
              const Gap(30),
              MyButton(
                text: "Sign in ",
                onTap: () {
                  ref.read(authSerivceProvider).signInWithEmailAndPassword(
                      emailController.text, passwordController.text, context);
                },
              ),
              const Gap(30),
            ],
          ),
        ),
      ),
    );
  }
}
