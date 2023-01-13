import 'package:flutter/material.dart';
import 'package:tmdb_api/tmdb_api.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        // primarySwatch: Colors.blue,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List trendingmovies = [];
  List topRatedMovies = [];
  List tv = [];
  final String apiKey = '5ca76a6489392f666de82ff260f5a584';
  final String accessToken = 'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI1Y2E3NmE2NDg5MzkyZjY2NmRlODJmZjI2MGY1YTU4NCIsInN1YiI6IjYzYzA3ODFiMDVhNTMzMDBhZWNmMzhlYyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.qQsA1x85S--QuosP--LHMoHJd9AuUWCK4qCiyHc_UX0';
  
  @override
  void initState(){
    loadmovies();
    super.initState();
  }

  loadmovies() async {
    TMDB tmdbWithLogs = TMDB(
      ApiKeys(apiKey, accessToken),
      logConfig: const ConfigLogger(
        showLogs: true,
        showErrorLogs: true
      ));

    Map trendingResults = await tmdbWithLogs.v3.trending.getTrending();
    Map topRatedMoviesResult = await tmdbWithLogs.v3.movies.getTopRated();
    Map tvResults = await tmdbWithLogs.v3.tv.getLatest();

    setState(() {
      trendingmovies = trendingResults['results'];
      topRatedMovies = topRatedMoviesResult['results'];
      tv = tvResults['results'];
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Film Fiesta')),
    );
  }
}
