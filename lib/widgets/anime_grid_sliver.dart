import 'package:anicon/models/anime.dart';
import 'package:anicon/providers/animes_provider.dart';
import 'package:anicon/widgets/anime_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//this class is a grid of animeItems with slivers
class AnimeGridSliver extends ConsumerWidget {
  const AnimeGridSliver({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<List<Anime>> animes = ref.watch(animesProvider);

    return animes.when(
      data: (animes) {
        return SliverGrid(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 9 / 16,
          ),
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int i) {
              return AnimeItem(
                //key: animes[i].id,
                id: animes[i].id,
                imageCoverUrl: animes[i].coverImageUrl,
                title: animes[i].titles,
              );
            },
            childCount: animes.length,
          ),
        );
      },
      //HAVE TO PUT AN EMPTY SLIVER FOR THE APP TO NOT EXPLODE WITHOUT INTERNET
      error: (err, stack) => SliverToBoxAdapter(
        child: SizedBox(
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
      ),
      loading: () => SliverToBoxAdapter(
        child: SizedBox(
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
    );
  }
}
