import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../animations/fade_animation_x.dart';
import '../../../constants/constants.dart';

class TrackList extends StatelessWidget {
  final VoidCallback onTap;
  const TrackList({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 186,
      child: ListView.builder(
        padding: const EdgeInsets.only(left: 13, right: 5),
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: 10,
        itemBuilder: (context, index) {
          late final int imageIndex;
          if (index % 2 == 0) {
            imageIndex = 2;
          } else {
            imageIndex = 1;
          }
          return FadeAnimationX(
            delay: .3,
            child: Container(
              padding: const EdgeInsets.only(
                right: 18,
              ),
              width: 149,
              child: GestureDetector(
                onTap: onTap,
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 7),
                      height: 139,
                      decoration: BoxDecoration(
                        borderRadius: kBorderRadiusCircular16,
                        image: DecorationImage(
                          image: AssetImage(
                            'assets/images/track$imageIndex.png',
                          ),
                          fit: BoxFit.cover,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: kLightDarkBlue.withOpacity(.7),
                            offset: const Offset(
                              1.5,
                              0.0,
                            ),
                            blurRadius: 5.0,
                            spreadRadius: 2.0,
                          ),
                        ],
                      ),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            right: 7,
                            bottom: 3,
                          ),
                          child: SvgPicture.asset(
                            'assets/icons/play.svg',
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          'The Captain Single',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: kLatoRegular.copyWith(
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
