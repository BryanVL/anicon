import 'package:anicon/widgets/anime_grid_sliver.dart';
import 'package:anicon/widgets/my_appbar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const kRouteName = "/HomeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with AutomaticKeepAliveClientMixin {
  //double offSet = 0;
  /*ScrollController controlScroll =
      ScrollController(initialScrollOffset: 0, keepScrollOffset: true);*/

  @override
  void dispose() {
    super.dispose();
    //controlScroll.dispose();
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

    return const Scaffold(
      body: CustomScrollView(
        //controller: controlScroll,
        slivers: <Widget>[
          MyAppBar(),
          AnimeGridSliver(),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
