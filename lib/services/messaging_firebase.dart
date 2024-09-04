import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:smart_atu_nav/main.dart';

class FirebaseApi {
  // creating a firebase messaging instance
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  // function to initialze notification
  Future<void> initNotification() async {
    // request permision from the user
    await _firebaseMessaging.requestPermission();

    // fetch the FCM token for this device
    final fCMToken = await _firebaseMessaging.getToken();

    // let's print the token
    print('Token : $fCMToken');

    initPushNotifications();
  }

  // // functioin to handle the message
  void handleMessage(RemoteMessage? message) {
    //   // if the message is null, do nothing
    if (message == null) return;

    // navigate to new screen when message is reeceived and user taps notifcation
    navigatorKey.currentState
        ?.pushNamed('/notification_screen', arguments: message.data);
  }

  //Functino to iitlaizle the background seetings

  Future initPushNotifications() async {
    // handle notification if the app was terminated and now opened
    FirebaseMessaging.instance.getInitialMessage().then((handleMessage));

    // attach event listners for when a notifciation opens the app
    FirebaseMessaging.onMessageOpenedApp.listen((handleMessage));

    // attach event listners for when a new notification arrives
    FirebaseMessaging.onMessage.listen((handleMessage));
  }
}
