import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/anime.dart';
import '../providers/animes_provider.dart';

class AnimeViewItem extends ConsumerWidget {
  const AnimeViewItem(this.id, {Key? key}) : super(key: key);
  final int id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<List<Anime>> animes = ref.watch(animesProvider);
    return animes.when(
      data: (List<Anime> data) {
        final Anime anime = data.firstWhere((element) => element.id == id);
        /* anime.titles.forEach((key, value) {
          value != null ? value : "No title found";
        });*/

        return CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              pinned: false,
              snap: false,
              floating: true,
              expandedHeight: 180.0,
              flexibleSpace: FlexibleSpaceBar(
                //title: Text('Placeholder'),
                background: Image.network(
                  anime.bannerImage != null
                      ? anime.bannerImage!
                      : "https://s4.anilist.co/file/anilistcdn/media/anime/banner/138424-DGPPFxUinNmt.jpg",
                  fit: BoxFit.cover,
                ),
              ),
              title: Text(anime.titles['en'] ?? ""),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 750,
                //child: Text(anime.titles['en']),
              ),
            ),
          ],
        );
      },
      error: (error, stackTrace) => SliverToBoxAdapter(
        child: SizedBox(
          height: 700,
          width: 100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Icon(Icons.signal_wifi_connected_no_internet_4, size: 100),
              Text(
                "Ha ocurrido algun problema",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
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
