import 'dart:io';

import 'package:face_camera/face_camera.dart';
import 'package:flutter/material.dart';

class RecognitionScreen extends StatefulWidget {
  @override
  State<RecognitionScreen> createState() => _RecognitionScreenState();
}

class _RecognitionScreenState extends State<RecognitionScreen> {
  late FaceCameraController controller;

  @override
  void initState() {
    controller = FaceCameraController(
      autoCapture: true,
      defaultCameraLens: CameraLens.front,
      onCapture: (File? image) {
        
      },
    );
  super.initState();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/foco-da-camera.png',
              width: 200,
            ),
            const Column(
              children: [
                Text(
                  'Digitalizando seu rosto',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 15,),
                Text(
                  'por favor mantenha seu\n rosto no centro da tela',
                  style: TextStyle(
                      fontSize: 16, color: Color.fromARGB(255, 63, 63, 63)),
                ),
              ],
            ),
            SizedBox(
              width: 300,
              height: 60,
              child: ElevatedButton(
                onPressed: () {
                  SmartFaceCamera(
                    controller: controller,
                    message: 'Center your face in the square',
                  );
                },
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(
                      const Color.fromRGBO(4, 75, 217, 1.0)),
                ),
                child: const Text(
                  'Iniciar',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 19
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
