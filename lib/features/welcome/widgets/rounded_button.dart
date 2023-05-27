import 'package:flutter/material.dart';

import '../../../animations/fade_animation_x.dart';
import '../../../constants/constants.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const RoundedButton({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return FadeAnimationX(
      delay: 1.2,
      child: Container(
        height: 46,
        margin: const EdgeInsets.only(left: 98, right: 93),
        decoration: BoxDecoration(
          borderRadius: kBorderRadiusCircular21,
          color: kOrange,
        ),
        child: InkWell(
          onTap: onTap,
          borderRadius: kBorderRadiusCircular21,
          child: Center(
            child: Text(
              text,
              style: kLatoBold.copyWith(
                fontSize: 20,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
