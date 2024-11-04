import 'package:bookly_app/Features/Home/Data/book_model/book_model.dart';
import 'package:bookly_app/Features/Home/Presentation/Views/Widgets/custom_book_item.dart';
import 'package:flutter/material.dart';

class SimiliarListView extends StatelessWidget {
  const SimiliarListView({super.key, required this.books});
  final List<BookModel> books;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(top: 16),
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(right: 8),
          child: CustomBookItem(
            image: books[index].volumeInfo?.imageLinks?.thumbnail,
            borderRadius: 8,
          ),
        );
      },
      itemCount: books.length,
    );
  }
}
