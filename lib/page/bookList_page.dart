import 'package:flutter/material.dart';
import '../data/books.dart';
import '../page/bookDetail_page.dart';

class BooklistPage extends StatefulWidget {
  const BooklistPage({super.key});

  @override
  State<BooklistPage> createState() => _BooklistPageState();
}

class _BooklistPageState extends State<BooklistPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Book Recommendations'),
          backgroundColor: const Color.fromRGBO(251, 180, 72, 1),
        ),
        body: GridView.builder(
          padding: const EdgeInsets.all(10),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            childAspectRatio: 1.7,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: bookList.length,
          itemBuilder: (context, index) {
            final book = bookList[index];
            return GestureDetector(
              onTap: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BookdetailPage(
                      book: book,
                      onUpdate: (updatedBook) {
                        setState(() {
                          bookList[index] = updatedBook;
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
                            book.coverImageUrl,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Expanded(
                          child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              book.title,
                              style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            Text(
                              'by ${book.author}',
                              style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              book.genre,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  fontSize: 14, color: Colors.white),
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
                                    book.isFavorite
                                        ? Icons.star
                                        : Icons.star_border,
                                    color: book.isFavorite
                                        ? Colors.yellow
                                        : Colors.white,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      book.toggleFavorite();
                                    });
                                  },
                                ),
                              ],
                            )
                          ],
                        ),
                      )),
                    ],
                  ),
                );
              }),
            );
          },
        ));
  }
}
