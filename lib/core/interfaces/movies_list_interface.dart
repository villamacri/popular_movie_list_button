import '../models/movie.dart';
import '../enums/movie_list_type.dart';

abstract class MoviesListInterface {
  Future<List<Movie>> getList(MovieListType listType);
}
