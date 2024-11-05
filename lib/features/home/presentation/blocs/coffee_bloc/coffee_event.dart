abstract class CoffeeEvent {}

class LoadCoffees extends CoffeeEvent {}

class FilterCoffeesByCategory extends CoffeeEvent {
  final String category;

  FilterCoffeesByCategory(this.category);
}
