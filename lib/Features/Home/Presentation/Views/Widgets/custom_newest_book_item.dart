import 'package:bookly_app/Core/Utilities/app_styles.dart';
import 'package:bookly_app/Features/Home/Data/book_model/book_model.dart';
import 'package:bookly_app/Features/Home/Presentation/Views/Widgets/custom_book_item.dart';
import 'package:bookly_app/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomNewestBookItem extends StatelessWidget {
  const CustomNewestBookItem({super.key, required this.book});
  final BookModel book;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.15,
          child: CustomBookItem(
            image: book.volumeInfo?.imageLinks?.thumbnail ?? kImageNotFound,
            borderRadius: 8,
          ),
        ),
        const SizedBox(
          width: 27.5,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: Text(
                  book.volumeInfo!.title!,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: AppStyles.textStyle20.copyWith(
                    fontFamily: kSecanddaryFontFamily,
                  ),
                ),
              ),
              const SizedBox(
                height: 3,
              ),
              Opacity(
                opacity: 0.5,
                child: Text(
                  book.volumeInfo!.authors![0],
                  style: AppStyles.textStyle14,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Text(
                    // check book is free or paid
                    book.saleInfo!.isEbook!
                        ? "${book.saleInfo!.listPrice?.amount} EGP"
                        : 'Free',
                    style: AppStyles.textStyle20
                        .copyWith(fontWeight: FontWeight.w700),
                  ),
                  const Spacer(),
                  Opacity(
                    opacity: 0.5,
                    child: Text(
                      '${book.volumeInfo?.pageCount} Pages ',
                      style: AppStyles.textStyle14.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 26.5,
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
