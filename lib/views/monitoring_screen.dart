import 'package:flutter/material.dart';

class MonitoringScreen extends StatelessWidget {
  const MonitoringScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(7, 98, 217, 1.0),
        title: const Text(
          "Relatório de Monitoramento",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.system_security_update_warning_outlined),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Center(
          child: Image.asset("assets/images/relatorio-monitoramento.png"),
        ),
      ),
    );
  }
}
