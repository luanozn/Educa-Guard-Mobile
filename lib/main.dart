import 'package:educa_guardia/views/auth/login_screen.dart';
import 'package:educa_guardia/views/recognition_screen.dart';
import 'package:educa_guardia/views/recover_account_screen.dart';
import 'package:face_camera/face_camera.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); //Add this

  await FaceCamera.initialize(); //Add thi

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
       
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: LoginScreen()
    );
  }
}