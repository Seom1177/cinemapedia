import 'package:flutter/material.dart';

class MovieScreen extends StatefulWidget {
  const MovieScreen({super.key, required this.movieId});

  static const name = 'movie-screen';
  final String movieId;

  @override
  State<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  @override
  void initState() {
    super.initState();
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MovieId ${widget.movieId}'),
      ),
    );
  }
}
