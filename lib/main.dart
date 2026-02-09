import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/movies_bloc.dart';
import 'core/service/movie_service.dart';
import 'ui/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movies App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RepositoryProvider(
        create: (context) => MovieService(),
        child: BlocProvider(
          create: (context) => MoviesBloc(context.read<MovieService>()),
          child: const HomeScreen(),
        ),
      ),
    );
  }
}
