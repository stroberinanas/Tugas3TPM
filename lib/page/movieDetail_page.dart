import 'package:flutter/material.dart';
import '../model/movie.dart';
import 'package:url_launcher/url_launcher.dart';

class MoviedetailPage extends StatefulWidget {
  const MoviedetailPage({Key? key, required this.movie, required this.onUpdate})
      : super(key: key);
  final MovieModel movie;
  final Function(MovieModel) onUpdate;

  @override
  State<MoviedetailPage> createState() => _MoviedetailPageState();
}

class _MoviedetailPageState extends State<MoviedetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.movie.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 6 / 9,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: NetworkImage(widget.movie.imgUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Table(
                border: TableBorder(
                  horizontalInside:
                      BorderSide(color: Colors.transparent, width: 1),
                  verticalInside:
                      BorderSide(color: Colors.transparent, width: 1),
                ),
                columnWidths: const {
                  0: FixedColumnWidth(100),
                  1: FixedColumnWidth(10),
                  3: FlexColumnWidth()
                },
                children: [
                  TableRow(
                    children: [
                      Text('Title',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(':', style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(widget.movie.title),
                    ],
                  ),
                  TableRow(
                    children: [
                      Text('Year',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(':', style: TextStyle(fontWeight: FontWeight.bold)),
                      Text('${widget.movie.year}'),
                    ],
                  ),
                  TableRow(
                    children: [
                      Text('Genre',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(':', style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(widget.movie.genre),
                    ],
                  ),
                  TableRow(
                    children: [
                      Text('Director',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(':', style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(widget.movie.director),
                    ],
                  ),
                  TableRow(
                    children: [
                      Text('Casts',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(':', style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(widget.movie.casts.join(', ')),
                    ],
                  ),
                  TableRow(
                    children: [
                      Text('Synopsis',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(':', style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(widget.movie.synopsis),
                    ],
                  ),
                  TableRow(
                    children: [
                      Text('Rating',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(':', style: TextStyle(fontWeight: FontWeight.bold)),
                      Row(
                        children: [
                          Row(
                            children: List.generate(10, (index) {
                              if (widget.movie.rating >= index + 1) {
                                return const Icon(Icons.star,
                                    color: Colors.yellow, size: 18);
                              } else if (widget.movie.rating >= index + 0.5) {
                                return const Icon(Icons.star_half,
                                    color: Colors.yellow, size: 18);
                              } else {
                                return const Icon(Icons.star_border,
                                    color: Colors.grey, size: 18);
                              }
                            }),
                          ),
                          const SizedBox(width: 8),
                          Text('(${widget.movie.rating}/10)',
                              style: const TextStyle(fontSize: 14)),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 15),
              ElevatedButton(
                onPressed: () async {
                  await launchUrl(Uri.parse(widget.movie.movieUrl));
                },
                child: Text('More about this movie'),
              ),
              SizedBox(height: 40),
              GestureDetector(
                onTap: () {
                  setState(() {
                    widget.movie.toggleFavorite();
                    widget.onUpdate(widget.movie);
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: widget.movie.isFavorite
                        ? const Color.fromARGB(255, 255, 166, 0)
                        : const Color.fromARGB(255, 255, 214, 138),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.bottomRight,
                        child: IconButton(
                          icon: Icon(
                            widget.movie.isFavorite
                                ? Icons.star
                                : Icons.star_border,
                            color:
                                widget.movie.isFavorite ? Colors.yellow : null,
                          ),
                          onPressed: () {
                            setState(() {
                              widget.movie.toggleFavorite();
                              widget.onUpdate(widget.movie);
                            });
                          },
                        ),
                      ),
                      Text(
                        'Favorite',
                        style: TextStyle(
                            fontSize: 16,
                            color: widget.movie.isFavorite
                                ? Colors.white
                                : Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
