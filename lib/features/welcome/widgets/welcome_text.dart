import 'package:flutter/material.dart';

import '../../../animations/fade_animation_y.dart';
import '../../../constants/constants.dart';

class WelcomeText extends StatelessWidget {
  final String text;
  final ValueNotifier<int> _currentPageNotifier;
  const WelcomeText({
    super.key,
    required ValueNotifier<int> currentPageNotifier,
    required this.text,
  }) : _currentPageNotifier = currentPageNotifier;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FadeAnimationY(
          delay: .3,
          child: Padding(
            padding: const EdgeInsets.only(
              left: 88,
              right: 93,
            ),
            child: Text(
              text,
              style: kLatoRegular.copyWith(fontSize: 12),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        const SizedBox(
          height: 25,
        ),
        ValueListenableBuilder(
          valueListenable: _currentPageNotifier,
          builder: (context, currentPage, child) => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              3,
              (index) {
                return AnimatedSize(
                  key: UniqueKey(),
                  duration: const Duration(milliseconds: 500),
                  child: Container(
                    height: 5,
                    width: currentPage == index ? 27 : 5,
                    margin: const EdgeInsets.only(right: 7),
                    decoration: BoxDecoration(
                      borderRadius: kBorderRadiusCircular21,
                      color: currentPage == index ? kOrange : kLightGrey,
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
      ],
    );
  }
}
