class UserApp {
  final String email;
  final String password;

  UserApp({required this.email, required this.password,});

  Map<String, dynamic> toJson() => {
    'email': email,
    'password': password,
  };
}