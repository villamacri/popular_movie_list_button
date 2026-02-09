import 'package:equatable/equatable.dart';
import '../../core/enums/movie_list_type.dart';

abstract class MoviesEvent extends Equatable {
  const MoviesEvent();

  @override
  List<Object> get props => [];
}

class LoadMovies extends MoviesEvent {
  final MovieListType listType;

  const LoadMovies(this.listType);

  @override
  List<Object> get props => [listType];
}
