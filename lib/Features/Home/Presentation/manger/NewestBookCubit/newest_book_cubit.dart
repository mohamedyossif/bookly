import 'package:bookly_app/Features/Home/Presentation/manger/NewestBookCubit/newest_book_state.dart';
import 'package:bookly_app/Features/Home/Repository/home_repository_impl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewestBookCubit extends Cubit<NewestBookState> {
  NewestBookCubit() : super(NewestBookInitialState());

  void fetchNewestBooks() {
    emit(NewestBookLoadingState());
    HomeRepositoryImpl().fetchHomeBooks(content: 'Data science').then((value) {
      value.fold(
        (error) => emit(
          NewestBookFailureState(
            errorMassage: error.errorMessage,
          ),
        ),
        (data) => emit(
          NewestBookSuccessState(
            books: data,
          ),
        ),
      );
    });
  }
}
