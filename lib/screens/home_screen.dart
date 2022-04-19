import 'package:anicon/widgets/anime_grid.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const kRouteName = "/HomeScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Anicon"),
      ),
      body: const AnimeGrid(),
    );
  }
}
