import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../../common_widgets/appbar.dart';
import '../../constants/constants.dart';
import '../home/home_screen.dart';
import 'widgets/rounded_button.dart';
import 'widgets/welcome_pageview.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
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

  void _onTap() => Navigator.push(
        context,
        PageTransition(
          duration: const Duration(milliseconds: 750),
          type: PageTransitionType.fade,
          child: const HomeScreen(),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDarkBlue,
      appBar: appbar(),
      body: Column(
        children: [
          WelcomePageView(
            currentPageNotifier: _currentPageNotifier,
          ),
          const SizedBox(
            height: 29,
          ),
          RoundedButton(
            onTap: _onTap,
            text: 'Get Started',
          ),
          const SizedBox(
            height: 62,
          ),
        ],
      ),
    );
  }
}
