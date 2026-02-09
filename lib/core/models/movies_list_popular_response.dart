import 'movie.dart';

class MovieListPopularResponse {
  final List<Movie> results;

  MovieListPopularResponse({required this.results});

  factory MovieListPopularResponse.fromJson(Map<String, dynamic> json) {
    var list = (json['results'] as List?) ?? [];
    List<Movie> moviesList = list.map((i) => Movie.fromJson(i)).toList();

    return MovieListPopularResponse(
      results: moviesList,
    );
  }
}
