import 'dart:io';

import 'package:educa_guardia/models/login_output.dart';

class FakeAuthController{

  static bool recFacial(String username, File image) {
    if(username == 'error') {
      return false;
    }
    return true;
  }

  Future<void> recoveryPassword(String email) async {
    if(email == 'exception') {
      throw Exception('Falha ao enviar email de recuperação');
    }
  }

  static Future<LoginOutput?> loginUser(String username, String password) async {
    if(username == 'usuario_incorreto') {
      throw Exception('Não foi possível realizar o login');
    }
  }
}