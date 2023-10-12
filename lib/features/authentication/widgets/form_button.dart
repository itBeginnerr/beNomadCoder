import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class FormButton extends StatelessWidget {
  const FormButton({
    super.key,
    required this.disabled,
  });

  final bool disabled;

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 1,
      child: AnimatedContainer(
        duration: const Duration(
          microseconds: 500,
        ),
        padding: const EdgeInsets.symmetric(
          vertical: Sizes.size12,
        ),
        decoration: BoxDecoration(
          color:
              disabled ? Colors.grey.shade300 : Theme.of(context).primaryColor,
        ),
        child: const AnimatedDefaultTextStyle(
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
          duration: Duration(
            milliseconds: 500,
          ),
          child: Text(
            "Next",
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
