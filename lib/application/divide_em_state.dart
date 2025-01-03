part of 'divide_em_bloc.dart';

abstract class DivideEmState {}

class DivideEmInitial extends DivideEmState {}

class DivideEmUpdated extends DivideEmState {
  final int targetSum;
  final List<ButtonModel> buttons;
  final int remainingTime;

  DivideEmUpdated({
    required this.targetSum,
    required this.buttons,
    required this.remainingTime,
  });
}

class DivideEmGameOver extends DivideEmState {
  final int targetSum;
  final List<ButtonModel> buttons;

  DivideEmGameOver({required this.targetSum, required this.buttons});
}

class DivideEmGameWin extends DivideEmState {
  final int targetSum;
  final List<ButtonModel> buttons;

  DivideEmGameWin({required this.targetSum, required this.buttons});
}
