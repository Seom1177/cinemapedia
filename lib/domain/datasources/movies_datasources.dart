import 'package:cinemapedia/domain/entities/movie.dart';

abstract class MovieDataSource {
  Future<List<Movie>> getnowPlaying({int page = 1});
}
