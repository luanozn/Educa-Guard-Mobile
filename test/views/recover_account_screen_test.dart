import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mocktail/mocktail.dart';

import 'fake_auth_controller.dart';

void main() {
  test('Deve validar e-mail corretamente', () {
    final screenState = _RecoverAccountScreenState();

    expect(screenState._validateEmail('teste@example.com'), isNull);

    expect(screenState._validateEmail('invalid-email'), 'Por favor, insira um e-mail válido');
    expect(screenState._validateEmail(''), 'Por favor, insira seu e-mail');
  });

  test('Deve chamar AuthController.recoveryPassword e mostrar diálogo de sucesso', () async {
    final mockAuthController = FakeAuthController();
    when(mockAuthController.recoveryPassword(any)).thenAnswer((_) async {});

    final screenState = _RecoverAccountScreenState();
    screenState._emailController.text = 'teste@example.com';

    await screenState._validateAndSubmit();

    verify(mockAuthController.recoveryPassword('teste@example.com')).called(1);
  });

  test('Deve mostrar diálogo de erro em caso de falha na recuperação de senha', () async {
    final mockAuthController = FakeAuthController();
    when(mockAuthController.recoveryPassword(any)).thenThrow(Exception('Erro'));

    final screenState = _RecoverAccountScreenState();
    screenState._emailController.text = 'teste@example.com';

    verify(mockAuthController.recoveryPassword('teste@example.com')).called(1);
  }
}
