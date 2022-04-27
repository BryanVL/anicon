import 'package:anicon/screens/anime_screen.dart';
import 'package:anicon/screens/home_screen.dart';
import 'package:anicon/screens/tab_bar_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: Typography.whiteRedmond,
        dividerColor: Colors.white70,
        scaffoldBackgroundColor: const Color.fromARGB(255, 105, 54, 114),
        appBarTheme: const AppBarTheme(
          elevation: 0.0,
          backgroundColor: Color.fromARGB(255, 105, 54, 114),
          //foregroundColor: Color.fromARGB(255, 105, 54, 114),
        ),
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.deepPurple,
          backgroundColor: const Color.fromARGB(255, 105, 54, 114),
          accentColor: Colors.deepOrange,
        ).copyWith(
          secondary: Colors.amberAccent,
        ),
      ),
      home: const TabBarScreen(),
      routes: {
        HomeScreen.kRouteName: (ctx) => const HomeScreen(),
        TabBarScreen.kRouteName: (context) => const TabBarScreen(),
        AnimeScreen.kRouteName: (context) => const AnimeScreen(),
      },
    );
  }
}
