part of 'divide_em_bloc.dart';

abstract class DivideEmEvent {}

class InitializeGame extends DivideEmEvent {}

class CheckNumber extends DivideEmEvent {
  final int selectedNumber;

  CheckNumber(this.selectedNumber);
}

class UpdateTimer extends DivideEmEvent {}

class GameOver extends DivideEmEvent {}

class GameWin extends DivideEmEvent {}
