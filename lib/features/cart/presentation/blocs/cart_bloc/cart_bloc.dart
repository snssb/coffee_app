import 'package:coffee_shop_app/features/cart/data/cart_model.dart';
import 'package:coffee_shop_app/features/cart/presentation/blocs/cart_bloc/cart_event.dart';
import 'package:coffee_shop_app/features/cart/presentation/blocs/cart_bloc/cart_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<AddToCart>(_onAddToCart);
    on<RemoveFromCart>(_onRemoveFromCart);
    on<UpdateQuantity>(_onUpdateQuantity);
  }

  Cart get currentCart =>
      state is CartLoaded ? (state as CartLoaded).cart : Cart();

  void _onAddToCart(AddToCart event, Emitter<CartState> emit) {
    final cart = currentCart;
    final existingItemIndex = cart.items.indexWhere(
      (item) =>
          item.coffee == event.cartItem.coffee &&
          item.size == event.cartItem.size,
    );

    List<CartItem> updatedItems = List.from(cart.items);

    if (existingItemIndex != -1) {
      final existingItem = updatedItems[existingItemIndex];
      final updatedItem = existingItem.copyWith(
        quantity: existingItem.quantity + event.cartItem.quantity,
      );
      updatedItems[existingItemIndex] = updatedItem;
    } else {
      updatedItems.add(event.cartItem);
    }

    emit(CartLoaded(cart.copyWith(items: updatedItems)));
    print(cart);
  }

  void _onRemoveFromCart(RemoveFromCart event, Emitter<CartState> emit) {
    final cart = currentCart;
    List<CartItem> updatedItems = List.from(cart.items)
      ..removeWhere((item) => item == event.item);

    emit(CartLoaded(cart.copyWith(items: updatedItems)));
  }

  void _onUpdateQuantity(UpdateQuantity event, Emitter<CartState> emit) {
    final cart = currentCart;
    final itemIndex = cart.items.indexWhere((item) => item == event.item);

    if (itemIndex != -1) {
      List<CartItem> updatedItems = List.from(cart.items);
      final updatedItem = updatedItems[itemIndex].copyWith(
        quantity: event.newQuantity,
      );
      updatedItems[itemIndex] = updatedItem;
      emit(CartLoaded(cart.copyWith(items: updatedItems)));
    }
  }
}
