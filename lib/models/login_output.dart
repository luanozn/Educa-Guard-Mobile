class LoginOutput {
  final int idUser;
  final String token;
  final String role;

  LoginOutput({required this.idUser, required this.token, required this.role});

  factory LoginOutput.fromJson(Map<String, dynamic> json) {
    return LoginOutput(
      idUser: json['idUser'],
      token: json['token'],
      role: json['role'],
    );
  }
}