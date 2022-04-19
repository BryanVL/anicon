import 'package:flutter/material.dart';

//Este widget son las cajitas que salen en la pagina inicial
class AnimeItem extends StatelessWidget {
  final int id;
  final String imageCoverUrl;
  final String title;

  const AnimeItem({
    Key? key,
    required this.id,
    required this.imageCoverUrl,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network(imageCoverUrl),
        Text(title),
      ],
    );
  }
}
