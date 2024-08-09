
import 'package:educa_guardia/controllers/auth_controller.dart';
import 'package:educa_guardia/views/recover_account_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
Widget build(BuildContext context) {
  return Scaffold(
    body: Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            'assets/images/background_login.jpeg',
            fit: BoxFit.cover,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              "assets/images/Logo_SimplesPreta.png",
              width: 110,
            ),
            Padding(
              padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.1),
              child: Form(
                child: Column(
                  children: [
                    TextFormField(
                      controller: _usernameController,
                      decoration: const InputDecoration(
                        labelText: 'Insira seu Usuário',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                        prefixIcon: Icon(Icons.email_rounded),
                        prefixIconColor: Colors.black,
                        fillColor: Colors.white,
                        filled: true,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      controller: _passwordController,
                      decoration: const InputDecoration(
                          labelText: 'Insira sua Senha',
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          prefixIcon: Icon(Icons.lock),
                          prefixIconColor: Colors.black,
                          fillColor: Colors.white,
                          filled: true),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: const Text(
                              'Cadastrar',
                              style: TextStyle(
                                  color: Colors.white,
                                  decoration: TextDecoration.underline),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => RecoverAccountScreen()));
                            },
                            child: const Text(
                              "Esqueceu a senha?",
                              style: TextStyle(
                                  color: Colors.white,
                                  decoration: TextDecoration.underline),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: double.maxFinite,
                      child: ElevatedButton(
                        onPressed: () async {
                          try {
                            await AuthController.loginUser(_usernameController.text, _passwordController.text);
                          } catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("Erro ao logar 2")),
                            );
                          }
                        },
                        child: const Text(
                          "Login",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    SizedBox(
                      width: double.maxFinite,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/google.png',
                              width: 40,
                            ),
                            const Text(
                              "Inscreva-se no Google",
                              style: TextStyle(
                                  color: Colors.black, fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Positioned(
          bottom: 22,
          left: 0,
          right: 0,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(7, 98, 217, 1.0)
                ),
                child: const Text(
                  "Sou Aluno",
                  style: TextStyle(
                    color: Colors.white
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    ),
  );
}


}
