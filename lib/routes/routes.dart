import 'package:flutter/material.dart';
import 'package:smart_atu_nav/views/Auths/auth_page.dart';
import 'package:smart_atu_nav/views/pages/get_started_page.dart';
import 'package:smart_atu_nav/views/pages/notification_event_page.dart';

class Routes {
  static Map<String, WidgetBuilder> getRoutes() {
    return {
      '/': (context) => const AuthPage(),
      '/getStarted': (context) => const GetStartedPage(),
      '/notification_screen':(context) => const NotificationAndEventPage(),
      // Add other routes here
    };
  }
}
