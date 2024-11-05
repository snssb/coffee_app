abstract class BottomMenuEvent {}

class SelectBottomMenuItem extends BottomMenuEvent {
  final int index;

  SelectBottomMenuItem(this.index);
}
