part of 'featured_book_cubit.dart';

abstract class FeaturedBookState {}

final class FeaturedBookInitialState extends FeaturedBookState {}

final class FeaturedBookSuccessState extends FeaturedBookState {
  final List<BookModel> books;
  FeaturedBookSuccessState({required this.books});
}

final class FeaturedBookLoadingState extends FeaturedBookState {}

final class FeaturedBookFailureState extends FeaturedBookState {
  final String errorMassage;
  FeaturedBookFailureState({required this.errorMassage});
}
