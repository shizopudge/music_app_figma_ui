import 'package:flutter/material.dart';

import '../../common_widgets/appbar.dart';
import '../../constants/constants.dart';
import 'widgets/track_buttons.dart';
import 'widgets/track_image.dart';
import 'widgets/track_like_button.dart';
import 'widgets/track_slider.dart';
import 'widgets/track_title.dart';

class TrackScreen extends StatefulWidget {
  final String imagePath;
  final int index;
  const TrackScreen({
    super.key,
    required this.imagePath,
    required this.index,
  });

  @override
  State<TrackScreen> createState() => _TrackScreenState();
}

class _TrackScreenState extends State<TrackScreen> {
  late final ValueNotifier<bool> _isLikedNotifier;

  @override
  void initState() {
    _isLikedNotifier = ValueNotifier<bool>(false);
    super.initState();
  }

  @override
  void dispose() {
    _isLikedNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDarkBlue,
      appBar: appbar(
        title: Text(
          '“Top 100 ”',
          style: kUrbanistSemiBold.copyWith(fontSize: 16),
        ),
      ),
      body: Column(
        children: [
          TrackImage(
            index: widget.index,
            imagePath: widget.imagePath,
          ),
          const SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 34),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const TrackTitle(
                  trackName: 'The Captain',
                  author: 'DANNY AVILA',
                ),
                TrackLikeButton(
                  isLikedNotifier: _isLikedNotifier,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 48,
          ),
          const TrackSlider(
            past: 2.01,
            left: -1.07,
          ),
          const SizedBox(
            height: 17,
          ),
          const TrackButtons(),
          const SizedBox(
            height: 48,
          ),
        ],
      ),
    );
  }
}
