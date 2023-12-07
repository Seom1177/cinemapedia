import 'package:cinemapedia/domain/entities/movie.dart';

abstract class MovieRepository {
  Future<List<Movie>> getnowPlaying({int page = 1});
}
