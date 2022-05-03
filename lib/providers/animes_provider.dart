import 'dart:convert';

import 'package:anicon/models/anime.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

const kToken =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjE2MjUiLCJuYmYiOjE2NTAyNzA5NDQsImV4cCI6MTY1Mjg2Mjk0NCwiaWF0IjoxNjUwMjcwOTQ0fQ.K-FFky_f3q3eGjunufsaLndZOjgTrQmuYFHBvuPcVkg';

final animesProvider = FutureProvider<List<Anime>>(
  (ref) async {
    List<Anime> result = [];
    int lastPage = 1;
    int currentPage = 1;
    do {
      final url = Uri.https(
        'api.aniapi.com',
        '/v1/anime',
        {
          'year': '2022',
          'format': '0',
          'page': '$currentPage',
        },
      );

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
              Map<String, String?>.from(anime['titles']),
              Map<String, String?>.from(anime['descriptions']),
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
      currentPage++;
      lastPage = content['data']['last_page'];
    } while (currentPage <= lastPage);

    return result;
  },
);
