import 'package:flutter/material.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favoritos"),
      ),
      //DO FAVOURITES USING SHARED_PREFERENCES AND RIVERPOD. SAVE A LIST OF IDs AND IF IT IS THERE THEN IT IS A FAVOURITE
      body: const Text("Esta es la ventana de favoritos"),
    );
  }
}
