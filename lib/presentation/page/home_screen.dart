import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.png',
              width: 486.99,
              height: 482,
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/game');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF011627),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    fixedSize: Size(132.85, 123.36),
                  ),
                  child: Image.asset('assets/images/icon_play.png'),
                ),
                SizedBox(
                  width: 110,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/howToPlay');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF011627),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    fixedSize: Size(132.85, 123.36),
                  ),
                  child: Image.asset('assets/images/icon_question_mark.png'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
