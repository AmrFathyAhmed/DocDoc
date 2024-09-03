class SignUpState {}
class SignUpInit extends SignUpState{}
class SignUpSuccess extends SignUpState{}
class SignUpLoading extends SignUpState{}
class SignUpFailure extends SignUpState{
  final String errorMessage;

  SignUpFailure({required this.errorMessage});
}