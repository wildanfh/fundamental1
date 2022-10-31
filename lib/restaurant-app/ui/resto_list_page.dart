import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fundamental/restaurant-app/common/styles.dart';
import 'package:fundamental/restaurant-app/model/restaurant.dart';
import 'package:fundamental/restaurant-app/ui/resto_detail_page.dart';

class RestoListPage extends StatelessWidget {
  const RestoListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, isScrolled) {
          return [
            SliverAppBar(
              pinned: true,
              elevation: 2.0,
              backgroundColor: secondaryColor,
              expandedHeight: 150,
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.none,
                background: Image.asset(
                  'assets/images/bg1.jpg',
                  fit: BoxFit.fitWidth,
                ),
                title: const Text('Resto'),
                titlePadding: const EdgeInsets.only(left: 16, bottom: 16),
              ),
            ),
          ];
        },
        body: _buildList(context),
      ),
    );
  }

  Widget _buildList(BuildContext context) {
    return FutureBuilder(
      future: DefaultAssetBundle.of(context)
          .loadString('assets/local_restaurant.json'),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final restaurant =
              Restaurants.fromJson(jsonDecode(snapshot.data as String));
          return ListView.builder(
            itemCount: restaurant.listRestaurant.length,
            itemBuilder: (context, index) {
              Restaurant restaurantItem = restaurant.listRestaurant[index];
              return _buildRestoItem(context, restaurantItem);
            },
          );
        } else if (!snapshot.hasData) {
          return Center(
            child: Text(
              'Data not found',
              style: Theme.of(context).textTheme.headline4,
            ),
          );
        }
        return Center(
            child: Text(':)', style: Theme.of(context).textTheme.headline2));
      },
    );
  }

  Widget _buildRestoItem(BuildContext context, Restaurant resto) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 4.0,
        horizontal: 8.0,
      ),
      child: Material(
        color: primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        elevation: 1.0,
        child: ListTile(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          leading: Transform.translate(
            offset: const Offset(0, -8),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Hero(
                tag: resto.pictureId,
                child: Image.network(
                  resto.pictureId,
                  width: 100,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                Icons.star,
                size: 20,
                color: Colors.yellow,
              ),
              const SizedBox(
                width: 4.0,
              ),
              Text(
                '${resto.rating}',
                style: Theme.of(context).textTheme.subtitle2,
              ),
            ],
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 4.0,
              ),
              Text(
                resto.name,
                style: Theme.of(context).textTheme.bodyText1,
              ),
              const SizedBox(
                height: 4.0,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.location_on,
                    size: 20,
                  ),
                  const SizedBox(
                    width: 4.0,
                  ),
                  Text(resto.city),
                ],
              )
            ],
          ),
          onTap: () {
            Navigator.pushNamed(context, RestoDetailPage.routeName,
                arguments: resto);
          },
        ),
      ),
    );
  }
}
