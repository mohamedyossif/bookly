import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({super.key, this.onTap, required this.iconData});
  final void Function()? onTap;
  final IconData iconData;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Icon(
        iconData,
        size: 22,
      ),
    );
  }
}
