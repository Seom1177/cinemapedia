import 'package:cinemapedia/domain/entities/movie.dart';

abstract class MoviesDataSource {
  Future<List<Movie>> getnowPlaying({int page = 1});
  Future<List<Movie>> getPopular({int page = 1});
}
