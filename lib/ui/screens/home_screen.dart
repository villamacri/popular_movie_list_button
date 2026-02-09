import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/movies_bloc.dart';
import '../../bloc/movies_event.dart';
import '../../bloc/movies_state.dart';
import '../../core/enums/movie_list_type.dart';
import '../widgets/movie_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  MovieListType _currentType = MovieListType.popular;

  @override
  void initState() {
    super.initState();
    context.read<MoviesBloc>().add(LoadMovies(_currentType));
  }

  void _switchType(MovieListType type) {
    setState(() {
      _currentType = type;
    });
    context.read<MoviesBloc>().add(LoadMovies(type));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Movies App')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildToggleButton("Populares", MovieListType.popular),
                const SizedBox(width: 10),
                _buildToggleButton("Top Rated", MovieListType.topRated),
              ],
            ),
          ),
          Expanded(
            child: BlocBuilder<MoviesBloc, MoviesState>(
              builder: (context, state) {
                if (state is MoviesLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is MoviesLoaded) {
                  return _buildMoviesList(state);
                } else if (state is MoviesError) {
                  return Center(child: Text(state.message));
                }
                return const SizedBox.shrink();
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildToggleButton(String title, MovieListType type) {
    final isSelected = _currentType == type;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected ? Colors.blue: Colors.grey[200],
        foregroundColor: isSelected ? Colors.white : Colors.black,
      ),
      onPressed: () => _switchType(type),
      child: Text(title),
    );
  }

  Widget _buildMoviesList(MoviesLoaded state) {
    return SizedBox(
      height: 300, 
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: state.movies.length,
        itemBuilder: (context, index) {
          return MovieCard(movie: state.movies[index]);
        },
      ),
    );
  }
}
