import 'package:cinemapedia/domain/datasources/movies_datasources.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/domain/repositories/movies_repositories.dart';

class MovieRepositoryImpl extends MoviesRepository {
  // use abstract to inject any datasource
  MovieRepositoryImpl(this.dataSource);
  final MoviesDataSource dataSource;

  @override
  Future<List<Movie>> getnowPlaying({int page = 1}) {
    return dataSource.getnowPlaying(page: page);
  }
}
