import 'dart:async';
import 'dart:math';
import 'package:bloc/bloc.dart';
import 'package:divide_em/domain/button_model.dart';

part 'divide_em_event.dart';
part 'divide_em_state.dart';

class DivideEmBloc extends Bloc<DivideEmEvent, DivideEmState> {
  Timer? _timer;
  static const int _initialTime = 120;

  DivideEmBloc() : super(DivideEmInitial()) {
    on<InitializeGame>(_initializeGame);
    on<CheckNumber>(_checkNumber);
    on<UpdateTimer>(_updateTimer);
    on<GameOver>(_gameOver);
    on<GameWin>(_gameWin);
  }

  void _initializeGame(InitializeGame event, Emitter<DivideEmState> emit) {
    _timer?.cancel();

    final random = Random();
    int targetSum = random.nextInt(100) + 1;

    List<ButtonModel> buttons = List.generate(
      100,
      (index) => ButtonModel(number: index + 1),
    );

    emit(DivideEmUpdated(
      targetSum: targetSum,
      buttons: buttons,
      remainingTime: _initialTime,
    ));

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      add(UpdateTimer());
    });
  }

  void _checkNumber(CheckNumber event, Emitter<DivideEmState> emit) {
    if (state is DivideEmUpdated) {
      final currentState = state as DivideEmUpdated;
      final updatedButtons = currentState.buttons.map((button) {
        if (button.number == event.selectedNumber) {
          button.isCorrect =
              (currentState.targetSum / event.selectedNumber) % 1 == 0;
        }
        return button;
      }).toList();

      emit(DivideEmUpdated(
        targetSum: currentState.targetSum,
        buttons: updatedButtons,
        remainingTime: currentState.remainingTime,
      ));

      add(GameWin());
    }
  }

  void _updateTimer(UpdateTimer event, Emitter<DivideEmState> emit) {
    if (state is DivideEmUpdated) {
      final currentState = state as DivideEmUpdated;
      if (currentState.remainingTime > 1) {
        emit(DivideEmUpdated(
          targetSum: currentState.targetSum,
          buttons: currentState.buttons,
          remainingTime: currentState.remainingTime - 1,
        ));
      } else {
        add(GameOver());
      }
    }
  }

  void _gameWin(GameWin event, Emitter<DivideEmState> emit) {
    if (state is DivideEmUpdated) {
      final currentState = state as DivideEmUpdated;
      final allCorrect = currentState.buttons.every((button) {
        if ((currentState.targetSum / button.number) % 1 == 0) {
          return button.isCorrect;
        }
        return true;
      });

      if (allCorrect) {
        emit(DivideEmGameWin(
          targetSum: currentState.targetSum,
          buttons: currentState.buttons,
        ));
        _timer?.cancel();
      }
    }
  }

  void _gameOver(GameOver event, Emitter<DivideEmState> emit) {
    if (state is DivideEmUpdated) {
      final currentState = state as DivideEmUpdated;
      emit(DivideEmGameOver(
        targetSum: currentState.targetSum,
        buttons: currentState.buttons,
      ));
      _timer?.cancel();
    }
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
