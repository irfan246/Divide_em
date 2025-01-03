import 'package:divide_em/application/divide_em_bloc.dart';
import 'package:divide_em/route/route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(BlocProvider(
    create: (context) => DivideEmBloc()..add(InitializeGame()),
    child: App(),
  ));
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: Color(0xFFE0E0E2)),
      initialRoute: '/',
      onGenerateRoute: AppRouter().generateRoute,
    );
  }
}
