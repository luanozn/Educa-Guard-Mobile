import 'package:educa_guardia/controllers/auth_controller.dart';
import 'package:educa_guardia/views/recover_account_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool isKeyboardVisible = MediaQuery.of(context).viewInsets.bottom != 0;

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
                "assets/images/Logo_SimplesBranca.png",
                width: 110,
              ),
              Padding(
                padding:
                    EdgeInsets.all(MediaQuery.of(context).size.width * 0.1),
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
                          prefixIcon: Icon(Icons.person_2_rounded),
                          prefixIconColor: Colors.black,
                          fillColor: Colors.white,
                          filled: true,
                        ),
                      ),
                      const SizedBox(
                        height: 30,
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
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            RecoverAccountScreen()));
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
                      if (!isKeyboardVisible)
                        SizedBox(
                          width: double.maxFinite,
                          child: ElevatedButton(
                            onPressed: () async {
                              try {
                                await AuthController.loginUser(
                                    _usernameController.text,
                                    _passwordController.text);
                              } catch (e) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text("Erro ao logar!")),
                                );
                              }
                            },
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(9))),
                            child: const Text(
                              "Login",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          if (!isKeyboardVisible)
            Positioned(
              bottom: 22,
              left: 0,
              right: 0,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.1),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(7, 98, 217, 1.0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(9))),
                    child: const Text(
                      "Sou Aluno",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          if (isKeyboardVisible)
            Positioned(
              bottom: 22,
              left: 0,
              right: 0,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.1),
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () async {
                          try {
                            await AuthController.loginUser(
                                _usernameController.text,
                                _passwordController.text);
                          } catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("Erro ao logar!")),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(9))),
                        child: const Text(
                          "Login",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromRGBO(7, 98, 217, 1.0),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(9))),
                        child: const Text(
                          "Sou Aluno",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
