import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dw9_delivery_app/app/core/extensions/unauthorized_exception.dart';
import 'package:dw9_delivery_app/app/pages/auth/login/login_state.dart';
import 'package:dw9_delivery_app/app/repositories/auth/auth_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends Cubit<LoginState> {
  final AuthRepository _authRepository;

  LoginController(this._authRepository) : super(const LoginState.initial());

  Future<void> login(String email, String password) async {
    emit(state.copyWith(status: LoginStatus.login));
    try {
      final authModel = await _authRepository.login(email, password);
      final sharedPreferences = await SharedPreferences.getInstance();
      sharedPreferences.setString('accessToken', authModel.accessToken);
      sharedPreferences.setString('refreshToken', authModel.refreshToken);
      emit(state.copyWith(status: LoginStatus.success));
    } on UnauthorizedException catch (e, s) {
      emit(state.copyWith(
          status: LoginStatus.error,
          errorMessage: 'E-mail ou senha inválidos.'));
      log('E-mail ou senha inválidos.', error: e, stackTrace: s);
    } catch (e, s) {
      emit(state.copyWith(
          status: LoginStatus.error, errorMessage: 'Erro ao realizar login.'));
      log('Erro ao realizar o login.', error: e, stackTrace: s);
    }
  }
}
