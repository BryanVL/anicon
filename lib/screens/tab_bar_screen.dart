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
  List<Map<String, Object>>? _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      {'page': const FavoritesScreen(), 'title': 'Favoritos'},
      {'page': const HomeScreen(), 'title': 'Recientes'},
      {'page': const LibraryScreen(), 'title': 'Biblioteca'},
    ];
  }

  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: (_pages![_selectedPageIndex]['page']) as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.black,
        currentIndex: _selectedPageIndex,
        selectedFontSize: 16,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favoritos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Recientes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books),
            label: 'Biblioteca',
          ),
        ],
      ),
    );
  }
}
