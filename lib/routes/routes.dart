import 'package:flutter/material.dart';
import 'package:smart_atu_nav/views/Auths/auth_page.dart';
import 'package:smart_atu_nav/views/pages/get_started_page.dart';

class Routes {
  static Map<String, WidgetBuilder> getRoutes() {
    return {
      '/': (context) => AuthPage(),
      '/getStarted': (context) => GetStartedPage(),
      // Add other routes here
    };
  }
}