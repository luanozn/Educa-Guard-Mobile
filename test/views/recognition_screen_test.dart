import 'package:educa_guardia/models/login_output.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:educa_guardia/views/recognition_screen.dart';
import 'package:educa_guardia/views/chat.dart';
import 'package:mocktail/mocktail.dart';

import 'fake_auth_controller.dart';

void main() {
  setUpAll(() {
    when(() => FakeAuthController.loginUser(any(), any())).thenAnswer(
          (invocation) async {
        final username = invocation.positionalArguments[0] as String;
        if (username == 'exception') {
          throw Exception('Não foi possível realizar o login');
        }
        return LoginOutput(idUser: 1, token: '', role: '');
      },
    );

    when(() => FakeAuthController.recFacial(any(), any())).thenAnswer(
          (invocation) async {
        final username = invocation.positionalArguments[0] as String;
        if (username == 'exception') {
          throw Exception('Não foi possível realizar o login');
        }
        return LoginOutput(idUser: 1, token: '', role: '');
      },
    );
  });

  testWidgets('Deve renderizar a tela de reconhecimento facial corretamente', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: RecognitionScreen(),
      ),
    );

    // Verifica a renderização dos elementos
    expect(find.text('Digitalizando seu rosto'), findsOneWidget);
    expect(find.text('Por favor, mantenha seu\n rosto no centro da tela'), findsOneWidget);
    expect(find.byType(TextField), findsOneWidget);
    expect(find.byType(ElevatedButton), findsOneWidget);
    expect(find.byType(Image), findsNWidgets(2)); // Imagem padrão e imagem capturada
  });

  testWidgets('Deve navegar para Chat se o reconhecimento facial for bem-sucedido', (WidgetTester tester) async {

    // Configura o mock para simular sucesso no reconhecimento facial
    when(FakeAuthController.recFacial(any, any)).thenAnswer((_) async => true);

    await tester.pumpWidget(
      MaterialApp(
        home: RecognitionScreen(),
        navigatorObservers: [mockObserver],
      ),
    );

    // Simula a entrada de texto e a ação do botão
    await tester.enterText(find.byType(TextField), 'usuario_teste');
    await tester.tap(find.byType(ElevatedButton));
    await tester.pumpAndSettle();

    // Verifica a navegação para a tela de Chat
    expect(find.byType(Chat), findsOneWidget);
  });
