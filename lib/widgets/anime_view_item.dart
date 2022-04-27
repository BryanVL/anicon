import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/anime.dart';
import '../providers/animes_provider.dart';

class AnimeViewItem extends ConsumerWidget {
  const AnimeViewItem(this.id, {Key? key}) : super(key: key);
  final int id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold();
    /*AsyncValue<List<Anime>> animes = ref.watch(animesProvider);
    String generos = "";
    return animes.when(
      data: (List<Anime> data) {
        final Anime anime = data.firstWhere((element) => element.id == id);
        anime.genres.forEach(
          (element) {
            generos = generos + "$element, ";
          },
        );
        return CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              pinned: true,
              snap: false,
              floating: true,
              expandedHeight: 180.0,
              collapsedHeight: 60,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(anime.titles['en'] ?? ""),
                background: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                  child: Image.network(
                    anime.bannerImage != null
                        ? anime.bannerImage!
                        : "https://s4.anilist.co/file/anilistcdn/media/anime/banner/138424-DGPPFxUinNmt.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              //title: Text(anime.titles['en'] ?? ""),
            ),
            SliverToBoxAdapter(
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                //height: 750,
                width: 200,
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        anime.coverImageUrl,
                        fit: BoxFit.contain,
                        height: 450,
                      ),
                    ),
                    const SizedBox(
                        width: 300,
                        child: Divider(
                          height: 20,
                          thickness: 1,
                          //color: Colors.black,
                        )),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 20),
                      height: 25,
                      width: 300,
                      child: const Text(
                        "Otros titulos",
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Column(
                        children: anime.titles.values
                            .map((e) => Container(
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 1),
                                  height: 40,
                                  width: 300,
                                  child: Text(
                                    "$e",
                                    textAlign: TextAlign.left,
                                    style: const TextStyle(color: Colors.grey),
                                  ),
                                ))
                            .toList(),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 20),
                      height: 25,
                      width: 300,
                      child: const Text(
                        "Descripciones",
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Column(
                        children: anime.descriptions.values
                            .map((e) => Container(
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  //height: 40,
                                  width: 300,
                                  child: Text(
                                    "$e",
                                    textAlign: TextAlign.left,
                                    style: const TextStyle(color: Colors.grey),
                                  ),
                                ))
                            .toList(),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 20),
                      height: 25,
                      width: 300,
                      child: const Text(
                        "Más información",
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          //height: 300,
                          width: 300,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Colors.black.withOpacity(0.5),
                                  Colors.black.withOpacity(0.2)
                                ]),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              width: 1,
                              color: Colors.black.withOpacity(0.5),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    "Puntuacion: ",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white70),
                                  ),
                                  Text(
                                    "${anime.score}",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary,
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                width: 300,
                                margin: const EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 10),
                                child: Column(
                                  children: [
                                    const Text(
                                      "Generos",
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.white70),
                                    ),
                                    Text(
                                      generos.substring(0, generos.length - 2),
                                      style:
                                          const TextStyle(color: Colors.grey),
                                      textAlign: TextAlign.justify,
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(vertical: 15),
                                height: 200,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: Text(
                                        "Episodios\n${anime.numEpisodes}",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: Text(
                                        "Temporadas\n${anime.numSeasons}",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
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
    );*/
  }
}
