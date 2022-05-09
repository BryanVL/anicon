import 'package:flutter/material.dart';

import '../widgets/anime_grid.dart';

class SearchAnime extends SearchDelegate {
  final bool fav;
  final bool pending;

  SearchAnime(this.fav, this.pending);

  @override
  ThemeData appBarTheme(BuildContext context) {
    final ThemeData theme = Theme.of(context).copyWith(
      appBarTheme: AppBarTheme(backgroundColor: Theme.of(context).canvasColor),
    );

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
    return AnimeGrid(query.toUpperCase(), fav, pending);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return AnimeGrid(query.toUpperCase(), fav, pending);
  }
}
