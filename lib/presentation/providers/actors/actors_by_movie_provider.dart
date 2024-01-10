import 'package:cinemapedia/domain/entities/actor.dart';
import 'package:cinemapedia/presentation/providers/actors/actors_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final actorsbyMovieProvider = StateNotifierProvider<ActorsByMovieNotifier, Map<String, List<Actor>>>((ref) {
  final movieRepository = ref.watch(actorsRepositoryProvider);
  return ActorsByMovieNotifier(getActorsByMovie: movieRepository.getActorsByMovie);
});

typedef GetActorsCallback = Future<List<Actor>> Function(String movieId);

class ActorsByMovieNotifier extends StateNotifier<Map<String, List<Actor>>> {
  ActorsByMovieNotifier({required this.getActorsByMovie}) : super({});
  final GetActorsCallback getActorsByMovie;

  Future<void> loadActors(String movieId) async {
    if (state[movieId] != null) return;

    final actors = await getActorsByMovie(movieId);

    state = {...state, movieId: actors};
  }
}
