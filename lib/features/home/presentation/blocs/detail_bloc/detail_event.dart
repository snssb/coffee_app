import 'package:coffee_shop_app/core/data/remote_storage/coffees/coffees_model.dart';

abstract class CoffeeDetailEvent {}

class LoadCoffeeDetail extends CoffeeDetailEvent {
  final Coffee coffee;

  LoadCoffeeDetail({required this.coffee});
}
