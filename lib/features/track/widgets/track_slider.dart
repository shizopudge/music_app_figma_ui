import 'package:flutter/material.dart';

import '../../../animations/fade_animation_y.dart';
import '../../../constants/constants.dart';

class TrackSlider extends StatelessWidget {
  final double left;
  final double past;
  const TrackSlider({
    super.key,
    required this.left,
    required this.past,
  });

  @override
  Widget build(BuildContext context) {
    return FadeAnimationY(
      delay: 1.2,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  past.toString(),
                  style: kUrbanistMedium.copyWith(fontSize: 15),
                ),
                Text(
                  left.toString(),
                  style: kUrbanistMedium.copyWith(fontSize: 15),
                ),
              ],
            ),
          ),
          Slider(
            value: .7,
            onChanged: (value) {},
            activeColor: kWhite,
            inactiveColor: kGrey,
          ),
        ],
      ),
    );
  }
}
