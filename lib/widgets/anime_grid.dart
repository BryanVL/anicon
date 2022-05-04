import 'package:anicon/models/anime.dart';
import 'package:anicon/providers/animes_provider.dart';
import 'package:anicon/widgets/anime_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//this class is a grid of animeItems
class AnimeGrid extends ConsumerWidget {
  const AnimeGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<List<Anime>> animes = ref.watch(animesProvider);

    return animes.when(
      data: (animes) {
        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 9 / 16,
          ),
          itemCount: animes.length,
          itemBuilder: (ctx, i) {
            return AnimeItem(
              id: animes[i].id,
              imageCoverUrl: animes[i].coverImageUrl,
              title: animes[i].titles,
            );
          },
        );
      },
      error: (err, stack) => Text('Error: $err'),
      loading: () => const CircularProgressIndicator(),
    );
  }
}
