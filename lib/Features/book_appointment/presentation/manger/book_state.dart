class BookState {}
class BookInit extends BookState{}
class BookSuccess extends BookState{}
class BookLoading extends BookState{}
class BookFailure extends BookState{
  final String errorMessage;

  BookFailure({required this.errorMessage});
}