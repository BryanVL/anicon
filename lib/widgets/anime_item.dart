import 'package:flutter/material.dart';

//this widget creates the "boxes" of the initial page
class AnimeItem extends StatelessWidget {
  final int id;
  final String imageCoverUrl;
  final Map<String, dynamic> title;

  const AnimeItem({
    Key? key,
    required this.id,
    required this.imageCoverUrl,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String titulo =
        title['en'] != null ? title['en']! : 'No english title found';

    return Column(
      children: [
        Image.network(imageCoverUrl),
        Text(titulo),
      ],
    );
  }
}
