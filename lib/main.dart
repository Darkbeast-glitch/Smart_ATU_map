import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_atu_nav/utils/constants.dart';
import 'package:smart_atu_nav/firebase_options.dart';
import 'package:smart_atu_nav/views/Auths/auth_page.dart';
// import 'package:smart_atu_nav/pages/get_started_page.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: true)
          .copyWith(primaryColor: AppConstants.primaryColor),
      title: "Smart ATU Nav",
// Suggested code may be subject to a license. Learn more: ~LicenseLog:649947031.
// Suggested code may be subject to a license. Learn more: ~LicenseLog:582611679.
      home: const AuthPage()
    );
  }
}
