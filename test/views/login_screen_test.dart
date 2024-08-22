import 'dart:io';

import 'package:educa_guardia/models/login_output.dart';
import 'package:educa_guardia/views/auth/login_screen.dart';
import 'package:educa_guardia/views/menu_screen.dart';
import 'package:educa_guardia/views/recover_account_screen.dart';
import 'package:educa_guardia/views/recognition_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
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

    when(() => FakeAuthController.recoveryPassword(any())).thenAnswer(
          (invocation) async {
        final email = invocation.positionalArguments[0] as String;
        if (email == 'exception') {
          throw Exception('Falha ao enviar email de recuperação');
        }
      },
    );
  });

  testWidgets('Deve renderizar o logo', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: LoginScreen()));

    expect(find.byType(Image), findsOneWidget);
    expect(find.byType(TextFormField), findsNWidgets(2));
    expect(find.text('Insira seu Usuário'), findsOneWidget);
    expect(find.text('Insira sua Senha'), findsOneWidget);
  });

  testWidgets('Deve navegar para RecoverAccountScreen quando clicar em "Esqueceu a senha?"', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: LoginScreen()));

    await tester.tap(find.text('Esqueceu a senha?'));
    await tester.pumpAndSettle();

    expect(find.byType(RecoverAccountScreen), findsOneWidget);
  });

  testWidgets('Deve exibir erro de login quando credenciais estão incorretas', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: LoginScreen()));

    await tester.enterText(find.byType(TextFormField).at(0), 'usuario_incorreto');
    await tester.enterText(find.byType(TextFormField).at(1), 'senha_incorreta');

    await tester.tap(find.byType(ElevatedButton).first);
    await tester.pump();

    expect(find.text('Erro'), findsOneWidget);
    expect(find.text('Insira as informações de login!'), findsOneWidget);
  });

  testWidgets('Deve navegar para MenuScreen quando o login for bem-sucedido', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: LoginScreen()));

    await tester.enterText(find.byType(TextFormField).at(0), 'correct_username');
    await tester.enterText(find.byType(TextFormField).at(1), 'correct_password');

    await tester.tap(find.byType(ElevatedButton).first);
    await tester.pumpAndSettle();

    expect(find.byType(MenuScreen), findsOneWidget);
  });

  testWidgets('Deve navegar para RecognitionScreen ao clicar em "Sou Aluno"', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: LoginScreen()));

    await tester.tap(find.text('Sou Aluno'));
    await tester.pumpAndSettle();

    expect(find.byType(RecognitionScreen), findsOneWidget);
  });

  test('Testar recFacial com sucesso', () async {
    final result = await FakeAuthController.recFacial('user1', File('path/to/image'));
    expect(result, true);
  });

  test('Testar recFacial com falha', () async {
    final result = await FakeAuthController.recFacial('error', File('path/to/image'));
    expect(result, false);
  });
}
