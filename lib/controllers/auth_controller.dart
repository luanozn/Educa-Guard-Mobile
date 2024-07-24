import 'dart:convert';

import 'package:educa_guardia/models/login_output.dart';
import 'package:educa_guardia/models/user_app.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthController {
  static Future<LoginOutput?> loginUser(String email, String password) async {
    final url = Uri.parse('http://10.0.2.2:8080/login/enter');

    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        "Authorization": "Bearer eyJhbGciOiAiSFMyNTYiLCAidHlwIjogIkpXVCJ9.eyJzdWIiOiAiZ3VpbGhlcm1lLmR1YXJ0ZSIsICJpc3MiOiAiRUVDSF9HVUFSREBJRkdPSUFOTy5FRFVELkJSIiwgImV4cCI6IDE2ODg3NTI0NDAsICJpZFVzZXIiOiAiMSIsICJwZXJtaXNzaW9uIjogIlJPTEVfQURETUluIn0.WY6RzFGfDsCF9HRR7B0OeJf7zq7DHLixN4FUSv7A3VIeyJhbGciOiAiSFMyNTYiLCAidHlwIjogIkpXVCJ9.eyJzdWIiOiAiZ3VpbGhlcm1lLmR1YXJ0ZSIsICJpc3MiOiAiRUVDSF9HVUFSREBJRkdPSUFOTy5FRFVELkJSIiwgImV4cCI6IDE2ODg3NTI0NDAsICJpZFVzZXIiOiAiMSIsICJwZXJtaXNzaW9uIjogIlJPTEVfQURETUluIn0.WY6RzFGfDsCF9HRR7B0OeJf7zq7DHLixN4FUSv7A3VI"
      },
      body: jsonEncode( UserApp(email: email, password: password)),
    );

    print('Status Code: ${response.statusCode}');
    print('Response Body: ${response.body}');

    if (response.statusCode == 202) {
      var data = json.decode(response.body);
      print("Login realizado com sucesso!");
      return LoginOutput.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Falha ao fazer login: ${response.body}');
    }
  }
}