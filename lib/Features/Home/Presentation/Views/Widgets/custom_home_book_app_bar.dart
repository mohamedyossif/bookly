import 'package:bookly_app/Core/Utilities/app_assets.dart';
import 'package:bookly_app/Core/Widgets/custom_icon_buttom.dart';
import 'package:bookly_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CutomHomBookAppBar extends StatelessWidget {
  const CutomHomBookAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kPaddingV, vertical: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            AppAsset.kLogo,
            height: 18,
          ),
          const CustomIconButton(iconData: FontAwesomeIcons.magnifyingGlass),
        ],
      ),
    );
  }
}
