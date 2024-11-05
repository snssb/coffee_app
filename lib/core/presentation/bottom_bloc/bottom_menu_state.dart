class BottomMenuState {
  final int selectedIndex;

  BottomMenuState({required this.selectedIndex});
}

class BottomMenuInitial extends BottomMenuState {
  BottomMenuInitial() : super(selectedIndex: 0);
}
