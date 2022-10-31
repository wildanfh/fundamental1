import 'package:flutter/material.dart';
import 'package:fundamental/restaurant-app/common/styles.dart';
import 'package:fundamental/restaurant-app/model/restaurant.dart';
import 'package:fundamental/restaurant-app/ui/home_page.dart';
import 'package:fundamental/restaurant-app/ui/resto_detail_page.dart';
import 'package:fundamental/restaurant-app/ui/splash_screen.dart';

class RestaurantApp extends StatelessWidget {
  const RestaurantApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Resto App',
      theme: ThemeData(
        colorScheme: Theme.of(context).colorScheme.copyWith(
              primary: primaryColor,
              onPrimary: primaryTextColor,
              secondary: secondaryColor,
            ),
        scaffoldBackgroundColor: primaryColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: myTextTheme,
        appBarTheme: const AppBarTheme(elevation: 0),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: secondaryColor,
            foregroundColor: primaryColor,
            textStyle: const TextStyle(),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
              Radius.circular(16.0),
            )),
          ),
        ),
      ),
      initialRoute: SplashPage.routeName,
      routes: {
        SplashPage.routeName: (context) => const SplashPage(),
        HomePage.routeName: (context) => const HomePage(),
        RestoDetailPage.routeName: (context) => RestoDetailPage(resto: ModalRoute.of(context)?.settings.arguments as Restaurant),
      },
    );
  }
}
