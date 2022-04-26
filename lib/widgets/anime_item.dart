import 'package:anicon/screens/anime_screen.dart';
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

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              AnimeScreen.kRouteName,
              arguments: id,
            );
          },
          child: Column(
            children: [
              Image.network(imageCoverUrl, fit: BoxFit.fitHeight, height: 300),
              Container(
                width: 200,
                height: 40,
                decoration: const BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10)),
                ),
                margin: const EdgeInsets.only(top: 2),
                child: Text(
                  titulo,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white70,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
