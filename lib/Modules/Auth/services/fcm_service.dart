import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get_storage/get_storage.dart';

class FcmService {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  final GetStorage _storage = GetStorage();

  Future<void> initialize() async {
    String? token = await _firebaseMessaging.getToken();
    if (token != null) {
      _storage.write('fcm_token', token);
      print("FCM Token: $token");
    } else {
      print("Failed to get FCM Token");
    }
  }

  // Future<String> getFcmToken() async {
  //   // Retrieve the FCM token from GetStorage
  //   final token = _storage.read('fcm_token');
  //   if (token != null) {
  //     return token;
  //   } else {
  //     // If no token is found, return a placeholder or handle the case as needed
  //     return 'no_fcm_token_found';
  //   }
  // }
}
