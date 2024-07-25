import 'package:iegy/features/auth/data/models/user_model.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}
final class ChangeLoginPasswordSuffixIcon extends AuthState {}
final class LoginLoadingState extends AuthState {}
final class RegisterLoadingState extends AuthState {}
final class LoginSuccessState extends AuthState {}
final class RegisterSuccessState extends AuthState {
  final UserModel userModel;
  RegisterSuccessState(this.userModel);
}
final class LoginErrorState extends AuthState {
  final String message;
  LoginErrorState(this.message);
}
final class RegisterErrorState extends AuthState {
  final String errorMessage;
  RegisterErrorState(this.errorMessage);
}