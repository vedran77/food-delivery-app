import 'package:freezed_annotation/freezed_annotation.dart';
import 'cart.dart';
import 'restaurant.dart';

part 'order.freezed.dart';
part 'order.g.dart';

enum OrderStatus {
  pending,
  confirmed,
  preparing,
  onTheWay,
  delivered,
  cancelled,
}

@freezed
class Order with _$Order {
  const factory Order({
    required String id,
    required String userId,
    required Restaurant restaurant,
    required List<CartItem> items,
    required double subtotal,
    required double deliveryFee,
    required double total,
    required OrderStatus status,
    required DateTime createdAt,
    DateTime? estimatedDeliveryTime,
    String? deliveryAddress,
    String? paymentMethod,
  }) = _Order;

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);
}