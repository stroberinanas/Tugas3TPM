import 'package:flutter/material.dart';
import '../data/movies.dart';
import '../page/movieDetail_page.dart';

class MovielistPage extends StatefulWidget {
  const MovielistPage({super.key});

  @override
  State<MovielistPage> createState() => _MovielistPageState();
}

class _MovielistPageState extends State<MovielistPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie Recommendations'),
        backgroundColor: Color.fromRGBO(251, 180, 72, 1),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          childAspectRatio: 1.7,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: movieList.length,
        itemBuilder: (context, index) {
          final movie = movieList[index];
          return GestureDetector(
            onTap: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MoviedetailPage(
                    movie: movie,
                    onUpdate: (updatedMovie) {
                      setState(() {
                        movieList[index] = updatedMovie;
                      });
                    },
                  ),
                ),
              );
            },
            child: LayoutBuilder(builder: (context, constraints) {
              return Card(
                color: const Color.fromARGB(255, 121, 86, 34),
                elevation: 4,
                child: Row(
                  children: [
                    SizedBox(
                      height: constraints.maxHeight,
                      width: 160,
                      child: ClipRRect(
                          child: Image.network(
                        movie.imgUrl,
                        fit: BoxFit.cover,
                      )),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 12.0, top: 5, bottom: 2, right: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text('${movie.title} (${movie.year})',
                                style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                            Row(
                              children: [
                                Row(
                                  children: List.generate(10, (index) {
                                    if (movie.rating >= index + 1) {
                                      return const Icon(Icons.star,
                                          color: Colors.yellow, size: 18);
                                    } else if (movie.rating >= index + 0.5) {
                                      return const Icon(Icons.star_half,
                                          color: Colors.yellow, size: 18);
                                    } else {
                                      return const Icon(Icons.star_border,
                                          color: Colors.grey, size: 18);
                                    }
                                  }),
                                ),
                                const SizedBox(width: 8),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Tap for More Detail',
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.white),
                                ),
                                IconButton(
                                  icon: Icon(
                                    movie.isFavorite
                                        ? Icons.star
                                        : Icons.star_border,
                                    color: movie.isFavorite
                                        ? Colors.yellow
                                        : Colors.white,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      movie.toggleFavorite();
                                    });
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
          );
        },
      ),
    );
  }
}
