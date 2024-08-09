import 'dart:convert';

import 'package:educa_guardia/models/login_output.dart';
import 'package:educa_guardia/models/user_app.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthController {
  static Future<LoginOutput?> loginUser(String username, String password) async {
    final url = Uri.parse('https://educaguard.up.railway.app/api/login/enter');

    final user = UserApp(username: username, password: password);

    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      },
      body: jsonEncode(user.toJson()), 
    );

    print('Status Code: ${response.statusCode}');
    print('Response Body: ${response.body}');

    if (response.statusCode == 202) {
      var data = json.decode(response.body);
      print("Login realizado com sucesso!");
      return LoginOutput.fromJson(data);
    } else {
      throw Exception('Falha ao fazer login: ${response.body}');
    }
}

}