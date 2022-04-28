import 'dart:convert';

import 'package:anicon/models/anime.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

const kToken =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjE2MjUiLCJuYmYiOjE2NTAyNzA5NDQsImV4cCI6MTY1Mjg2Mjk0NCwiaWF0IjoxNjUwMjcwOTQ0fQ.K-FFky_f3q3eGjunufsaLndZOjgTrQmuYFHBvuPcVkg';

final animesProvider = FutureProvider<List<Anime>>(
  (ref) async {
    List<Anime> result = [];
    final url = Uri.https('api.aniapi.com', '/v1/anime', {'year': '2022'});

    final content = json.decode(
      (await http.get(
        url,
        headers: {
          'Authorization': 'Bearer $kToken',
        },
      ))
          .body,
    ) as Map<String, dynamic>;

    final List<dynamic> data = content['data']['documents'];

    data.map(
      (anime) {
        result.add(
          Anime(
            anime['id'],
            anime['titles'],
            anime['descriptions'],
            anime['start_date'],
            anime['end_date'],
            anime['season_period'],
            anime['season_year'],
            anime['episodes_count'],
            anime['cover_image'],
            anime['cover_color'],
            anime['banner_image'],
            List<String>.from(anime['genres']),
            anime['sagas'] != null
                ? (anime['sagas'] as List<dynamic>).length
                : 1,
            anime['score'],
          ),
        );
      },
    ).toList();

    /*result.add(
      Anime(
        content["data"]['mal_id'],
        content["data"]['titles']['en'],
        content["data"]['descriptions']['en'],
        content["data"]['start_date'],
        content["data"]['end_date'],
        content["data"]['season_period'],
        content["data"]['season_year'],
        content["data"]['episodes_count'],
        content["data"]['cover_image'],
        content["data"]['genres'],
        (content["data"]['sagas'] as List<dynamic>).length,
        content["data"]['score'],
      ),
    );*/

    return result;
  },
);

/*class AnimesProvider {
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
        _animes.add(
          Anime(
            idAnime as int,
            dataAnime['data']['titles'],
            dataAnime['data']['descriptions'],
            dataAnime['data']['start_date'],
            dataAnime['data']['end_date'],
            dataAnime['data']['season_period'],
            dataAnime['data']['season_year'],
            dataAnime['data']['episodes_count'],
            dataAnime['data']['cover_image'],
            dataAnime['data']['genres'],
            (dataAnime['data']['sagas'] as List<String>).length,
            dataAnime['data']['score'],
          ),
        );

        print(
            'El anime conseguido tiene id: $idAnime, se llama ${dataAnime['data']['titles']['en']}');
      },
    );
  }
}*/
