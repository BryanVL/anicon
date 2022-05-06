import 'package:flutter/material.dart';

import '../models/search_button.dart';

class MyAppBar extends StatelessWidget {
  final bool fav;
  final String title;
  const MyAppBar({Key? key, this.fav = false, this.title = 'Anicon'})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: SearchAnime(fav));
            },
          ),
        ),
      ],
      pinned: false,
      snap: false,
      floating: true,
      title: Text(title),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(20),
        ),
      ),
    );
  }
}
