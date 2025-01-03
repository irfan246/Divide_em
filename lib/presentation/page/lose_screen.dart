import 'package:divide_em/application/divide_em_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoseScreen extends StatelessWidget {
  const LoseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DivideEmBloc, DivideEmState>(
      builder: (context, state) {
        if (state is DivideEmGameOver) {
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
            body: Stack(
              children: [
                Positioned.fill(
                  child: Image.asset(
                    'assets/images/background.png',
                    fit: BoxFit.fitHeight,
                  ),
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Coba Lagi',
                        style: TextStyle(
                          fontFamily: 'coolvetica',
                          fontSize: 96,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 32),
                      ElevatedButton(
                        onPressed: () {
                          context.read<DivideEmBloc>().add(InitializeGame());
                          Navigator.of(context).pop();
                        },
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(184, 82),
                          backgroundColor: Color(0xFF011627),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: Row(
                          children: [
                            Text(
                              'Ulang',
                              style: TextStyle(
                                color: Color(0xFFE0E0E2),
                                fontFamily: 'coolvetica',
                                fontSize: 35,
                              ),
                            ),
                            SizedBox(width: 8),
                            Icon(
                              Icons.play_arrow_rounded,
                              size: 45,
                              color: Color(0xFFE0E0E2),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
