import 'package:anicon/widgets/favourite_animes_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoritesScreen extends ConsumerWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      //DO FAVOURITES USING SHARED_PREFERENCES AND RIVERPOD. SAVE A LIST OF IDs AND IF IT IS THERE THEN IT IS A FAVOURITE
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 16),
                child: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {},
                ),
              ),
            ],
            pinned: false,
            snap: false,
            floating: true,
            title: const Text("Favoritos"),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(20),
              ),
            ),
          ),
          //Here goes the body of the page
          const FavouriteAnimesList(),
        ],
      ),
    );
  }
}
