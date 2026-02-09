import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/movie.dart';
import '../interfaces/movies_list_interface.dart';
import '../enums/movie_list_type.dart';
import '../models/movies_list_popular_response.dart';

class MovieService implements MoviesListInterface {
  final String _apiBaseUrl = "https://api.themoviedb.org/3/movie";
  

  final String _bearerToken = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIwYTg1YmI0OTZiYmIyMDViZWU1OGM1NzY4ZTI3NDg5ZiIsIm5iZiI6MTc2MzM2NzY4My43MTI5OTk4LCJzdWIiOiI2OTFhZGIwM2E2YTU5N2JmOWY2ZDkyZGMiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.dP4DqUP92sOPJ3yFn1T9pDyzFzfwK8UG8PlcdMrinL0";

  Map<String, String> get headers => {
        'Authorization': 'Bearer $_bearerToken',
        'Content-Type': 'application/json',
      };

  @override
  Future<List<Movie>> getList(MovieListType listType) async {
    final url = Uri.parse("$_apiBaseUrl/${listType.value}?language=es-ES");
    
    try {
      var response = await http.get(url, headers: headers);
      
      if (response.statusCode >= 200 && response.statusCode < 300) {
        var moviesList = MovieListPopularResponse.fromJson(
          json.decode(response.body),
        ).results;
        return moviesList;
      } else {
        return [];
      }
    } catch (e) {
      throw Exception("Error al obtener las películas: $e");
    }
  }
}