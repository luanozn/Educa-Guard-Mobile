import 'package:flutter/material.dart';

class RecoverAccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TextEditingController _emailController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(7, 98, 217, 1.0),
        title: Image.asset(
          'assets/images/Logo_SimplesPreta.png',
          width: 115,
        ),
        centerTitle: true,
      ),
      body:  Center(
        child: Padding(
          padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.08),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Recuperação de Senha',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 23
                ),
              ),
              const SizedBox(height: 15,),
              const Text(
                'Digite seu email para recuperar sua senha',
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 16
                ),
              ),
              const SizedBox(height: 9,),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Insira seu Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  prefixIcon: Icon(Icons.email_rounded),
                  prefixIconColor: Colors.black,
                  fillColor: Colors.white,
                  filled: true,
                ),
              ),
              const SizedBox(height: 35,),
              SizedBox(
                width: double.maxFinite,
                child: ElevatedButton(
                  onPressed: () {}, 
                  style: ButtonStyle(
                    elevation: WidgetStateProperty.all(8.0)
                  ),
                  child: const Text(
                    "Registrar",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
