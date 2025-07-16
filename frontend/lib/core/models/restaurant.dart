import 'package:freezed_annotation/freezed_annotation.dart';

part 'restaurant.freezed.dart';
part 'restaurant.g.dart';

@freezed
class Restaurant with _$Restaurant {
  const factory Restaurant({
    required String id,
    required String name,
    required String image,
    required String description,
    required double rating,
    required int reviewCount,
    required String deliveryTime,
    required double deliveryFee,
    required List<String> categories,
    required bool isOpen,
    @Default([]) List<MenuItem> menu,
  }) = _Restaurant;

  factory Restaurant.fromJson(Map<String, dynamic> json) =>
      _$RestaurantFromJson(json);
}

@freezed
class MenuItem with _$MenuItem {
  const factory MenuItem({
    required String id,
    required String name,
    required String description,
    required double price,
    required String image,
    required String category,
    @Default(true) bool isAvailable,
    @Default([]) List<String> ingredients,
  }) = _MenuItem;

  factory MenuItem.fromJson(Map<String, dynamic> json) =>
      _$MenuItemFromJson(json);
}