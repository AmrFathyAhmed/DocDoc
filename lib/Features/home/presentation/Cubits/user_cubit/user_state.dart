import '../../../data/models/user_model.dart';

class UserState {}
class UserInit extends UserState{}
class UserSuccess extends UserState{
  final List<User> user;
  UserSuccess({required this.user});
}
class UserLoading extends UserState{}
class UserFailure extends UserState{
  final String errorMessage;

  UserFailure({required this.errorMessage});
}