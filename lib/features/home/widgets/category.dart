import 'package:flutter/material.dart';

import '../../../animations/fade_animation_y.dart';
import '../../../constants/constants.dart';

class Category extends StatelessWidget {
  const Category({
    super.key,
    required ValueNotifier<int> selectedCategoryNotifier,
  }) : _selectedCategoryNotifier = selectedCategoryNotifier;

  final ValueNotifier<int> _selectedCategoryNotifier;

  @override
  Widget build(BuildContext context) {
    return FadeAnimationY(
      delay: 1,
      child: ValueListenableBuilder(
        valueListenable: _selectedCategoryNotifier,
        builder: (context, selectedCategory, _) => Padding(
          padding: const EdgeInsets.only(
            left: 24,
          ),
          child: Row(
            children: [
              GestureDetector(
                onTap: () => _selectedCategoryNotifier.value = 0,
                child: Text(
                  'For You',
                  style: kLatoExtraBold.copyWith(
                    fontSize: 16,
                    color: selectedCategory == 0 ? kOrange : null,
                  ),
                ),
              ),
              const SizedBox(
                width: 29,
              ),
              GestureDetector(
                onTap: () => _selectedCategoryNotifier.value = 1,
                child: Text(
                  'Trending',
                  style: kLatoExtraBold.copyWith(
                    fontSize: 16,
                    color: selectedCategory == 1 ? kOrange : null,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
