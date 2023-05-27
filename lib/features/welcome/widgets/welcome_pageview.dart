import 'package:flutter/material.dart';

import '../../../animations/fade_animation_y.dart';
import 'welcome_text.dart';

class WelcomePageView extends StatelessWidget {
  const WelcomePageView({
    super.key,
    required ValueNotifier<int> currentPageNotifier,
  }) : _currentPageNotifier = currentPageNotifier;

  final ValueNotifier<int> _currentPageNotifier;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FadeAnimationY(
        delay: 1.1,
        child: Container(
          margin: const EdgeInsets.only(
            left: 6,
            right: 13,
          ),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/images/welcome.png',
              ),
              fit: BoxFit.contain,
            ),
          ),
          child: PageView(
            scrollDirection: Axis.horizontal,
            onPageChanged: (page) => _currentPageNotifier.value = page,
            children: [
              WelcomeText(
                currentPageNotifier: _currentPageNotifier,
                text:
                    '“How is it that music can, without words, evoke our laughter, our fears, our highest aspirations?”',
              ),
              WelcomeText(
                currentPageNotifier: _currentPageNotifier,
                text:
                    '“If I had not been a physicist, I would probably have become a musician. I often think in music. I live my day dreams in music. I see my life in terms of music.”',
              ),
              WelcomeText(
                currentPageNotifier: _currentPageNotifier,
                text:
                    '“One good thing about music is when it hits you, you don\'t feel pain.”',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
