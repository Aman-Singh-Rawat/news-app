import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SocialMediaButton extends StatelessWidget {
  const SocialMediaButton({
    super.key,
    required this.buttonName,
    required this.buttonIcon,
  });

  final String buttonName;
  final String buttonIcon;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      style: ButtonStyle(
        padding: WidgetStatePropertyAll(
          const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        ),
        side: WidgetStatePropertyAll(
          BorderSide(color: Colors.grey.shade200, width: 0.5),
        ),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
      label: Text(
        buttonName,
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
      ),
      onPressed: () {},
      icon: Padding(
        padding: const EdgeInsets.only(right: 5),
        child: SvgPicture.asset(
          buttonIcon,
          width: 20,
          height: 20,
        ),
      ),
    );
  }
}
