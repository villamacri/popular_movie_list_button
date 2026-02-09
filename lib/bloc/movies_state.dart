import 'package:equatable/equatable.dart';
import '../../core/models/movie.dart';
import '../../core/enums/movie_list_type.dart';

abstract class MoviesState extends Equatable {
  const MoviesState();

  @override
  List<Object> get props => [];
}

class MoviesInitial extends MoviesState {}

class MoviesLoading extends MoviesState {}

class MoviesLoaded extends MoviesState {
  final List<Movie> movies;
  final MovieListType currentType;

  const MoviesLoaded(this.movies, this.currentType);

  @override
  List<Object> get props => [movies, currentType];
}

class MoviesError extends MoviesState {
  final String message;

  const MoviesError(this.message);

  @override
  List<Object> get props => [message];
}
