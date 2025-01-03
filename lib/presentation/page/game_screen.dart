import 'package:divide_em/application/divide_em_bloc.dart';
import 'package:divide_em/presentation/page/lose_screen.dart';
import 'package:divide_em/presentation/page/win_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DivideEmBloc, DivideEmState>(
      builder: (context, state) {
        if (state is DivideEmUpdated) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Color(0xFF96031A),
              elevation: 0,
              toolbarHeight: 110,
              automaticallyImplyLeading: false,
              flexibleSpace: Stack(
                children: [
                  Positioned(
                    left: 30,
                    child: IconButton(
                      hoverColor: Colors.transparent,
                      onPressed: () {
                        context.read<DivideEmBloc>().add(InitializeGame());
                        Navigator.of(context).pop();
                      },
                      icon: Image.asset(
                        'assets/images/icon_back.png',
                        width: 84,
                        height: 84,
                      ),
                    ),
                  ),
                  Positioned(
                    right: 40,
                    child: Text(
                      state.remainingTime.toString(),
                      style: TextStyle(
                        color: Color(0xFFE0E0E2),
                        fontFamily: 'coolvetica',
                        fontSize: 70,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
              title: Text(
                state.targetSum.toString(),
                style: TextStyle(
                  color: Color(0xFFE0E0E2),
                  fontFamily: 'coolvetica',
                  fontSize: 96,
                  fontWeight: FontWeight.w400,
                ),
              ),
              centerTitle: true,
            ),
            body: Center(
              child: SizedBox(
                width: 900,
                height: 900,
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 10,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                  ),
                  itemCount: state.buttons.length,
                  itemBuilder: (context, index) {
                    final button = state.buttons[index];
                    Color buttonColor;

                    if ((index ~/ 10) % 2 == 0) {
                      buttonColor = const Color(0xFF96031A);
                    } else {
                      buttonColor = const Color(0xFFFAA916);
                    }

                    return DecoratedBox(
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                          color: Colors.black.withAlpha(191),
                          offset: Offset(0, 7),
                        )
                      ]),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: buttonColor,
                            fixedSize: Size(53, 55),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0),
                            )),
                        onPressed: () {
                          context
                              .read<DivideEmBloc>()
                              .add(CheckNumber(button.number));
                        },
                        child: Text(
                          button.number.toString(),
                          style: TextStyle(
                            fontSize: 21,
                            color: button.isCorrect
                                ? Colors.white
                                : Color(0xFF011627),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          );
        } else if (state is DivideEmGameOver) {
          return LoseScreen();
        } else if (state is DivideEmGameWin) {
          return WinScreen();
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
