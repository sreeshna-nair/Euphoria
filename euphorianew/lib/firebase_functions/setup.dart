import 'package:firebase_messaging/firebase_messaging.dart';

import 'package:firebase_core/firebase_core.dart';

setupfirebse() async {
  // await Firebase.initializeApp(
  //     options: const FirebaseOptions(
  //         apiKey: "AIzaSyB5-xhySh-5XN26_kOl-m_vgtDFYqJb_W0",
  //         appId: "1:834929120303:android:0901588f3ed1244597e2da",
  //         messagingSenderId: "834929120303",
  //         projectId: "euphoria-935cb"));
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyAbzsYWHilkUoyUefwWv0Coi0CDiWWKPE0",
          appId: "1:519795390123:android:7112071d41f3d581aea9ee",
          messagingSenderId: "519795390123",
          projectId: "euporia-5b422"));

  FirebaseMessaging messaging = FirebaseMessaging.instance;
  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    badge: true,
    sound: true,
  );
  String? token = await FirebaseMessaging.instance.getToken();
  print("Token: $token");
}
