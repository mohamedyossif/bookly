import 'package:bookly_app/Features/Home/Data/book_model/book_model.dart';
import 'package:bookly_app/Features/Home/Presentation/Views/Widgets/book_details_view_body.dart';
import 'package:bookly_app/Features/Home/Presentation/manger/SimilarBookCubit/similar_book_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookDetailsView extends StatelessWidget {
  const BookDetailsView({super.key, required this.book});
  final BookModel book;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => SimilarBookCubit()
          ..fetchSimilarBooks(
              content: book.volumeInfo?.categories![0] ?? 'Computer Science'),
        child: Scaffold(
          body: BookDetailsViewBody(
            book: book,
          ),
        ),
      ),
    );
  }
}
