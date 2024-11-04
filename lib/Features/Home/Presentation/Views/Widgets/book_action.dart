import 'package:bookly_app/Core/Utilities/app_styles.dart';
import 'package:bookly_app/Core/Widgets/custom_button.dart';
import 'package:bookly_app/Features/Home/Data/book_model/book_model.dart';
import 'package:flutter/material.dart';

class BookAction extends StatelessWidget {
  const BookAction({super.key, required this.book});
  final BookModel book;
  @override
  Widget build(BuildContext context) {
    final isPaid = book.saleInfo!.isEbook!;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.12,
      ),
      child: SizedBox(
        height: 48,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomButton(
              text: // check book is free or paid
                  isPaid ? "${book.saleInfo!.listPrice?.amount} EGP" : 'Free',
              textStyle: AppStyles.textStyle18
                  .copyWith(color: Colors.black, fontWeight: FontWeight.w700),
            ),
            CustomButton(
              //there is Api link for free and other for Paid
              url: isPaid
                  ? book.accessInfo!.webReaderLink!
                  : book.volumeInfo!.previewLink!,
              color: const Color(0xffEF8262),
              text: isPaid ? 'Buy Now' : 'Free preview',
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
              textStyle: AppStyles.textStyle16
                  .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
