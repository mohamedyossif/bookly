import 'package:bookly_app/Features/Home/Data/book_model/book_model.dart';
import 'package:bookly_app/Features/Home/Repository/home_repository_impl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'similar_book_state.dart';

class SimilarBookCubit extends Cubit<SimilarBookState> {
  SimilarBookCubit() : super(SimilarBookInitialState());
  void fetchSimilarBooks({required content}) {
    emit(SimilarBookLoadingState());
    HomeRepositoryImpl().fetchHomeBooks(content: content).then((value) {
      value.fold(
        (error) => emit(
          SimilarBookFailureState(
            errorMassage: error.errorMessage,
          ),
        ),
        (data) => emit(
          SimilarBookSuccessState(
            books: data,
          ),
        ),
      );
    });
  }
}
