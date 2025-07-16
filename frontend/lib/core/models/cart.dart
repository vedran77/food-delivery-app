import 'package:freezed_annotation/freezed_annotation.dart';
import 'restaurant.dart';

part 'cart.freezed.dart';
part 'cart.g.dart';

@freezed
class CartItem with _$CartItem {
  const factory CartItem({
    required MenuItem menuItem,
    required int quantity,
    String? specialInstructions,
  }) = _CartItem;

  factory CartItem.fromJson(Map<String, dynamic> json) =>
      _$CartItemFromJson(json);
}

@freezed
class Cart with _$Cart {
  const factory Cart({
    @Default([]) List<CartItem> items,
    String? restaurantId,
  }) = _Cart;

  const Cart._();

  double get subtotal => items.fold(
      0, (sum, item) => sum + (item.menuItem.price * item.quantity));

  double get deliveryFee => items.isEmpty ? 0 : 2.99;

  double get total => subtotal + deliveryFee;

  int get itemCount => items.fold(0, (sum, item) => sum + item.quantity);

  factory Cart.fromJson(Map<String, dynamic> json) => _$CartFromJson(json);
}