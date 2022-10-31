import 'package:flutter/material.dart';
import 'package:fundamental/restaurant-app/common/styles.dart';
import 'package:fundamental/restaurant-app/model/drink.dart';
import 'package:fundamental/restaurant-app/model/food.dart';
import 'package:fundamental/restaurant-app/model/restaurant.dart';

class RestoDetailPage extends StatelessWidget {
  static const routeName = '/article_detail';

  final Restaurant resto;

  const RestoDetailPage({Key? key, required this.resto}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: primaryColor),
        backgroundColor: secondaryColor,
        title: Text(
          resto.name,
          style: const TextStyle(
            color: primaryColor,
          ),
          ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Material(
          color: primaryColor,
          elevation: 1.0,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Hero(
                    tag: resto.pictureId,
                    child: Image.network(
                      resto.pictureId,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 120,
                        child: Text(
                          resto.name,
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.location_on,
                            size: 20,
                          ),
                          const SizedBox(width: 4.0),
                          Text(
                            resto.city,
                            style: Theme.of(context).textTheme.subtitle2,
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.star,
                            size: 20,
                          ),
                          const SizedBox(width: 4.0),
                          Text(
                            '${resto.rating}',
                            style: Theme.of(context).textTheme.subtitle2,
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(12.0),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    color: primaryColor,
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x55333333),
                        blurRadius: 1,
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Description',
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        resto.description,
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Menus',
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 4.0),
                        child: const Text('Foods :'),
                      ),
                      SizedBox(
                        height: 30,
                        child: ListView.builder(
                          itemCount: resto.menu.listFood.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            final menuItem =
                                Menu(resto.menu.listFood, resto.menu.listDrink);
                            final foods = menuItem.listFood[index];
                            final foodItem = Food(foods.name);
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(
                                      right: 8.0),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0, vertical: 4.0),
                                  decoration: BoxDecoration(
                                    color: secondaryColor,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Text(
                                    foodItem.name,
                                    style: const TextStyle(
                                      color: primaryColor,
                                    ),
                                  ),
                                )
                              ],
                            );
                          },
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 4.0),
                        child: const Text('Drinks :'),
                      ),
                      const SizedBox(height: 5),
                      SizedBox(
                        height: 25,
                        child: ListView.builder(
                          itemCount: resto.menu.listDrink.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            final menuItem =
                                Menu(resto.menu.listFood, resto.menu.listDrink);
                            final drinks = menuItem.listDrink[index];
                            final drinkItem = Drink(drinks.name);
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(
                                      right: 8.0),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0, vertical: 4.0),
                                  decoration: BoxDecoration(
                                    color: secondaryColor,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Text(
                                    drinkItem.name,
                                    style: const TextStyle(
                                      color: primaryColor,
                                    ),
                                  ),
                                )
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
