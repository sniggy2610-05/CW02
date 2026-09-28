class Movie {
  final String title;
  final String posterPath;
  final List<String> cast;
  final String synopsis;
  final int year;
  final String genre;
  final double rating;

  const Movie({
    required this.title,
    required this.posterPath,
    required this.cast,
    required this.synopsis,
    required this.year,
    required this.genre,
    required this.rating,
  });
}