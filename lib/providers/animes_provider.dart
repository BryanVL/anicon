import 'dart:convert';

import 'package:anicon/models/anime.dart';
import 'package:http/http.dart' as http;

class AnimesProvider {
  final kToken =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjE2MjUiLCJuYmYiOjE2NTAyNzA5NDQsImV4cCI6MTY1Mjg2Mjk0NCwiaWF0IjoxNjUwMjcwOTQ0fQ.K-FFky_f3q3eGjunufsaLndZOjgTrQmuYFHBvuPcVkg';

  List<Anime> _animes = [];

  List<Anime> get animes {
    return [..._animes];
  }

  Future<void> fetchAndSetAnimes() async {
    final url = Uri.https('api.aniapi.com', '/v1/anime/1');
    final response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer $kToken',
      },
    );

    final data = json.decode(response.body) as Map<String, dynamic>;
    data.forEach(
      (idAnime, dataAnime) {
        print(
            'El anime conseguido tiene id: $idAnime, se llama ${dataAnime['data']['titles']['en']}');
      },
    );
  }
}
