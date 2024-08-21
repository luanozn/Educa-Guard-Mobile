import 'dart:convert';
import 'dart:io';

import 'package:educa_guardia/models/login_output.dart';
import 'package:educa_guardia/models/user_app.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';

class AuthController {
  static Future<void> recoveryPassword(String email) async {
    final url = Uri.parse(
        'https://educaguard.up.railway.app/api/recover/recover-account/$email');

    final response = await http.get(url);

    print('Status Code: ${response.statusCode}');
    print('Response Body: ${response.body}');

    if (response.statusCode == 200) {
      print("Email de recuperação enviado com sucesso!");
    } else {
      throw Exception('Falha ao enviar email de recuperação: ${response.body}');
    }
  }

  static Future<LoginOutput?> loginUser(
      String username, String password) async {
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

  Future<void> uploadImage(String username, File image) async {
    final url = Uri.parse('.......');

    var request = http.MultipartRequest('POST', url);
    request.files.add(await http.MultipartFile.fromPath('image', image.path));

    var response = await request.send();

    if (response.statusCode == 200) {
      print('Upload realizado com sucesso');
    } else {
      print('Falha no upload: ${response.statusCode}');
    }
  }
}
