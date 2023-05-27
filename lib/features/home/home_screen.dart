import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:rate_limiter/rate_limiter.dart';

import '../../animations/fade_animation_y.dart';
import '../../common_widgets/appbar.dart';
import '../../constants/constants.dart';
import '../track/track_screen.dart';
import 'widgets/category.dart';
import 'widgets/recently_tracks.dart';
import 'widgets/search_field.dart';
import 'widgets/track_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final TextEditingController _searchController;
  late final ValueNotifier<int> _selectedCategoryNotifier;

  @override
  void initState() {
    _searchController = TextEditingController()..addListener(_onSearch);
    _selectedCategoryNotifier = ValueNotifier<int>(0);
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    _selectedCategoryNotifier.dispose();
    super.dispose();
  }

  final _searchDebouncedFunc = debounce(
    (final String query) => debugPrint(
      'Search $query...',
    ),
    const Duration(
      milliseconds: 1000,
    ),
  );

  void _onSearch() => _searchDebouncedFunc(
        [
          _searchController.text.trim().toLowerCase(),
        ],
      );

  void _onTap({required String imagePath, required int index}) =>
      Navigator.push(
        context,
        PageTransition(
          duration: const Duration(milliseconds: 350),
          type: PageTransitionType.fade,
          child: TrackScreen(
            imagePath: imagePath,
            index: index,
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDarkBlue,
      appBar: appbar(),
      body: ListView(
        children: [
          FadeAnimationY(
            delay: 1,
            child: Padding(
              padding: const EdgeInsets.only(left: 31),
              child: Text(
                'DANNY  AVILLA\nALBUMES',
                style: kAntonRegular.copyWith(
                  fontSize: 32,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SearchField(searchController: _searchController),
          const SizedBox(
            height: 20,
          ),
          Category(selectedCategoryNotifier: _selectedCategoryNotifier),
          const SizedBox(
            height: 20,
          ),
          FadeAnimationY(
            delay: 1,
            child: ValueListenableBuilder(
              valueListenable: _selectedCategoryNotifier,
              builder: (context, selectedCategory, _) => Padding(
                padding: const EdgeInsets.only(left: 34),
                child: Text(
                  selectedCategory == 0 ? 'Daily Mix' : 'Trending',
                  style: kLatoExtraBold.copyWith(
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          TrackList(
            onTap: _onTap,
          ),
          const SizedBox(
            height: 13,
          ),
          FadeAnimationY(
            delay: 1,
            child: Padding(
              padding: const EdgeInsets.only(left: 21),
              child: Text(
                'Recently Played',
                style: kLatoExtraBold.copyWith(
                  fontSize: 16,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 13,
          ),
          RecentlyTracks(
            onTap: () {},
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
