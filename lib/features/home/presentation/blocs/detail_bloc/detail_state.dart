import 'package:coffee_shop_app/core/data/remote_storage/coffees/coffees_model.dart';

abstract class CoffeeDetailState {}

class CoffeeDetailLoading extends CoffeeDetailState {}

class CoffeeDetailLoaded extends CoffeeDetailState {
  final Coffee coffee;

  CoffeeDetailLoaded({required this.coffee});
}

class CoffeeDetailError extends CoffeeDetailState {
  final String message;

  CoffeeDetailError({required this.message});
}
