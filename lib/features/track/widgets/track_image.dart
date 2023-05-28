import 'package:flutter/material.dart';

import '../../../constants/constants.dart';

class TrackImage extends StatelessWidget {
  final int index;
  final String imagePath;
  const TrackImage({
    super.key,
    required this.index,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Hero(
        tag: 'hero$index',
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 40),
          decoration: BoxDecoration(
            borderRadius: kBorderRadiusCircular16,
            image: DecorationImage(
              image: AssetImage(
                imagePath,
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
