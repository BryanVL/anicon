import 'package:anicon/screens/anime_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

//this widget creates the "boxes" of the initial page
class AnimeItem extends StatefulWidget {
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
  State<AnimeItem> createState() => _AnimeItemState();
}

class _AnimeItemState extends State<AnimeItem> {
  bool favorite = false;
  @override
  Widget build(BuildContext context) {
    final String titulo = widget.title['en'] != null
        ? widget.title['en']!
        : 'No english title found';

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              AnimeScreen.kRouteName,
              arguments: widget.id,
            );
          },
          child: Column(
            children: [
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CachedNetworkImage(
                    imageUrl: widget.imageCoverUrl,
                    fit: BoxFit.fitHeight,
                    height: 300,
                    placeholder: (context, url) => SizedBox(
                      height: 725,
                      width: 100,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          CircularProgressIndicator(color: Colors.black),
                        ],
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      favorite ? Icons.star : Icons.star_border_outlined,
                      color: Theme.of(context).colorScheme.secondary,
                      size: 35,
                    ),
                    onPressed: () {
                      setState(() {
                        favorite = !favorite;
                      });
                    },
                  ),
                ],
              ),
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
