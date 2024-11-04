import 'package:bookly_app/Core/Widgets/custom_error.dart';
import 'package:bookly_app/Features/Home/Data/book_model/book_model.dart';
import 'package:bookly_app/Features/Home/Presentation/Views/Widgets/book_action.dart';
import 'package:bookly_app/Features/Home/Presentation/Views/Widgets/book_details_section.dart';
import 'package:bookly_app/Features/Home/Presentation/Views/Widgets/book_similiar_section.dart';
import 'package:bookly_app/Features/Home/Presentation/Views/Widgets/custom_book_details_app_bar.dart';
import 'package:bookly_app/Features/Home/Presentation/manger/SimilarBookCubit/similar_book_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key, required this.book});
  final BookModel book;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            children: [
              const CustomBookDetailsAppBar(),
              BookDetailsSection(
                book: book,
              ),
              BookAction(
                book: book,
              ),
              const SizedBox(
                height: 50,
              ),
              const BookSimilarSection(),
              const SizedBox(
                height: 40,
              )
            ],
          ),
        ),
      ],
    );
  }
}
