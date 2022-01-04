part of 'GoogleLoginBloc.dart';

@immutable
abstract class GoogleLoginState {}

class GoogleLoginInitial extends GoogleLoginState {}

class LoginSuccess extends GoogleLoginState{
  final GoogleSignInAccount user;

  LoginSuccess(this.user);
}

class LoginFailed extends GoogleLoginState{}