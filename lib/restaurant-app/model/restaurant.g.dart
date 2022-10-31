// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Restaurants _$RestaurantsFromJson(Map<String, dynamic> json) => Restaurants(
      (json['restaurants'] as List<dynamic>)
          .map((e) => Restaurant.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Restaurant _$RestaurantFromJson(Map<String, dynamic> json) => Restaurant(
      json['id'] as String,
      json['name'] as String,
      json['description'] as String,
      json['pictureId'] as String,
      json['city'] as String,
      (json['rating'] as num).toDouble(),
    )..menu = Menu.fromJson(json['menus'] as Map<String, dynamic>);

Menu _$MenuFromJson(Map<String, dynamic> json) => Menu(
      (json['foods'] as List<dynamic>)
          .map((e) => Food.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['drinks'] as List<dynamic>)
          .map((e) => Drink.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
