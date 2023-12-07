import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/presentation/providers/movies/movies_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// provedor de informacion que notifica cuando cambia el estado
final nowPlayingmoviesProvider =
    StateNotifierProvider<MoviesController, List<Movie>>((ref) {
      final fetMoreMovies = ref.watch(movieRepositoryProvider).getnowPlaying;
  return MoviesController(fetchMoreMovies: fetMoreMovies);
});

typedef MovieCallBack = Future<List<Movie>> Function({int page});

class MoviesController extends StateNotifier<List<Movie>> {
  MoviesController({required this.fetchMoreMovies}) : super([]);
  int currentPage = 0;
  MovieCallBack fetchMoreMovies;

  Future<void> loadNextPage() async {
    currentPage++;
    final List<Movie> movies = await fetchMoreMovies(page: currentPage);
    state = [...state, ...movies];
    // state hacer modificación
  }
}
