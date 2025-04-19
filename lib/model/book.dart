class BookModel {
  String title;
  String author;
  int year;
  String genre;
  String isbn;
  String publisher;
  String synopsis;
  String coverImageUrl;
  String review;
  bool isFavorite;

  BookModel({
    required this.title,
    required this.author,
    required this.year,
    required this.genre,
    required this.isbn,
    required this.publisher,
    required this.synopsis,
    required this.coverImageUrl,
    required this.review,
    this.isFavorite = false,
  });

  void toggleFavorite() {
    isFavorite = !isFavorite;
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'author': author,
      'year': year,
      'genre': genre,
      'isbn': isbn,
      'publisher': publisher,
      'synopsis': synopsis,
      'coverImageUrl': coverImageUrl,
      'review': review,
      'isFavorite': isFavorite,
    };
  }

  factory BookModel.fromJson(Map<String, dynamic> json) {
    return BookModel(
      title: json['title'],
      author: json['author'],
      year: json['year'],
      genre: json['genre'],
      isbn: json['isbn'],
      publisher: json['publisher'],
      synopsis: json['synopsis'],
      coverImageUrl: json['coverImageUrl'],
      review: json['review'],
      isFavorite: json['isFavorite'] ?? false,
    );
  }
}
