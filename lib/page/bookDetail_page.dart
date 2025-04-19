import 'package:flutter/material.dart';
import '../model/book.dart';
import 'package:url_launcher/url_launcher.dart';

class BookdetailPage extends StatefulWidget {
  const BookdetailPage({Key? key, required this.book, required this.onUpdate})
      : super(key: key);
  final BookModel book;
  final Function(BookModel) onUpdate;

  @override
  State<BookdetailPage> createState() => _BookdetailPageState();
}

class _BookdetailPageState extends State<BookdetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('widget.book.title'),
        backgroundColor: const Color.fromRGBO(251, 180, 72, 1),
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
                      image: NetworkImage(
                          widget.book.coverImageUrl), // Replace with your book cover URL
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
                      Text(widget.book.title),
                    ],
                  ),
                  TableRow(
                    children: [
                      Text('Author',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(':', style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(widget.book.author),
                    ],
                  ),
                  TableRow(
                    children: [
                      Text('Publisher',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(':', style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(widget.book.publisher),
                    ],
                  ),
                  TableRow(
                    children: [
                      Text('ISBN',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(':', style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(widget.book.isbn),
                    ],
                  ),
                  TableRow(
                    children: [
                      Text('Year',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(':', style: TextStyle(fontWeight: FontWeight.bold)),
                      Text('${widget.book.year}'),
                    ],
                  ),
                  TableRow(
                    children: [
                      Text('Genre',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(':', style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(widget.book.genre),
                    ],
                  ),
                  TableRow(
                    children: [
                      Text('Synopsis',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(':', style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(widget.book.synopsis),
                    ],
                  ),
                  
                ],
              ),
              const SizedBox(height: 16),
              SizedBox(height: 15),
              ElevatedButton(
                onPressed: () async {
                  await launchUrl(Uri.parse(widget.book.review));
                },
                child: Text('Review about this book'),
              ),
              SizedBox(height: 40),
              GestureDetector(
                onTap: () {
                  setState(() {
                    widget.book.toggleFavorite();
                    widget.onUpdate(widget.book);
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: widget.book.isFavorite
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
                            widget.book.isFavorite
                                ? Icons.star
                                : Icons.star_border,
                            color:
                                widget.book.isFavorite ? Colors.yellow : null,
                          ),
                          onPressed: () {
                            setState(() {
                              widget.book.toggleFavorite();
                              widget.onUpdate(widget.book);
                            });
                          },
                        ),
                      ),
                      Text(
                        'Favorite',
                        style: TextStyle(
                            fontSize: 16,
                            color: widget.book.isFavorite
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
