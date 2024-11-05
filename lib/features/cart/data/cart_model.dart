import 'package:coffee_shop_app/core/data/remote_storage/coffees/coffees_model.dart';

class CartItem {
  final Coffee coffee;
  final int quantity;
  final String size;
  final num price;

  CartItem({
    required this.coffee,
    required this.quantity,
    required this.size,
    required this.price,
  });

  CartItem copyWith({
    Coffee? coffee,
    int? quantity,
    String? size,
    num? price,
  }) {
    return CartItem(
      coffee: coffee ?? this.coffee,
      quantity: quantity ?? this.quantity,
      size: size ?? this.size,
      price: price ?? this.price,
    );
  }

  num get totalItemPrice => quantity * price;
}

class Cart {
  final List<CartItem> items;

  Cart({this.items = const []});

  double calculateTotalPrice() {
    double total = items.fold(0, (total, item) => total + item.totalItemPrice);
    total += 1.95 + 2.95;
    return total;
  }

  Cart copyWith({List<CartItem>? items}) {
    return Cart(items: items ?? this.items);
  }
}
