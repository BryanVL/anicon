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
        childAspectRatio: 6 / 2,
      ),
      itemBuilder: (ctx, i) {
        return const AnimeItem(
          id: 1,
          imageCoverUrl: '',
          title: '',
        ); //Placeholder
      },
    );
  }
}
