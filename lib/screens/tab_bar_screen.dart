import 'package:anicon/screens/favorites_screen.dart';
import 'package:anicon/screens/home_screen.dart';
import 'package:anicon/screens/library_screen.dart';
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
  void dispose() {
    super.dispose();
    controlPage.dispose();
  }

  final controlPage = PageController(
    initialPage: 1,
  );

  int _selectedPageIndex = 1;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final pageViewTab = PageView(
      controller: controlPage,
      scrollDirection: Axis.horizontal,
      onPageChanged: _selectPage,
      children: const [
        LibraryScreen(),
        HomeScreen(),
        FavoritesScreen(),
      ],
    );

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: pageViewTab /*(_pages![_selectedPageIndex]['page']) as Widget*/,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          controlPage.animateToPage(
            index,
            duration: const Duration(milliseconds: 300),
            curve: Curves.ease,
          );
        },
        backgroundColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        currentIndex: _selectedPageIndex,
        selectedFontSize: 16,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books),
            label: 'Biblioteca',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Recientes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favoritos',
          ),
        ],
      ),
    );
  }
}
