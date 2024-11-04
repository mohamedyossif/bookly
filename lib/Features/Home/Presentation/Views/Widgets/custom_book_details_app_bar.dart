import 'package:bookly_app/Core/Widgets/custom_icon_buttom.dart';
import 'package:bookly_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomBookDetailsAppBar extends StatelessWidget {
  const CustomBookDetailsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: kPaddingV, vertical: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomIconButton(
            iconData: Icons.close,
            onTap: () => GoRouter.of(context).pop(),
          ),
          const CustomIconButton(
            iconData: Icons.shopping_cart_outlined,
          ),
        ],
      ),
    );
  }
}
