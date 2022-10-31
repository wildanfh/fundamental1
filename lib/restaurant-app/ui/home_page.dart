import 'package:flutter/material.dart';
import 'package:fundamental/restaurant-app/ui/resto_list_page.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/home_page';
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const RestoListPage();
  }
}