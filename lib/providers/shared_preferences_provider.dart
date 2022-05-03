import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final favourites = SharedPreferences.getInstance();

final sharedPreferencesProvider = FutureProvider<SharedPreferences>(
    (_) async => await SharedPreferences.getInstance());

class FavoriteIds extends StateNotifier<List<String>> {
  final SharedPreferences? pref;
  FavoriteIds(this.pref) : super(pref?.getStringList("ids") ?? []);

  static final provider = StateNotifierProvider<FavoriteIds, List<String>>(
    (ref) {
      final pref = ref.watch(sharedPreferencesProvider).maybeWhen(
            data: (value) => value,
            orElse: () => null,
          );
      return FavoriteIds(pref);
    },
  );

  void toggle(String favoriteId) {
    if (state.contains(favoriteId)) {
      state = state.where((id) => id != favoriteId).toList();
    } else {
      state = [...state, favoriteId];
    }
    // Throw here since for some reason SharedPreferences could not be retrieved
    pref!.setStringList("ids", state);
  }
}
