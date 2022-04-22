import 'package:anicon/widgets/anime_grid.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const kRouteName = "/HomeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              title: const Text('Anicon'),
              pinned: true,
              floating: true,
              forceElevated: innerBoxIsScrolled,
            ),
          ];
        },
        body: const AnimeGrid(),
      ),
    );

    /* @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        title: const Text("Anicon"),
      ),
      body: const AnimeGrid(),
    );*/

    /*Container(
            decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('lib/assets/a.png'),
                repeat: ImageRepeat.repeat),
            ),
            child: const AnimeGrid());
    );*/
  }
}
