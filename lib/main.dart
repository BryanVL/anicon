import 'package:anicon/screens/home_screen.dart';
import 'package:anicon/screens/tab_bar_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.black,
        ),
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.deepPurple,
        ).copyWith(secondary: Colors.yellowAccent),
      ),
      home: const TabBarScreen(),
      routes: {
        HomeScreen.kRouteName: (ctx) => const HomeScreen(),
        TabBarScreen.kRouteName: (context) => const TabBarScreen(),
      },
    );
  }
}
