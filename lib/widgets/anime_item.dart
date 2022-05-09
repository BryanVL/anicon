import 'package:anicon/screens/anime_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/shared_preferences_provider.dart';

//this widget creates the "boxes" of the initial page
//IDEA: SHOW IF THE ITEM IS AN ANIME, OVA, MOVIE, ETC...
class AnimeItem extends ConsumerWidget {
  final int id;
  final String imageCoverUrl;
  final Map<String, String?> title;
  bool favorite;
  bool pending;
  final bool screenIsPending;
  final bool screenIsFavorite;

  AnimeItem({
    Key? key,
    required this.id,
    required this.imageCoverUrl,
    required this.title,
    this.screenIsPending = false,
    this.screenIsFavorite = false,
    this.favorite = false,
    this.pending = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteIds = ref.watch(FavoriteIds.provider);
    favorite = favoriteIds.contains('$id');
    final pendingIds = ref.watch(PendingIds.provider);
    pending = pendingIds.contains('$id');
    final String titulo = title['rj'] != null ? title['rj']! : 'No title found';

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          CircularProgressIndicator(color: Colors.black),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 35,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10)),
                      color: Colors.black38,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        screenIsPending
                            ? IconButton(
                                icon: Icon(
                                  pending
                                      ? Icons.library_add_check
                                      : Icons.library_add,
                                  color: pending
                                      ? Colors.green
                                      : Colors
                                          .amberAccent, //Theme.of(context).colorScheme.secondary,
                                  size: 24,
                                ),
                                onPressed: () => ref
                                    .watch(PendingIds.provider.notifier)
                                    .toggle(id.toString()),
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                              )
                            : const SizedBox(),
                        screenIsFavorite
                            ? IconButton(
                                icon: Icon(
                                  favorite
                                      ? Icons.favorite
                                      : Icons.favorite_border_outlined,
                                  color: Colors.red,
                                  size: 24,
                                ),
                                onPressed: () => ref
                                    .watch(FavoriteIds.provider.notifier)
                                    .toggle(id.toString()),
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                              )
                            : const SizedBox(),
                      ],
                    ),
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
                //margin: const EdgeInsets.only(top: 2),
                alignment: Alignment.center,
                child: Text(
                  titulo,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  textAlign: TextAlign.left,
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
