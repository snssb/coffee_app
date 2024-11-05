import 'package:flutter_bloc/flutter_bloc.dart';
import 'bottom_menu_event.dart';
import 'bottom_menu_state.dart';

class BottomMenuBloc extends Bloc<BottomMenuEvent, BottomMenuState> {
  BottomMenuBloc() : super(BottomMenuInitial()) {
    on<SelectBottomMenuItem>((event, emit) {
      emit(BottomMenuState(selectedIndex: event.index));
    });
  }
}
