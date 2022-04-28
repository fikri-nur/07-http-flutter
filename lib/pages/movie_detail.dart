import 'package:flutter/material.dart';
import 'package:http_request_api/helper/http_service.dart';
import 'package:http_request_api/models/movie.dart';

class MovieDetail extends StatelessWidget {
  const MovieDetail({Key? key, required this.movie}) : super(key: key);

  final Movie movie;
  final String imgPath = 'https://image.tmdb.org/t/p/w300/';

  @override
  Widget build(BuildContext context) {
    String path;
    if (movie.posterPath != null) {
      path = imgPath + movie.posterPath;
    } else {
      path = 'https://via.placeholder.com/300';
    }
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFE3A815),
        title: Text(movie.title, style: TextStyle(fontFamily: 'Optima')),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(padding: EdgeInsets.only(top: 20)),
            Text(movie.title,
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center),
            Container(
              height: height / 2,
              child: Image.network(path),
            ),
            Container(
                padding: EdgeInsets.only(left: 16, right: 16, top: 20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          ' Ratings: ' + movie.voteAverage.toString(),
                          textAlign: TextAlign.justify,
                          style: TextStyle(fontSize: 20),
                        ),
                        Icon(
                          Icons.star,
                          color: Color(0xFFE3A815),
                          size: 25,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                      width: MediaQuery.of(context).size.width,
                    ),
                    Text(
                      movie.overview,
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(
                      height: 10,
                      width: MediaQuery.of(context).size.width,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Release Date: ' + movie.releaseDate,
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.left,
                        ),
                      ],
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
