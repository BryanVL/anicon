import 'package:anicon/widgets/pending_animes_list.dart';
import 'package:flutter/material.dart';

import '../widgets/my_appbar.dart';

class LibraryScreen extends StatefulWidget {
  const LibraryScreen({Key? key}) : super(key: key);

  @override
  State<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return const Scaffold(
      //DO FAVOURITES USING SHARED_PREFERENCES AND RIVERPOD. SAVE A LIST OF IDs AND IF IT IS THERE THEN IT IS A FAVOURITE
      body: CustomScrollView(
        slivers: <Widget>[
          MyAppBar(
            pending: true,
            title: 'Pendientes',
          ),
          //Here goes the body of the page
          PendingAnimesList(),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
