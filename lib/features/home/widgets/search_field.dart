import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../animations/fade_animation_y.dart';
import '../../../constants/constants.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
    required TextEditingController searchController,
  }) : _searchController = searchController;

  final TextEditingController _searchController;

  @override
  Widget build(BuildContext context) {
    return FadeAnimationY(
      delay: 1,
      child: Container(
        height: 38,
        margin: const EdgeInsets.symmetric(
          horizontal: 28,
        ),
        decoration: BoxDecoration(
          borderRadius: kBorderRadiusCircular16,
          color: kLightDarkBlue,
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(7.0),
              child: SvgPicture.asset(
                'assets/icons/map_point.svg',
                height: 24,
                width: 24,
              ),
            ),
            Expanded(
              child: TextField(
                controller: _searchController,
                style: kInterRegular.copyWith(
                  fontSize: 14,
                ),
                textAlign: TextAlign.left,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Find your Music ...',
                  hintStyle: kInterRegular.copyWith(
                    fontSize: 14,
                    color: kGrey,
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
