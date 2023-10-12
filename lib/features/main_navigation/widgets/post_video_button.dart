import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class PostVideoButton extends StatelessWidget {
  const PostVideoButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          left: 18,
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.size8,
            ),
            height: 30,
            width: 25,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(
                Sizes.size8,
              ),
            ),
          ),
        ),
        Positioned(
          right: 18,
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.size8,
            ),
            height: 30,
            width: 25,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(
                Sizes.size8,
              ),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size10,
          ),
          height: 30,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              Sizes.size6,
            ),
            color: Colors.white,
          ),
          child: const Center(
            child: FaIcon(
              FontAwesomeIcons.plus,
              color: Colors.black,
              size: Sizes.size16 + Sizes.size2,
            ),
          ),
        )
      ],
    );
  }
}
