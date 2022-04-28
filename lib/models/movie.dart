class Movie {
  late int id;
  late String title;
  late String releaseDate;
  late double voteAverage;
  late String overview;
  late String posterPath;

  Movie(this.id, this.title, this.releaseDate, this.voteAverage, this.overview, this.posterPath);

  Movie.fromJson(Map<String, dynamic> parsedJson) {
    id = parsedJson['id'];
    title = parsedJson['title'];
    releaseDate = parsedJson['release_date'];
    voteAverage = parsedJson['vote_average'] * 1.0;
    overview = parsedJson['overview'];
    posterPath = parsedJson['poster_path'];
  }
}
