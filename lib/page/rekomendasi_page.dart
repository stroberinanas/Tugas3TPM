import 'package:flutter/material.dart';
import '../page/bookList_page.dart';
import '../page/fav_page.dart';
import '../page/movieList_page.dart';
import '../page/webList_page.dart';

class RekomendasiPage extends StatelessWidget {
  const RekomendasiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Menu"),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(251, 180, 72, 1),
        elevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        height: double.infinity,
        alignment: Alignment.topCenter,
        color: Colors.grey[100],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Tombol Rekomendasi Film
            _menuButton(context, 'Movie', MovielistPage()),
            // Tombol Rekomendasi Buku
            _menuButton(context, 'Book', BooklistPage()),
            // Tombol Rekomendasi Website
            _menuButton(context, 'Website', WeblistPage()),
            // Tombol Favorite
            _menuButton(context, 'Your Favourite', FavPage()),
          ],
        ),
      ),
    );
  }

  // Method untuk membuat tombol menu
  Widget _menuButton(BuildContext context, String title, Widget page) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => page));
          },
          style: _buttonStyle(),
          child: Text(title, style: TextStyle(fontSize: 20)),
        ),
      ),
    );
  }

  // Style tombol
  ButtonStyle _buttonStyle() {
    return ElevatedButton.styleFrom(
      backgroundColor: Color.fromRGBO(251, 180, 72, 1),
      foregroundColor: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
