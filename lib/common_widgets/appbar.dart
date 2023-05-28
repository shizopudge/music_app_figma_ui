import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../animations/fade_animation_y.dart';
import '../constants/constants.dart';

appbar({Text? title}) => AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      centerTitle: true,
      title: FadeAnimationY(
        delay: 1,
        child: title ?? const SizedBox(),
      ),
      leading: FadeAnimationY(
        delay: 1,
        child: Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.only(
              right: 9,
              left: 9,
              top: 11,
            ),
            child: InkWell(
              onTap: () {},
              borderRadius: kBorderRadiusCircular16,
              child: SvgPicture.asset(
                'assets/icons/menu.svg',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
