import 'package:flutter/material.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Biblioteca"),
      ),
      body: Column(
        children: [
          const Text("Esta es la ventana de biblioteca"),
          ElevatedButton(onPressed: () {}, child: const Text("Boton"))
        ],
      ),
    );
  }
}
