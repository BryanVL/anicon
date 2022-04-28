class Anime {
  final int id;
  final Map<String, String?> titles;
  final Map<String, String?> descriptions;
  final String startDate;
  final String endDate;
  final int seasonPeriod;
  final int? seasonYear;
  final int numEpisodes;
  final String coverImageUrl;
  final String? coverColor;
  final String? bannerImage;
  final List<String> genres;
  final int numSeasons;
  final int score;

  Anime(
    this.id,
    this.titles,
    this.descriptions,
    this.startDate,
    this.endDate,
    this.seasonPeriod,
    this.seasonYear,
    this.numEpisodes,
    this.coverImageUrl,
    this.coverColor,
    this.bannerImage,
    this.genres,
    this.numSeasons,
    this.score,
  );

  //Anime.fromJson(Map<String, dynamic> json) : id = json['id'];
  /*Anime.noNull(
    this.id,
    this.titles,
    this.descriptions,
    this.startDate,
    this.endDate,
    this.seasonPeriod,
    this.seasonYear,
    this.numEpisodes,
    this.coverImageUrl,
    this.bannerImage,
    this.genres,
    this.numSeasons,
    this.score,
  ) : ;*/
}
