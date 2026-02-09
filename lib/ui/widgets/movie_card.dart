import 'package:flutter/material.dart';
import '../../core/models/movie.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;

  const MovieCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: movie.posterPath.isNotEmpty
                ? Image.network(
                    'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                    height: 240,
                    width: 160,
                    fit: BoxFit.cover,
                  )
                : Container(
                    height: 240,
                    width: 160,
                    color: Colors.grey,
                    child: const Icon(Icons.movie, size: 50),
                  ),
          ),
          const SizedBox(height: 8),
          Text(
            movie.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            movie.voteAverage.toString(),
            style: const TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
