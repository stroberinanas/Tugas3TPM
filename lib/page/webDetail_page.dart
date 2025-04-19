import 'package:flutter/material.dart';
import '../model/website.dart';
import 'package:url_launcher/url_launcher.dart';

class WebdetailPage extends StatefulWidget {
  final WebsiteModel website;
  final Function(WebsiteModel) onUpdate;
  const WebdetailPage({Key? key, required this.website, required this.onUpdate})
      : super(key: key);

  @override
  State<WebdetailPage> createState() => _WebdetailPageState();
}

class _WebdetailPageState extends State<WebdetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.website.name),
        backgroundColor: const Color.fromRGBO(251, 180, 72, 1),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 6 / 6,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: NetworkImage(widget.website.logoUrl),
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
                      Text('Name',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(':', style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(widget.website.name),
                    ],
                  ),
                  TableRow(
                    children: [
                      Text('Category',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(':', style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(widget.website.category),
                    ],
                  ),
                  TableRow(
                    children: [
                      Text('Description',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(':', style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(widget.website.description),
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
                            children: List.generate(5, (index) {
                              if (widget.website.rating >= index + 1) {
                                return const Icon(Icons.star,
                                    color: Colors.yellow, size: 18);
                              } else if (widget.website.rating >= index + 0.5) {
                                return const Icon(Icons.star_half,
                                    color: Colors.yellow, size: 18);
                              } else {
                                return const Icon(Icons.star_border,
                                    color: Colors.grey, size: 18);
                              }
                            }),
                          ),
                          const SizedBox(width: 8),
                          Text('(${widget.website.rating}/10)',
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
                  await launchUrl(Uri.parse(widget.website.url));
                },
                child: Text('Go to this website'),
              ),
              SizedBox(height: 40),
              GestureDetector(
                onTap: () {
                  setState(() {
                    widget.website.toggleFavorite();
                    widget.onUpdate(widget.website);
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: widget.website.isFavorite
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
                            widget.website.isFavorite
                                ? Icons.star
                                : Icons.star_border,
                            color: widget.website.isFavorite
                                ? Colors.yellow
                                : null,
                          ),
                          onPressed: () {
                            setState(() {
                              widget.website.toggleFavorite();
                              widget.onUpdate(widget.website);
                            });
                          },
                        ),
                      ),
                      Text(
                        'Favorite',
                        style: TextStyle(
                            fontSize: 16,
                            color: widget.website.isFavorite
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
