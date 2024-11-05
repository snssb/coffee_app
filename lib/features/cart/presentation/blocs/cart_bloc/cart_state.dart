import 'package:coffee_shop_app/features/cart/data/cart_model.dart';

abstract class CartState {}

class CartInitial extends CartState {}

class CartLoaded extends CartState {
  final Cart cart;
  final num totalPrice;

  CartLoaded(this.cart) : totalPrice = cart.calculateTotalPrice();
}
