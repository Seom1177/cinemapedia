import 'package:animate_do/animate_do.dart';
import 'package:cinemapedia/config/helpers/human_formats.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:flutter/material.dart';

typedef SearchMoviesCallback = Future<List<Movie?>> Function(String query);

class SearchMovieDelegate extends SearchDelegate<Movie?> {
  final SearchMoviesCallback searchMovies;

  SearchMovieDelegate({required this.searchMovies});

  //Cambiar mensaje en el texto de busqueda
  @override
  String get searchFieldLabel => 'Buscar película';

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      // if (query.isNotEmpty)
      //   FadeIn(
      //       child: IconButton(
      //           onPressed: () => query = '', icon: const Icon(Icons.clear))),
      FadeIn(
          animate: query.isNotEmpty,
          duration: const Duration(milliseconds: 250),
          child: IconButton(
              onPressed: () => query = '', icon: const Icon(Icons.clear))),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () => close(context, null),
        icon: const Icon(Icons.arrow_back_outlined));
  }

  @override
  Widget buildResults(BuildContext context) {
    return const Text('buildResults');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder(
      future: searchMovies(query),
      initialData: const [],
      builder: (context, snapshot) {
        final movies = snapshot.data ?? [];
        return ListView.builder(
            itemCount: movies.length,
            itemBuilder: (context, index) => _MovieItem(
                  movie: movies[index],
                ));
      },
    );
  }
}

class _MovieItem extends StatelessWidget {
  const _MovieItem({required this.movie});
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Row(
        children: [
          //Image
          SizedBox(
              width: size.width * 0.2,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(movie.posterPath))),
          const SizedBox(
            width: 10,
          ),

          //Description
          SizedBox(
            width: size.width * 0.7,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                movie.title,
                style: textStyle.titleMedium,
              ),
              (movie.overview.length > 100)
                  ? Text('${movie.overview.substring(0, 100)}...')
                  : Text(movie.overview),
              Row(
                children: [
                  const Icon(
                    Icons.star_half_outlined,
                    color: Colors.yellow,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                   HumanFormats.number(movie.voteAverage, 1),
                    style: textStyle.bodyMedium!
                        .copyWith(color: Colors.yellow.shade900),
                  )
                ],
              )
            ]),
          )
        ],
      ),
    );
  }
}
