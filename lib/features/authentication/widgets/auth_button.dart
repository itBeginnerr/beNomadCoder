import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class AuthButton extends StatelessWidget {
  final String title;
  final FaIcon icon;

  const AuthButton({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 1,
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: Sizes.size14,
          horizontal: Sizes.size10,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            width: Sizes.size2,
            color: Colors.grey.shade200,
          ),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: icon,
            ),
            Text(
              title,
              style: const TextStyle(
                  fontSize: Sizes.size16, fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
