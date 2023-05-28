import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../animations/fade_animation_y.dart';
import '../../../constants/constants.dart';

class TrackButtons extends StatelessWidget {
  const TrackButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FadeAnimationY(
      delay: 1.2,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 33),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {},
              borderRadius: kBorderRadiusCircular21,
              child: SvgPicture.asset(
                'assets/icons/shuffle.svg',
                height: 32,
                width: 32,
              ),
            ),
            InkWell(
              onTap: () {},
              borderRadius: kBorderRadiusCircular21,
              child: SvgPicture.asset(
                'assets/icons/skip_back.svg',
                height: 32,
                width: 32,
              ),
            ),
            InkWell(
              onTap: () {},
              borderRadius: kBorderRadiusCircular21,
              child: SvgPicture.asset(
                'assets/icons/pause.svg',
                height: 69,
                width: 69,
              ),
            ),
            InkWell(
              onTap: () {},
              borderRadius: kBorderRadiusCircular21,
              child: SvgPicture.asset(
                'assets/icons/skip_forward.svg',
                height: 32,
                width: 32,
              ),
            ),
            InkWell(
              onTap: () {},
              borderRadius: kBorderRadiusCircular21,
              child: SvgPicture.asset(
                'assets/icons/replay.svg',
                height: 32,
                width: 32,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
