import 'package:flutter/material.dart';

import '../../../animations/fade_animation_x.dart';
import '../../../constants/constants.dart';

class RecentlyTracks extends StatelessWidget {
  final VoidCallback onTap;
  const RecentlyTracks({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return FadeAnimationX(
      delay: 1,
      child: Container(
        height: 141,
        margin: const EdgeInsets.only(
          left: 21,
          right: 19,
        ),
        decoration: BoxDecoration(
          borderRadius: kBorderRadiusCircular16,
          gradient: const LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              kGrey,
              kLightDarkBlue,
            ],
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 185,
              child: Stack(
                fit: StackFit.expand,
                children: List.generate(
                  3,
                  (index) {
                    double height = 143;
                    double width = 151;
                    if (index > 0) {
                      height / index;
                      width / index;
                    }
                    late final int imageIndex;
                    if (index % 3 == 0) {
                      imageIndex = 3;
                    } else if (index % 2 == 0) {
                      imageIndex = 2;
                    } else {
                      imageIndex = 1;
                    }
                    return Positioned(
                      key: UniqueKey(),
                      top: index * 5,
                      left: index * 13,
                      bottom: index * 5,
                      child: Container(
                        height: height,
                        width: width,
                        decoration: BoxDecoration(
                          borderRadius: kBorderRadiusCircular16,
                          image: DecorationImage(
                            image: AssetImage(
                              'assets/images/track$imageIndex.png',
                            ),
                            fit: BoxFit.cover,
                          ),
                          boxShadow: const [
                            BoxShadow(
                              color: kDarkBlue,
                              offset: Offset(
                                1.0,
                                5.0,
                              ),
                              blurRadius: 5.0,
                              spreadRadius: 2.0,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ).reversed.toList(),
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(right: 8, top: 15),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 10,
                  itemBuilder: (context, index) => Padding(
                    key: UniqueKey(),
                    padding: const EdgeInsets.only(bottom: 15),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: onTap,
                        borderRadius: kBorderRadiusCircular16,
                        child: Text(
                          '${index + 1}. Man on the moon',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: kLatoRegular.copyWith(
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
