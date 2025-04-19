class MovieModel {
  String title;
  int year;
  String genre;
  String director;
  List<String> casts;
  double rating;
  String synopsis;
  String imgUrl;
  String movieUrl;
  bool isFavorite;

  MovieModel({
    required this.title,
    required this.year,
    required this.genre,
    required this.director,
    required this.casts,
    required this.rating,
    required this.synopsis,
    required this.imgUrl,
    required this.movieUrl,
    this.isFavorite = false,
  });

  void toggleFavorite() {
    isFavorite = !isFavorite;
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'year': year,
      'genre': genre,
      'director': director,
      'casts': casts,
      'rating': rating,
      'synopsis': synopsis,
      'movieUrl': movieUrl,
      'imgUrl': imgUrl,
      'isFavorite': isFavorite,
    };
  }

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      title: json['title'],
      year: json['year'],
      genre: json['genre'],
      director: json['director'],
      casts: List<String>.from(json['casts'] ?? []),
      rating: json['rating'],
      synopsis: json['synopsis'],
      movieUrl: json['movieUrl'],
      imgUrl: json['imgUrl'],
      isFavorite: json['isFavorite'] ?? false,
    );
  }
}
