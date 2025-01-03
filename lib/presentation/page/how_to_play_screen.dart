import 'package:flutter/material.dart';

class HowToPlayScreen extends StatelessWidget {
  const HowToPlayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 113,
        automaticallyImplyLeading: false,
        flexibleSpace: Stack(
          children: [
            Positioned(
              left: 40,
              top: 25,
              child: IconButton(
                hoverColor: Colors.transparent,
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Image.asset(
                  'assets/images/icon_back_black.png',
                  width: 84,
                  height: 84,
                ),
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: DecoratedBox(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Color(0xFF96031A),
                  offset: Offset(100, 0),
                )
              ]),
          child: Material(
            color: Color(0xFF011627),
            borderRadius: BorderRadius.circular(20),
            child: SizedBox(
              width: 632,
              height: 650,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 20,
                      bottom: 15,
                    ),
                    child: Text(
                      'Cara Bermain',
                      style: TextStyle(
                        color: Color(0xFFE0E0E2),
                        fontFamily: 'coolvetica',
                        fontSize: 64,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 40,
                      right: 60,
                    ),
                    child: ListTile(
                      leading: Text(
                        '1.',
                        style: TextStyle(
                          fontSize: 32,
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Inter',
                        ),
                      ),
                      title: Text(
                        'Tersedia angka 1 hingga 100 di dalam tabel',
                        style: TextStyle(
                          fontSize: 30,
                          color: Color(0xFFE0E0E2),
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Inter',
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 40,
                      right: 60,
                    ),
                    child: ListTile(
                      leading: Text(
                        '2.',
                        style: TextStyle(
                          fontSize: 32,
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Inter',
                        ),
                      ),
                      title: Text(
                        'Sebuah angka akan muncul di atas',
                        style: TextStyle(
                          fontSize: 30,
                          color: Color(0xFFE0E0E2),
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Inter',
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 40,
                      right: 60,
                    ),
                    child: ListTile(
                      leading: Text(
                        '3.',
                        style: TextStyle(
                          fontSize: 32,
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Inter',
                        ),
                      ),
                      title: Text(
                        'Tekan angka mana saja di dalam tabel yang dapat membagi angka yang muncul tadi',
                        style: TextStyle(
                          fontSize: 30,
                          color: Color(0xFFE0E0E2),
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Inter',
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 40,
                      right: 60,
                    ),
                    child: ListTile(
                      leading: Text(
                        '4.',
                        style: TextStyle(
                          fontSize: 32,
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Inter',
                        ),
                      ),
                      title: Text(
                        'Permainan selesai ketika waktu habis',
                        style: TextStyle(
                          fontSize: 30,
                          color: Color(0xFFE0E0E2),
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Inter',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
