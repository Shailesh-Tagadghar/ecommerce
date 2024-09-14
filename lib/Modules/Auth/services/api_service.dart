import 'dart:convert';
import 'dart:io';
import 'package:ecommerce/Modules/Auth/services/fcm_service.dart';
import 'package:ecommerce/Utils/Constants/api_constants.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

class ApiService {
  static const String baseUrl = 'http://fashionapp.idealake.com/api';

  // Register a user
  static Future<void> registerUser(
      Map<String, dynamic> registrationData) async {
    final url = Uri.parse('$baseUrl/${ApiConstants.register}');
    final storage = GetStorage();
    final fcmToken = storage.read('fcm_token');

    try {
      print('Sending request to $url with data: $registrationData');

      var request = http.MultipartRequest('POST', url)
        ..fields['name'] = registrationData['name']
        ..fields['email'] = registrationData['email']
        ..fields['password'] = registrationData['password']
        ..fields['number'] = registrationData['number']
        ..fields['gender'] = registrationData['gender']
        ..fields['address'] = registrationData['address']
        ..fields['fcm_token'] = fcmToken ?? 'dummy_fcm_token'
        ..fields['login_type'] = registrationData['login_type'];

      // Attach the image file
      // if (registrationData['image'] != null) {
      //   var imageFile = File(registrationData['image']);
      //   request.files
      //       .add(await http.MultipartFile.fromPath('image', imageFile.path));
      // }
      if (registrationData['image'] != null) {
        var imageFile = File(registrationData['image']);
        var imageExtension = imageFile.path.split('.').last.toLowerCase();
        var mimeType;

        // Set MIME type based on file extension
        if (imageExtension == 'jpg' || imageExtension == 'jpeg') {
          mimeType = 'image/jpeg';
        } else if (imageExtension == 'png') {
          mimeType = 'image/png';
        } else {
          throw Exception('Unsupported image format');
        }

        request.files.add(await http.MultipartFile.fromPath(
          'image',
          imageFile.path,
          contentType: MediaType.parse(mimeType),
        ));
      }

      var response = await request.send().timeout(
          Duration(seconds: 30)); // Adding a timeout for network requests

      response.stream.transform(utf8.decoder).listen((value) {
        print('Response body: $value');
        if (response.statusCode == 200) {
          print('User registered successfully');
        } else {
          print('Server returned an error: ${response.statusCode}');
          throw Exception('Failed to register user');
        }
      });
    } catch (e) {
      print('Error during registration: $e');
      throw Exception('Failed to register user');
    }
  }

  // Get FCM token using FcmService
  static Future<String> getFcmToken() async {
    final fcmService = FcmService();
    return await fcmService.getFcmToken();
  }

  Future<void> loginUser(
      String email, String password, String? fcmToken) async {
    final response = await http.post(
      Uri.parse('$baseUrl/${ApiConstants.login}'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'email': email,
        'password': password,
        'fcm_token': fcmToken,
      }),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to login: ${response.statusCode}');
    }
  }
}
