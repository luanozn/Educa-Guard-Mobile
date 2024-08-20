import 'dart:io';
import 'package:face_camera/face_camera.dart';
import 'package:flutter/material.dart';

class FaceCameraScreen extends StatefulWidget {
  const FaceCameraScreen({super.key});

  @override
  State<FaceCameraScreen> createState() => _FaceCameraScreenState();
}

class _FaceCameraScreenState extends State<FaceCameraScreen> {
  File? _capturedImage;
  late FaceCameraController controller;

  @override
  void initState() {
    controller = FaceCameraController(
      autoCapture: true,
      defaultCameraLens: CameraLens.front,
      onCapture: (File? image) {
        Navigator.pop(context, image); // Retorna a imagem capturada
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('FaceCamera'),
        ),
        body: SmartFaceCamera(
          controller: controller,
          messageBuilder: (context, face) {
            if (face == null) {
              return _message('Coloque seu rosto na câmera');
            }
            if (!face.wellPositioned) {
              return _message('Centralize seu rosto no quadrado');
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }

  Widget _message(String msg) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 55, vertical: 15),
        child: Text(
          msg,
          textAlign: TextAlign.center,
          style: const TextStyle(
              fontSize: 14, height: 1.5, fontWeight: FontWeight.w400),
        ),
      );

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
