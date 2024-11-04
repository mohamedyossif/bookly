import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.color,
    this.borderRadius,
    required this.text,
    required this.textStyle,
    this.url,
  });
  final Color? color;
  final BorderRadiusGeometry? borderRadius;
  final String text;
  final TextStyle textStyle;
  final String? url;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: color ?? Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius ??
                const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  bottomLeft: Radius.circular(16),
                ),
          ),
        ),
        // check if uri is null
        onPressed: url != null
            ? () async {
                final Uri uriLink = Uri.parse(url!);
                if (await canLaunchUrl(uriLink)) {
                  await launchUrl(uriLink);
                } else {
                  throw 'Could not launch $url';
                }
              }
            : null,
        child: Text(
          text,
          style: textStyle,
        ),
      ),
    );
  }
}
