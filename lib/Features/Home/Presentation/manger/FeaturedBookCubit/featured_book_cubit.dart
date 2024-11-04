import 'package:bookly_app/Features/Home/Data/book_model/book_model.dart';
import 'package:bookly_app/Features/Home/Repository/home_repository_impl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'featured_book_state.dart';

class FeaturedBookCubit extends Cubit<FeaturedBookState> {
  FeaturedBookCubit() : super(FeaturedBookInitialState());

  void fetchFeaturedBooks() {
    emit(FeaturedBookLoadingState());
    HomeRepositoryImpl().fetchHomeBooks(content: 'programming').then((value) {
      value.fold(
        (error) => emit(
          FeaturedBookFailureState(
            errorMassage: error.errorMessage,
          ),
        ),
        (data) => emit(
          FeaturedBookSuccessState(
            books: data,
          ),
        ),
      );
    });
  }
}
