import 'package:anicon/screens/anime_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/shared_preferences_provider.dart';

//this widget creates the "boxes" of the initial page
class AnimeItem extends ConsumerWidget {
  final int id;
  final String imageCoverUrl;
  final Map<String, String?> title;
  bool favorite;

  AnimeItem({
    Key? key,
    required this.id,
    required this.imageCoverUrl,
    required this.title,
    this.favorite = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteIds = ref.watch(FavoriteIds.provider);
    favorite = favoriteIds.contains('$id');
    final String titulo = title['rj'] != null ? title['rj']! : 'No title found';

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
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CachedNetworkImage(
                    imageUrl: imageCoverUrl,
                    fit: BoxFit.fitHeight,
                    height: 280,
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
                      favorite
                          ? Icons.favorite
                          : Icons.favorite_border_outlined,
                      color: Colors.red,
                      size: 35,
                    ),
                    onPressed: () => ref
                        .watch(FavoriteIds.provider.notifier)
                        .toggle(id.toString()),
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
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
