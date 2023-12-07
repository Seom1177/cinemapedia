// unicamente para interacciones con theMovieDb
import 'package:cinemapedia/config/constants/environment.dart';
import 'package:cinemapedia/domain/datasources/movies_datasources.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/infrastructure/mappers/movie_mapper.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/moviedb_response.dart';
import 'package:dio/dio.dart';

class MoviedbDatasource extends MoviesDataSource {
  final dio = Dio(BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {
        'api_key': Environment.theMovieDbKey,
        'language': 'es-MX'
      }));
  @override
  Future<List<Movie>> getnowPlaying({int page = 1}) async {
    final response = await dio.get('/movie/now_playing');

    // moviedb respond to object (MovieDbResponse)
    final movieDbResponse = MovieDbResponse.fromJson(response.data);

    // MovieDbResponse object to movie entity
    final List<Movie> movies = movieDbResponse.results
        .where((moviedb) => moviedb.posterPath != 'Not-Found') // dont render a movie without poster
        .map((moviedb) => MovieMapper.movieDBToEntity(moviedb))
        .toList();

    return movies;
  }
}
