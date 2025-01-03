import 'package:divide_em/presentation/page/game_screen.dart';
import 'package:divide_em/presentation/page/home_screen.dart';
import 'package:divide_em/presentation/page/how_to_play_screen.dart';
import 'package:divide_em/presentation/page/lose_screen.dart';
import 'package:divide_em/presentation/page/win_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case '/howToPlay':
        return MaterialPageRoute(builder: (_) => const HowToPlayScreen());
      case '/game':
        return MaterialPageRoute(builder: (_) => const GameScreen());
      case '/win':
        return MaterialPageRoute(builder: (_) => const WinScreen());
      case '/lose':
        return MaterialPageRoute(builder: (_) => const LoseScreen());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(title: const Text("Error")),
        body: const Center(child: Text("Page not found!")),
      ),
    );
  }
}
