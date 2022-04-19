import 'package:flutter/material.dart';

//Esto es la barra de navagación de abajo
class TabBarScreen extends StatefulWidget {
  const TabBarScreen({Key? key}) : super(key: key);
  static const String kRouteName = "/tabBarScreen";

  @override
  State<TabBarScreen> createState() => _TabBarScreenState();
}

class _TabBarScreenState extends State<TabBarScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
