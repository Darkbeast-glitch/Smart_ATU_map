import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:smart_atu_nav/services/messaging_firebase.dart';
import 'package:wiredash/wiredash.dart';
import 'firebase_options.dart';
import 'routes/routes.dart'; // Import your routes
import 'utils/constants.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseApi().initNotification();
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
    return Wiredash(
      projectId: 'smartatu-x7p4tzj',
      secret: 'zvJABpvsVrQekeCErro6FmpCdH9XZcC4',
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light(useMaterial3: true)
            .copyWith(primaryColor: AppConstants.primaryColor),
        navigatorKey: navigatorKey,
        title: "Smart ATU Nav",
        initialRoute: '/', // Set the initial route
        routes: Routes.getRoutes(), // Use the routes from routes.dart
      ),
    );
  }
}
