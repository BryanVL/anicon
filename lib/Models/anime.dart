class Anime {
  final int id;
  final List<String> titles;
  final List<String> descriptions;
  final DateTime startDate;
  final DateTime endDate;
  final int seasonPeriod;
  final int seasonYear;
  final int numEpisodes;
  final String coverImageUrl;
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
    this.genres,
    this.numSeasons,
    this.score,
  );
}
