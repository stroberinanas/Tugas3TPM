import 'package:flutter/material.dart';
import '../data/websites.dart';
import '../page/webDetail_page.dart';

class WeblistPage extends StatefulWidget {
  const WeblistPage({super.key});

  @override
  State<WeblistPage> createState() => _WeblistPageState();
}

class _WeblistPageState extends State<WeblistPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Website Recommendations'),
        backgroundColor: const Color.fromRGBO(251, 180, 72, 1),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          childAspectRatio: 2.5,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: websiteList.length,
        itemBuilder: (context, index) {
          final website = websiteList[index];
          return GestureDetector(
            onTap: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => WebdetailPage(
                    website: website,
                    onUpdate: (updatedWebsite) {
                      setState(() {
                        websiteList[index] = updatedWebsite;
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
                      height: 160,
                      width: 160,
                      child: ClipRRect(
                        child: Image.network(
                          website.logoUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text(website.name,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                )),
                            Row(
                              children: [
                                Row(
                                  children: List.generate(5, (index) {
                                    if (website.rating >= index + 1) {
                                      return const Icon(Icons.star,
                                          color: Colors.yellow, size: 18);
                                    } else if (website.rating >= index + 0.5) {
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
                                    website.isFavorite
                                        ? Icons.star
                                        : Icons.star_border,
                                    color: website.isFavorite
                                        ? Colors.yellow
                                        : Colors.white,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      website.toggleFavorite();
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
