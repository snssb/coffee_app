import 'package:coffee_shop_app/features/cart/data/cart_model.dart';

abstract class CartEvent {}

class AddToCart extends CartEvent {
  final CartItem cartItem;

  AddToCart({required this.cartItem});
}

class RemoveFromCart extends CartEvent {
  final CartItem item;

  RemoveFromCart(this.item);
}

class UpdateQuantity extends CartEvent {
  final CartItem item;
  final int newQuantity;

  UpdateQuantity(this.item, this.newQuantity);
}
