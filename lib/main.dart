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
        scaffoldBackgroundColor: Colors.purple,
        appBarTheme: const AppBarTheme(
          elevation: 0.0,
          backgroundColor: Colors.purple,
          //foregroundColor: Colors.transparent,
        ),
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.deepPurple,
          backgroundColor: Colors.purple,
          accentColor: Colors.deepOrange,
        ).copyWith(secondary: Colors.amberAccent),
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
