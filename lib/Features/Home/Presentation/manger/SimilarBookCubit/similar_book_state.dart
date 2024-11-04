part of 'similar_book_cubit.dart';

abstract class SimilarBookState {}

final class SimilarBookInitialState extends SimilarBookState {}

final class SimilarBookSuccessState extends SimilarBookState {
  final List<BookModel> books;
  SimilarBookSuccessState({required this.books});
}

final class SimilarBookLoadingState extends SimilarBookState {}

final class SimilarBookFailureState extends SimilarBookState {
  final String errorMassage;
  SimilarBookFailureState({required this.errorMassage});
}
