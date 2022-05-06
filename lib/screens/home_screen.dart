import 'package:anicon/widgets/anime_grid_sliver.dart';
import 'package:flutter/material.dart';

import '../models/search_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const kRouteName = "/HomeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with AutomaticKeepAliveClientMixin {
  //double offSet = 0;
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
    /*ScrollController controlScroll =
        ScrollController(initialScrollOffset: offSet, keepScrollOffset: true);*/

    /*controlScroll.addListener(() {
      setState(() {
        offSet = controlScroll.offset;
      });
    });*/

    return Scaffold(
      body: CustomScrollView(
        controller: controlScroll,
        slivers: <Widget>[
          SliverAppBar(
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 16),
                child: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    showSearch(context: context, delegate: SearchAnime(false));
                  },
                ),
              ),
            ],
            pinned: false,
            snap: false,
            floating: true,
            title: const Text("Anicon"),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(20),
              ),
            ),
          ),
          const AnimeGridSliver(),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
