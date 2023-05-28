import 'package:flutter/material.dart';

import '../../../animations/fade_animation_y.dart';
import '../../../constants/constants.dart';

class TrackTitle extends StatelessWidget {
  final String trackName;
  final String author;
  const TrackTitle({
    super.key,
    required this.trackName,
    required this.author,
  });

  @override
  Widget build(BuildContext context) {
    return FadeAnimationY(
      delay: 1.1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            trackName,
            style: kLatoRegular.copyWith(
              fontSize: 14,
            ),
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            author,
            style: kUrbanistSemiBold.copyWith(
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}
