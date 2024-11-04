import 'package:bookly_app/Core/Utilities/app_styles.dart';
import 'package:bookly_app/Features/Home/Data/book_model/book_model.dart';
import 'package:bookly_app/Features/Home/Presentation/Views/Widgets/custom_book_item.dart';
import 'package:bookly_app/constants.dart';
import 'package:flutter/material.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key, required this.book});
  final BookModel book;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.29,
          ),
          child: CustomBookItem(
            image: book.volumeInfo?.imageLinks?.thumbnail,
          ),
        ),
        const SizedBox(
          height: 43,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kPaddingV),
          child: Text(
            book.volumeInfo!.title!,
            style: AppStyles.textStyle30
                .copyWith(fontFamily: kSecanddaryFontFamily),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        Opacity(
          opacity: 0.69,
          child: Text(
            book.volumeInfo?.authors![0] ?? 'Unknown Author',
            textAlign: TextAlign.center,
            style: AppStyles.textStyle18.copyWith(fontWeight: FontWeight.w500),
          ),
        ),
        const SizedBox(
          height: 14,
        ),
        Opacity(
          opacity: 0.69,
          child: Text(
            '${book.volumeInfo?.pageCount} Pages',
            textAlign: TextAlign.center,
            style: AppStyles.textStyle18.copyWith(fontWeight: FontWeight.w500),
          ),
        ),
        const SizedBox(
          height: 37,
        ),
      ],
    );
  }
}
