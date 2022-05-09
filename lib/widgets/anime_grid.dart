import 'package:anicon/models/anime.dart';
import 'package:anicon/providers/animes_provider.dart';
import 'package:anicon/widgets/anime_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/shared_preferences_provider.dart';

//this class is a grid of animeItems
class AnimeGrid extends ConsumerWidget {
  final String query;
  final bool fav;
  final bool pending;

  const AnimeGrid(
    this.query,
    this.fav,
    this.pending, {
    Key? key,
  }) : super(key: key);

  List<Anime> filterAnime(List<Anime> animes) {
    List<Anime> result = [];
    animes.forEach(
      (element) {
        if (element.titles['rj']!.toUpperCase().contains(query)) {
          result.add(element);
        } else if (element.titles['en'] != null &&
            element.titles['en']!.toUpperCase().contains(query)) {
          result.add(element);
        }
      },
    );
    return result;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<List<Anime>> animes = ref.watch(animesProvider);
    final favoriteIds = ref.watch(FavoriteIds.provider);
    final pendingIds = ref.watch(PendingIds.provider);
    return animes.when(
      data: (animes) {
        List<Anime> favoriteAnimes = [];
        List<Anime> animesToBuild = [];
        if (fav) {
          for (int i = 0; i < animes.length; i++) {
            if (favoriteIds.contains('${animes[i].id}')) {
              favoriteAnimes.add(animes[i]);
            }
          }
          animesToBuild = filterAnime(favoriteAnimes);
        } else if (pending) {
          for (int i = 0; i < animes.length; i++) {
            if (pendingIds.contains('${animes[i].id}')) {
              favoriteAnimes.add(animes[i]);
            }
          }
          animesToBuild = filterAnime(favoriteAnimes);
        } else {
          animesToBuild = filterAnime(animes);
        }

        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 9 / 16,
          ),
          itemCount: animesToBuild.length,
          itemBuilder: (ctx, i) {
            return AnimeItem(
              id: animesToBuild[i].id,
              imageCoverUrl: animesToBuild[i].coverImageUrl,
              title: animesToBuild[i].titles,
              screenIsFavorite: true,
              screenIsPending: true,
            );
          },
        );
      },
      error: (err, stack) => SizedBox(
        height: 700,
        width: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(Icons.signal_wifi_connected_no_internet_4, size: 100),
            Text(
              "No tienes conexión a internet o hubo un problema al conectarse al servidor, Mensaje de error: $err",
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
      loading: () => SizedBox(
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
    );
  }
}
