import 'package:bookly_app/Core/Utilities/app_router.dart';
import 'package:bookly_app/Core/Widgets/custom_error.dart';
import 'package:bookly_app/Features/Home/Presentation/Views/Widgets/custom_newest_book_item.dart';
import 'package:bookly_app/Features/Home/Presentation/manger/NewestBookCubit/newest_book_cubit.dart';
import 'package:bookly_app/Features/Home/Presentation/manger/NewestBookCubit/newest_book_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class NewestSliverList extends StatelessWidget {
  const NewestSliverList({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBookCubit, NewestBookState>(
      builder: (context, state) {
        if (state is NewestBookSuccessState) {
          return SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: GestureDetector(
                  onTap: () => GoRouter.of(context).push(
                    AppRouter.bookDetailsView,
                    extra: state.books[index],
                  ),
                  child: CustomNewestBookItem(
                    book: state.books[index],
                  ),
                ),
              );
            }, childCount: state.books.length),
          );
        } else if (state is NewestBookFailureState) {
          return SliverToBoxAdapter(
              child: CustomError(errorMsg: state.errorMassage));
        } else {
          return const SliverToBoxAdapter(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
