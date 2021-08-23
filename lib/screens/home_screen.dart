import 'package:flutter/material.dart';
import 'package:peliculas/providers/movies_provider.dart';
import 'package:peliculas/search/search_delegate.dart';
import 'package:peliculas/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context);
    // print(moviesProvider.onDisplayMovies);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => showSearch(
              context: context,
              delegate: MovieSearchDelegate(),
            ),
            icon: Icon(Icons.search_outlined),
          )
        ],
        title: Text('Peliculas En Cines'),
        // backgroundColor: Colors.red,
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //Tarjeta Principales
            CardSwiper(
              movies: moviesProvider.onDisplayMovies,
            ),

            //Tarjetas de Peliculas horizontal
            MovieSlider(
              movies: moviesProvider.popularMovies,
              title: 'Populares',
              onNextPage: () {
                moviesProvider.getPopularMovies();
              },
            ),
            SizedBox(height: 5.0),
            MovieSlider(
              movies: moviesProvider.upcomingMovies,
              title: 'Proximamente',
              onNextPage: () {
                moviesProvider.getUpcomingMovies();
              },
            ),
            SizedBox(
              height: 5.0,
            ),
            MovieSlider(
              movies: moviesProvider.popularMovies,
              title: 'Lanzamientos Recientemente',
              onNextPage: () {
                print('hola mundo');
              },
            ),
            MovieSlider(
              movies: moviesProvider.onDisplayMovies,
              title: 'En Cines Actualmente',
              onNextPage: () {
                moviesProvider.getonDisplayMovies();
              },
            ),
          ],
        ),
      ),
    );
  }
}
