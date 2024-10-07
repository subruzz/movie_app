class Movies {
  bool adult;
  String backdropPath;
  int id;
  String title;
  String originalLanguage;
  String originalTitle;
  String overview;
  String posterPath;
  List<int> genreIds;
  double popularity;
  String releaseDate;
  bool video;
  double voteAverage;
  int voteCount;

  Movies({
    required this.adult,
    required this.backdropPath,
    required this.id,
    required this.title,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.posterPath,
    required this.genreIds,
    required this.popularity,
    required this.releaseDate,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  Movies.fromJson(Map<String, dynamic> json)
      : adult = json['adult'] ?? false,
        backdropPath = json['backdrop_path'] ?? '',
        id = json['id'] ?? 0,
        title = json['title'] ?? '',
        originalLanguage = json['original_language'] ?? '',
        originalTitle = json['original_title'] ?? '',
        overview = json['overview'] ?? '',
        posterPath = json['poster_path'] ?? '',
        genreIds = List<int>.from(json['genre_ids'] ?? []),
        popularity = json['popularity']?.toDouble() ?? 0.0,
        releaseDate = json['release_date']??'',
        video = json['video'] ,
        voteAverage = json['vote_average']?.toDouble() ?? 0.0,
        voteCount = json['vote_count'] ?? 0;
}
