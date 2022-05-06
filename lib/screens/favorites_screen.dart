import 'package:anicon/widgets/favourite_animes_list.dart';
import 'package:anicon/widgets/my_appbar.dart';
import 'package:flutter/material.dart';

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
    return const Scaffold(
      //DO FAVOURITES USING SHARED_PREFERENCES AND RIVERPOD. SAVE A LIST OF IDs AND IF IT IS THERE THEN IT IS A FAVOURITE
      body: CustomScrollView(
        slivers: <Widget>[
          MyAppBar(
            fav: true,
          ),
          //Here goes the body of the page
          FavouriteAnimesList(),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
