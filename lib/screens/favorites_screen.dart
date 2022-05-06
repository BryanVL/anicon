import 'package:anicon/widgets/favourite_animes_list.dart';
import 'package:flutter/material.dart';

import '../models/search_button.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen>
    with AutomaticKeepAliveClientMixin {
  ScrollController controlScroll =
      ScrollController(initialScrollOffset: 0, keepScrollOffset: true);

  @override
  void dispose() {
    super.dispose();
    controlScroll.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
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
                  onPressed: () {
                    showSearch(context: context, delegate: SearchAnime(true));
                  },
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

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
