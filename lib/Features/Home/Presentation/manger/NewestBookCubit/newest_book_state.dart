import 'package:bookly_app/Features/Home/Data/book_model/book_model.dart';

abstract class NewestBookState {}

final class NewestBookInitialState extends NewestBookState {}

final class NewestBookSuccessState extends NewestBookState {
  final List<BookModel> books;
  NewestBookSuccessState({required this.books});
}

final class NewestBookLoadingState extends NewestBookState {}

final class NewestBookFailureState extends NewestBookState {
  final String errorMassage;
  NewestBookFailureState({required this.errorMassage});
}
