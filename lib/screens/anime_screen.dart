import 'package:anicon/widgets/anime_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AnimeScreen extends ConsumerWidget {
  const AnimeScreen({Key? key}) : super(key: key);
  static const kRouteName = "/AnimeScreen";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //Id of anime that is needed to create the animeViewItem
    final int animeId = ModalRoute.of(context)!.settings.arguments as int;
    return Scaffold(
      body: AnimeViewItem(animeId),
    );
  }
}
