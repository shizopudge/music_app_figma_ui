import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../common_widgets/appbar.dart';
import '../../constants/constants.dart';

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
          Hero(
            tag: 'hero${widget.index}',
            child: Container(
              height: 280,
              margin: const EdgeInsets.symmetric(horizontal: 40),
              decoration: BoxDecoration(
                borderRadius: kBorderRadiusCircular16,
                image: DecorationImage(
                  image: AssetImage(
                    widget.imagePath,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'The Captain',
                      style: kLatoRegular.copyWith(
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Text(
                      'DANNY AVILA',
                      style: kUrbanistSemiBold.copyWith(
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
                ValueListenableBuilder(
                  valueListenable: _isLikedNotifier,
                  builder: (context, isLiked, _) => GestureDetector(
                    onTap: () {
                      if (isLiked) {
                        _isLikedNotifier.value = false;
                      } else {
                        _isLikedNotifier.value = true;
                      }
                    },
                    child: SvgPicture.asset(
                      'assets/icons/favorite.svg',
                      height: 24,
                      width: 24,
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                        isLiked ? kOrange : kLightGrey,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 48,
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 33),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '2.01',
                      style: kUrbanistMedium.copyWith(fontSize: 15),
                    ),
                    Text(
                      '-1.07',
                      style: kUrbanistMedium.copyWith(fontSize: 15),
                    ),
                  ],
                ),
              ),
              Slider(
                value: .7,
                onChanged: (value) {},
                activeColor: kWhite,
                inactiveColor: kGrey,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
