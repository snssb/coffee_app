import 'package:coffee_shop_app/features/home/presentation/blocs/detail_bloc/detail_event.dart';
import 'package:coffee_shop_app/features/home/presentation/blocs/detail_bloc/detail_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CoffeeDetailBloc extends Bloc<CoffeeDetailEvent, CoffeeDetailState> {
  CoffeeDetailBloc() : super(CoffeeDetailLoading()) {
    on<LoadCoffeeDetail>((event, emit) async {
      try {
        emit(CoffeeDetailLoading());

        final coffee = event.coffee;

        emit(CoffeeDetailLoaded(coffee: coffee));
      } catch (e) {
        emit(CoffeeDetailError(message: 'Не удалось загрузить данные.'));
      }
    });
  }
}
