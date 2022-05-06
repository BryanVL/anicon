import 'package:flutter/material.dart';

import '../widgets/anime_grid.dart';

class SearchAnime extends SearchDelegate {
  final bool fav;

  SearchAnime(this.fav);

  @override
  ThemeData appBarTheme(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return theme;
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return AnimeGrid(query.toUpperCase(), fav);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return AnimeGrid(query.toUpperCase(), fav);
  }
}
