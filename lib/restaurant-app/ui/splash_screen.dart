import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:fundamental/restaurant-app/common/styles.dart';
import 'package:fundamental/restaurant-app/ui/home_page.dart';

class SplashPage extends StatefulWidget {
  static const routeName = '/splash_page';

  const SplashPage({Key? key}) : super(key: key);
  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).popAndPushNamed(HomePage.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: secondaryColor,
      ),
      child: Center(
        child: DefaultTextStyle(
          style: Theme.of(context).textTheme.headline1!.apply(color: primaryColor),
          child: AnimatedTextKit(
            animatedTexts: [
              ScaleAnimatedText(
                'Resto',
                scalingFactor: 1.0,
                duration: const Duration(milliseconds: 2500),
                ),
            ],
          ),
        ),
      ),
    );
  }
}