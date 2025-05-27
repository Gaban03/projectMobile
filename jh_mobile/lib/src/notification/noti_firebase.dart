part of 'noti_libs.dart';

class FirebaseMsg {
  final msgService = FirebaseMessaging.instance;

  initFCM() async {
    await msgService.requestPermission();

    var token = await msgService.getToken();
    print("Token FCM: $token");

    FirebaseMessaging.onBackgroundMessage(handleNotification);
    FirebaseMessaging.onMessage.listen(handleNotification);
  }
}

Future<void> handleNotification(RemoteMessage msg) async {
  await NotiService().initNotification();

  String? title = msg.notification?.title ?? 'Compressor';
  String? body = msg.notification?.body ?? 'Nova notificação recebida';

  await NotiService().ShowNotification(
    title: title,
    body: body,
  );
}
