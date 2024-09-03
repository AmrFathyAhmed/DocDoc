class LoginState {}
class LoginInit extends LoginState{}
class LoginSuccess extends LoginState{}
class LoginLoading extends LoginState{}
class LoginFailure extends LoginState{
  final String errorMessage;

  LoginFailure({required this.errorMessage});
}