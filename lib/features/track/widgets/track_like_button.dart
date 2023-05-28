import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../animations/fade_animation_y.dart';
import '../../../constants/constants.dart';

class TrackLikeButton extends StatelessWidget {
  const TrackLikeButton({
    super.key,
    required ValueNotifier<bool> isLikedNotifier,
  }) : _isLikedNotifier = isLikedNotifier;

  final ValueNotifier<bool> _isLikedNotifier;

  @override
  Widget build(BuildContext context) {
    return FadeAnimationY(
      delay: 1.1,
      child: ValueListenableBuilder(
        valueListenable: _isLikedNotifier,
        builder: (context, isLiked, _) => GestureDetector(
          onTap: () {
            if (isLiked) {
              _isLikedNotifier.value = false;
            } else {
              _isLikedNotifier.value = true;
            }
          },
          child: SvgPicture.asset(
            'assets/icons/favorite.svg',
            height: 24,
            width: 24,
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              isLiked ? kOrange : kLightGrey,
              BlendMode.srcIn,
            ),
          ),
        ),
      ),
    );
  }
}
