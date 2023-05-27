import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constants/constants.dart';
import '../home/home_screen.dart';

class Hub extends StatefulWidget {
  const Hub({super.key});

  @override
  State<Hub> createState() => _HubState();
}

class _HubState extends State<Hub> {
  late final ValueNotifier<int> _currentPageNotifier;

  @override
  void initState() {
    _currentPageNotifier = ValueNotifier<int>(0);
    super.initState();
  }

  @override
  void dispose() {
    _currentPageNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _currentPageNotifier,
      builder: (context, currentPage, _) => Scaffold(
          backgroundColor: kDarkBlue,
          bottomNavigationBar: BottomNavigationBar(
            showSelectedLabels: false,
            showUnselectedLabels: false,
            enableFeedback: false,
            elevation: 0,
            type: BottomNavigationBarType.fixed,
            backgroundColor: kLightDarkBlue,
            currentIndex: currentPage,
            onTap: (page) => _currentPageNotifier.value = page,
            items: [
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/icons/home.svg',
                  height: 24,
                  width: 24,
                  colorFilter: ColorFilter.mode(
                    currentPage == 0 ? kOrange : kGrey,
                    BlendMode.srcIn,
                  ),
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/icons/cart.svg',
                  height: 24,
                  width: 24,
                  colorFilter: ColorFilter.mode(
                    currentPage == 1 ? kOrange : kGrey,
                    BlendMode.srcIn,
                  ),
                ),
                label: 'Cart',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/icons/favorite.svg',
                  height: 24,
                  width: 24,
                  colorFilter: ColorFilter.mode(
                    currentPage == 2 ? kOrange : kGrey,
                    BlendMode.srcIn,
                  ),
                ),
                label: 'Favorite',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/icons/notification.svg',
                  height: 24,
                  width: 24,
                  colorFilter: ColorFilter.mode(
                    currentPage == 3 ? kOrange : kGrey,
                    BlendMode.srcIn,
                  ),
                ),
                label: 'Notifications',
              ),
            ],
          ),
          body: IndexedStack(
            index: currentPage,
            children: const [
              HomeScreen(),
              ColoredBox(
                color: kDarkBlue,
              ),
              ColoredBox(
                color: kDarkBlue,
              ),
              ColoredBox(
                color: kDarkBlue,
              ),
            ],
          )),
    );
  }
}
