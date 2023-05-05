import 'dart:convert';
import 'dart:io';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

import '../model/user_model.dart';

class UserRepository {
  static String mainUrl =
      Platform.isAndroid ? 'http://192.168.1.7:3000' : 'http://localhost:3000';
  var loginUrl = '$mainUrl/signin';

  final FlutterSecureStorage storage = const FlutterSecureStorage();

  Future<bool> hasToken() async {
    var value = await storage.read(key: 'token');
    if (value != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> persistToken(String token) async {
    await storage.write(key: 'token', value: token);
  }

  Future<void> deleteToken() async {
    storage.delete(key: 'token');
    storage.deleteAll();
  }

  Future<String> login(String email, String password) async {
    final response = await http.post(
      Uri.parse(loginUrl),
      body: jsonEncode({
        'email': email,
        'password': password,
      }),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body)['data'];
      final token = data['token'];
      return token;
    } else {
      final errorBody = json.decode(response.body);
      final errorMessage = errorBody['message'];
      throw Exception(errorMessage ?? "Failed to login");
    }
  }

  Future<User> getUserData(String token) async {
    final response = await http.get(Uri.parse('$mainUrl/me'), headers: {
      'Authorization': 'Bearer $token',
    });

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body)['data'];
      final user = User.fromJson(responseData['user']);
      // print('HALO ${user.name}');
      return user;
    } else {
      throw Exception("Failed to get user data");
    }
  }
}
