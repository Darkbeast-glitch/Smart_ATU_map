import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smart_atu_nav/views/pages/get_started_page.dart';
import 'package:smart_atu_nav/views/pages/login_or_register_page.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
// Suggested code may be subject to a license. Learn more: ~LicenseLog:1453180581.
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasData) {
              return const GetStartedPage();
            }
            return const LoginOrRegisterPage();
          }),
    );
  }
}
