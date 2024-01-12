import 'package:cinemapedia/presentation/screens/sreens.dart';
import 'package:cinemapedia/presentation/views/views.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(initialLocation: '/', routes: [
  // State-Preserving
  StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) =>
          HomeScreen(childView: navigationShell),
      branches: [
        StatefulShellBranch(routes: <RouteBase>[
          GoRoute(
            path: '/',
            builder: (context, state) {
              return const HomeView();
            },
            routes: [
              GoRoute(
                  path: 'movie/:id',
                  name: MovieScreen.name,
                  builder: (context, state) {
                    final movieId = state.pathParameters['id'] ?? 'no-id';
                    return MovieScreen(movieId: movieId);
                  },
                ),
            ]
          )
        ]),
        StatefulShellBranch(routes: <RouteBase>[
          GoRoute(
            path: '/favorites',
            builder: (context, state) {
              return const FavoritesView();
            },
          )
        ]),
      ]),

  // non State-Preserving
  // ShellRoute(
  //     builder: (context, state, child) {
  //       return HomeScreen(childView: child);
  //     },
  //     routes: [
  //       GoRoute(
  //           path: '/',
  //           builder: (context, state) {
  //             return const HomeView();
  //           },
  //           routes: [
  //             GoRoute(
  //               path: 'movie/:id',
  //               name: MovieScreen.name,
  //               builder: (context, state) {
  //                 final movieId = state.pathParameters['id'] ?? 'no-id';
  //                 return MovieScreen(movieId: movieId);
  //               },
  //             ),
  //           ]),
  //       GoRoute(
  //         path: '/favorites',
  //         builder: (context, state) {
  //           return const FavoritesView();
  //         },
  //       )
  //     ])

  // Rutas padre/hijo
  // GoRoute(
  //     path: '/',
  //     name: HomeScreen.name,
  //     builder: (context, state) => const HomeScreen(childView: HomeView()),
  //     routes: [
  //       GoRoute(
  //         path: 'movie/:id',
  //         name: MovieScreen.name,
  //         builder: (context, state) {
  //           final movieId = state.pathParameters['id'] ?? 'no-id';
  //           return MovieScreen(movieId: movieId);
  //         },
  //       ),
  //     ]),
]);
