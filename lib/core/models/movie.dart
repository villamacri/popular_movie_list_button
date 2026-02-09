class Movie {
  final int id;
  final String title;
  final String overview;
  final String posterPath;
  final double voteAverage;

  Movie({
    required this.id,
    required this.title,
    required this.overview,
    required this.posterPath,
    required this.voteAverage,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'] as int? ?? 0,
      title: json['title'] as String? ?? 'Sin título',
      overview: json['overview'] as String? ?? 'Sin descripción',
      posterPath: json['poster_path'] as String? ?? '',
      voteAverage: (json['vote_average'] as num? ?? 0).toDouble(),
    );
  }
}
