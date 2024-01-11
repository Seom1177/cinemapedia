import 'package:flutter/material.dart';

class SearchMovieDelegate extends SearchDelegate {
  //Cambiar mensaje en el texto de busqueda
  @override
  String get searchFieldLabel => 'Buscar película';

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [const Text('BuildActions')];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return const Text('buildLeading');
  }

  @override
  Widget buildResults(BuildContext context) {
    return const Text('buildResults');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const Text('buildSuggestions');
  }
}
