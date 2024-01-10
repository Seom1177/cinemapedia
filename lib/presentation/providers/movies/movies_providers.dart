import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/presentation/providers/movies/movies_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// provedor de informacion que notifica cuando cambia el estado
final nowPlayingmoviesProvider =
    StateNotifierProvider<MoviesController, List<Movie>>((ref) {
  final fetMoreMovies = ref.watch(movieRepositoryProvider).getnowPlaying;
  return MoviesController(fetchMoreMovies: fetMoreMovies);
});

final popularMoviesProvider =
    StateNotifierProvider<MoviesController, List<Movie>>((ref) {
  final fetMoreMovies = ref.watch(movieRepositoryProvider).getPopular;
  return MoviesController(fetchMoreMovies: fetMoreMovies);
});

typedef MovieCallBack = Future<List<Movie>> Function({int page});

class MoviesController extends StateNotifier<List<Movie>> {
  MoviesController({required this.fetchMoreMovies}) : super([]);
  int currentPage = 0;
  bool isLoading = false;
  MovieCallBack fetchMoreMovies;

  Future<void> loadNextPage() async {
    if (isLoading) return;
    isLoading = true;

    currentPage++;
    final List<Movie> movies = await fetchMoreMovies(page: currentPage);
    state = [...state, ...movies];
    
    await Future.delayed(const Duration(milliseconds: 500));
    isLoading = false;
  }
}
