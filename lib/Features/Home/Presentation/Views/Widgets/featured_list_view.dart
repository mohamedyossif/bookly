import 'package:bookly_app/Core/Utilities/app_router.dart';
import 'package:bookly_app/Core/Widgets/custom_error.dart';
import 'package:bookly_app/Features/Home/Presentation/Views/Widgets/custom_book_item.dart';
import 'package:bookly_app/Features/Home/Presentation/manger/FeaturedBookCubit/featured_book_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class FeaturedListView extends StatelessWidget {
  const FeaturedListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBookCubit, FeaturedBookState>(
      builder: (context, state) {
        if (state is FeaturedBookSuccessState) {
          return ListView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            scrollDirection: Axis.horizontal,
            itemCount: state.books.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 14),
                child: GestureDetector(
                  onTap: () => GoRouter.of(context).push(
                    AppRouter.bookDetailsView,
                    // pass data to other screen
                    extra: state.books[index],
                  ),
                  child: CustomBookItem(
                    image: state.books[index].volumeInfo?.imageLinks?.thumbnail,
                  ),
                ),
              );
            },
          );
        } else if (state is FeaturedBookFailureState) {
          return CustomError(errorMsg: state.errorMassage);
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
