import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

const AndroidNotificationChannel channel = AndroidNotificationChannel(
  '123456', // id
  'Vyapari Mithra', // title

  importance: Importance.high,
);

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> demoNotification(RemoteMessage message) async {
  var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
      '123456', 'Vyapari Mithra',
      importance: Importance.max,
      priority: Priority.high,
      ticker: 'Vyapari Mithra ticker');

  var iOSChannelSpecifics = const DarwinNotificationDetails();
  var platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics, iOS: iOSChannelSpecifics);

  await flutterLocalNotificationsPlugin.show(
      0, message.notification!.title, message.from, platformChannelSpecifics,
      payload: 'test payload');
}

setupFirebase() async {
  await Firebase.initializeApp();
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: true, badge: true, sound: true);

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );

  Future<String?> getFCMToken() async {
    String? fcmToken;

    try {
      fcmToken = await FirebaseMessaging.instance.getToken();
    } catch (e) {
      if (kDebugMode) {
        print('Failed to get FCM token: $e');
      }
    }

    return fcmToken;
  }

  FirebaseMessaging.onMessage.listen((RemoteMessage? message) {
    // Get.find<HomeController>().getNotificationsNumber();

    RemoteNotification? notification = message!.notification;
    AndroidNotification? android = message.notification?.android;
// If `onMessage` is triggered with a notification, construct our own
    // local notification to show to users using the created channel.
    if (notification != null && android != null) {
      flutterLocalNotificationsPlugin.show(
        notification.hashCode,
        notification.title,
        notification.body,
        NotificationDetails(
          android: AndroidNotificationDetails(
            channel.id,
            channel.name,
            channelDescription: channel.description,
            icon: "@mipmap/ic_launcher",
            playSound: true,
          ),
        ),
      );
    }
    // String notifType = message.data["Type"];
    // if (notifType == "seen") {
    //   FlutterLocalNotificationsPlugin().cancel(message.notification.hashCode);
    // }
  });
}

Future showNotificationWithDefaultSound(String title, String message) async {
  var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
      'Vyapari Mithra', 'Vyapari Mithra',
      importance: Importance.max, priority: Priority.high);

  var iOSPlatformChannelSpecifics = const DarwinNotificationDetails();
  var platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iOSPlatformChannelSpecifics);
  await flutterLocalNotificationsPlugin.show(
    1,
    title,
    'message',
    platformChannelSpecifics,
    payload: 'Default_Sound',
  );
}

Future<void> subsctibeTopics(List<String> topics) async {
  for (String topic in topics) {
    await FirebaseMessaging.instance.subscribeToTopic(topic);
  }
}

Future<void> unSubsctibeTopics(List<String> topics) async {
  for (String topic in topics) {
    await FirebaseMessaging.instance.unsubscribeFromTopic(topic);
  }
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  if (kDebugMode) {
    print("Messages $message.notification");
  }
  //demoNotification(message);
  //_showNotificationWithDefaultSound("Hello", "Mats App");
  //await Firebase.initializeApp();
}
