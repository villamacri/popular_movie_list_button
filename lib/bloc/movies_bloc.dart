import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/interfaces/movies_list_interface.dart';
import 'movies_event.dart';
import 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final MoviesListInterface movieService;

  MoviesBloc(this.movieService) : super(MoviesInitial()) {
    on<LoadMovies>(_onLoadMovies);
  }

  Future<void> _onLoadMovies(LoadMovies event, Emitter<MoviesState> emit) async {
    emit(MoviesLoading());
    try {
      final movies = await movieService.getList(event.listType);
      emit(MoviesLoaded(movies, event.listType));
    } catch (e) {
      emit(const MoviesError("Error loading movies"));
    }
  }
}
