import 'package:flutter/material.dart';

import '../../constants/constants.dart';
import '../home/home_screen.dart';
import 'widgets/bottom_nav_bar.dart';

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
          bottomNavigationBar: HubBottomNavBar(
            currentPage: currentPage,
            currentPageNotifier: _currentPageNotifier,
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
