import 'package:flutter/material.dart';
import 'package:http_request_api/helper/http_service.dart';
import 'package:http_request_api/pages/movie_detail.dart';

class MovieList extends StatefulWidget {
  const MovieList({Key? key}) : super(key: key);

  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  late int moviesCount;
  late List movies;
  late HttpService service;
  bool _isLoading = true;

  Future initialize() async {
    movies = [];
    movies = (await service.getPopularMovies())!;
    setState(() {
      moviesCount = movies.length;
      movies = movies;
      _isLoading = false;
    });
  }

  @override
  void initState() {
    service = HttpService();
    initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFE3A815),
        title: const Text(
            "Popular Movies XXI\nAmiruddin Fikri Nur (2031710163)",
            style: TextStyle(fontFamily: 'Goudy')),
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: (moviesCount == null) ? 0 : moviesCount,
              itemBuilder: (context, int pos) {
                return Card(
                  color: Colors.white,
                  elevation: 2.0,
                  child: ListTile(
                    leading:  CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Image.network('https://image.tmdb.org/t/p/w300' + movies[pos].posterPath),
                    ),
                    title: Text(movies[pos].title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold )),
                    subtitle:
                        Text('Release Date = ' + movies[pos].releaseDate, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold )),
                    onTap: () {
                      MaterialPageRoute route = MaterialPageRoute(
                          builder: (_) => MovieDetail(
                                movie: movies[pos],
                              ));
                      Navigator.push(context, route);
                    },
                  ),
                );
              }),
    );
  }
}
