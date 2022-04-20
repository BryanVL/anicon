import 'package:anicon/widgets/anime_item.dart';
import 'package:flutter/material.dart';

//Esta clase es un grid de animeItems
class AnimeGrid extends StatelessWidget {
  const AnimeGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.5 / 2,
      ),
      itemBuilder: (ctx, i) {
        return const AnimeItem(
          id: 1,
          imageCoverUrl:
              'http://orig03.deviantart.net/cd5c/f/2013/083/c/b/one_piece_cover_61_by_i_sanx-d5z2zrr.jpg',
          title: '',
        ); //Placeholder
      },
    );
  }
}
