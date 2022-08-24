part of 'authentication_cubit.dart';

@immutable
abstract class AuthenticationState {}

class AuthenticationInitial extends AuthenticationState {}


class LoginLoadingState extends AuthenticationState {}
class LoginSuccessState extends AuthenticationState {}
class LoginErrorState extends AuthenticationState {}

class SignupLoadingState extends AuthenticationState {}
class SignupSuccessState extends AuthenticationState {}
class SignupErrorState extends AuthenticationState {}


