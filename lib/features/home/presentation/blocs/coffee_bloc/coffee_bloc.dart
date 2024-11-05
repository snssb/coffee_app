import 'package:coffee_shop_app/core/data/remote_storage/coffees/coffees_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'coffee_event.dart';
import 'coffee_state.dart';

class CoffeeBloc extends Bloc<CoffeeEvent, CoffeeState> {
  final CoffeeRepository _coffeeRepository;

  CoffeeBloc(this._coffeeRepository) : super(CoffeeState()) {
    on<LoadCoffees>(_onLoadCoffees);
    on<FilterCoffeesByCategory>(_onFilterCoffeesByCategory);
  }

  Future<void> _onLoadCoffees(
      LoadCoffees event, Emitter<CoffeeState> emit) async {
    if (state.allCoffees.isNotEmpty) {
      emit(state);
      return;
    }

    emit(state.copyWith(isLoading: true));
    try {
      final coffees = await _coffeeRepository.getCoffees();
      emit(state.copyWith(
          allCoffees: coffees, filteredCoffees: coffees, isLoading: false));
    } catch (e) {
      emit(state.copyWith(error: e.toString(), isLoading: false));
    }
  }

  void _onFilterCoffeesByCategory(
      FilterCoffeesByCategory event, Emitter<CoffeeState> emit) {
    final filtered = state.allCoffees
        .where((coffee) => coffee.category == event.category)
        .toList();
    emit(state.copyWith(filteredCoffees: filtered));
  }
}
