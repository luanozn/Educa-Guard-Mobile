import 'package:educa_guardia/models/login_output.dart';
import 'package:educa_guardia/views/widgets/menu_icons.dart';
import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {
  final LoginOutput user;

  const MenuScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    String title = '';
    List<Widget> firstIcons = [];
    List<Widget> secondIcons = [];

    if (user.role == 'ROLE_ADMIN') {
      title = 'Gestor';
      firstIcons = [HomeIcon(), ReportIcon()];
      secondIcons = [MessagesIcon(), EmergencyIcon()];
    } else if (user.role == 'ROLE_PROFESSOR') {
      title = 'Professor';
      firstIcons = [HomeIcon(), PresenceListIcon()];
      secondIcons = [MessagesIcon()];
    } else if (user.role == 'ROLE_OPERADOR_MONITORAMENTO') {
      title = 'Operador de Monitoramento';
      firstIcons = [HomeIcon(), MonitoringIcon()];
      secondIcons = [MessagesIcon()];
    } else if (user.role == 'ROLE_SEGURANCA') {
      title = 'Segurança';
      firstIcons = [HomeIcon(), MessagesIcon()];
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Bem vindo $title'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/menu.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: firstIcons,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: secondIcons,
            ),
          ],
        ),
      ),
    );
  }
}