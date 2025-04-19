import 'package:flutter/material.dart';
import '../data/books.dart';
import '../data/movies.dart';
import '../data/websites.dart';
import '../model/book.dart';
import '../model/movie.dart';
import '../model/website.dart';
import '../page/bookDetail_page.dart';
import '../page/movieDetail_page.dart';
import '../page/webDetail_page.dart';

class FavPage extends StatefulWidget {
  const FavPage({super.key});

  @override
  State<FavPage> createState() => _FavPageState();
}

class _FavPageState extends State<FavPage> {
  List<MovieModel> get favoriteMovies =>
      movieList.where((movie) => movie.isFavorite).toList();
  List<BookModel> get favoriteBooks =>
      bookList.where((book) => book.isFavorite).toList();
  List<WebsiteModel> get favoriteWebsites =>
      websiteList.where((website) => website.isFavorite).toList();

  void _updateFavorite(dynamic item) {
    setState(() {
      if (item is MovieModel) {
        final index =
            movieList.indexWhere((movie) => movie.title == item.title);
        if (index != -1) {
          item.isFavorite = !item.isFavorite;
          movieList[index] = item;
        }
      } else if (item is BookModel) {
        final index = bookList.indexWhere((book) => book.title == item.title);
        if (index != -1) {
          item.isFavorite = !item.isFavorite;
          bookList[index] = item;
        }
      } else if (item is WebsiteModel) {
        final index =
            websiteList.indexWhere((website) => website.name == item.name);
        if (index != -1) {
          item.toggleFavorite();
          websiteList[index] = item;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<dynamic> favoriteItems = [
      ...favoriteMovies,
      ...favoriteBooks,
      ...favoriteWebsites,
    ];

    if (favoriteItems.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Your Favorites'),
          backgroundColor: const Color.fromRGBO(251, 180, 72, 1),
        ),
        body: const Center(child: Text('No favorite items yet!')),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Favorites'),
        backgroundColor: const Color.fromRGBO(251, 180, 72, 1),
      ),
      body: ListView.builder(
        itemCount: favoriteItems.length,
        itemBuilder: (context, index) {
          final item = favoriteItems[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            child: Card(
              color: const Color.fromARGB(255, 121, 86, 34),
              elevation: 4,
              child: InkWell(
                onTap: () {
                  if (item is MovieModel) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MoviedetailPage(
                          movie: item,
                          onUpdate: _updateFavorite,
                        ),
                      ),
                    );
                  } else if (item is BookModel) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BookdetailPage(
                          book: item,
                          onUpdate: _updateFavorite,
                        ),
                      ),
                    );
                  } else if (item is WebsiteModel) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WebdetailPage(
                          website: item,
                          onUpdate: _updateFavorite,
                        ),
                      ),
                    );
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      SizedBox(
                        height: 120,
                        width: 100,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.network(
                            item is MovieModel
                                ? item.imgUrl
                                : item is BookModel
                                    ? item.coverImageUrl
                                    : item.logoUrl,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              item is MovieModel
                                  ? item.title
                                  : item is BookModel
                                      ? item.title
                                      : item.name,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              item is MovieModel
                                  ? 'Year: ${item.year}'
                                  : item is BookModel
                                      ? 'Author: ${item.author}'
                                      : 'Category: ${item.category}',
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.white70,
                              ),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          item.isFavorite ? Icons.star : Icons.star_border,
                          color: Colors.yellow,
                        ),
                        onPressed: () {
                          _updateFavorite(item);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
