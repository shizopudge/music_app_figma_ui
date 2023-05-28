import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants/constants.dart';

class HubBottomNavBar extends StatelessWidget {
  final int currentPage;
  final ValueNotifier<int> _currentPageNotifier;
  const HubBottomNavBar({
    super.key,
    required this.currentPage,
    required ValueNotifier<int> currentPageNotifier,
  }) : _currentPageNotifier = currentPageNotifier;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
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
    );
  }
}
