class WebsiteModel {
  String name;
  String description;
  String url;
  String category;
  String logoUrl;
  double rating;
  bool isFavorite;

  WebsiteModel({
    required this.name,
    required this.description,
    required this.url,
    required this.category,
    required this.logoUrl,
    required this.rating,
    this.isFavorite = false,
  });

  void toggleFavorite() {
    isFavorite = !isFavorite;
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'url': url,
      'category': category,
      'logoUrl': logoUrl,
      'rating': rating,
      'isFavorite': isFavorite,
    };
  }

  factory WebsiteModel.fromJson(Map<String, dynamic> json) {
    return WebsiteModel(
      name: json['name'],
      description: json['description'],
      url: json['url'],
      category: json['category'],
      logoUrl: json['logoUrl'],
      rating: json['rating'] ?? 0.0,
      isFavorite: json['isFavorite'] ?? false,
    );
  }
}
