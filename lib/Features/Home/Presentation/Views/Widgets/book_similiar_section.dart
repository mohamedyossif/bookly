import 'package:bookly_app/Core/Utilities/app_styles.dart';
import 'package:bookly_app/Core/Widgets/custom_error.dart';
import 'package:bookly_app/Features/Home/Presentation/Views/Widgets/similiar_list_view.dart';
import 'package:bookly_app/Features/Home/Presentation/manger/SimilarBookCubit/similar_book_cubit.dart';
import 'package:bookly_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookSimilarSection extends StatelessWidget {
  const BookSimilarSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: kPaddingV),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'You can also like',
            style: AppStyles.textStyle14.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          BlocBuilder<SimilarBookCubit, SimilarBookState>(
            builder: (context, state) {
              if (state is SimilarBookSuccessState) {
                return SizedBox(
                  height: MediaQuery.of(context).size.height * 0.165,
                  child: SimiliarListView(
                    books: state.books,
                  ),
                );
              } else if (state is SimilarBookFailureState) {
                return CustomError(errorMsg: state.errorMassage);
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
