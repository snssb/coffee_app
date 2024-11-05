import 'package:coffee_shop_app/core/data/remote_storage/coffees/coffees_model.dart';

class CoffeeState {
  final List<Coffee> allCoffees;
  final List<Coffee> filteredCoffees;
  final bool isLoading;
  final String? error;

  CoffeeState({
    this.allCoffees = const [],
    this.filteredCoffees = const [],
    this.isLoading = false,
    this.error,
  });

  CoffeeState copyWith({
    List<Coffee>? allCoffees,
    List<Coffee>? filteredCoffees,
    bool? isLoading,
    String? error,
  }) {
    return CoffeeState(
      allCoffees: allCoffees ?? this.allCoffees,
      filteredCoffees: filteredCoffees ?? this.filteredCoffees,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }
}
