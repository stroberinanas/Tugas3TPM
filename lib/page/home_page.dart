import 'package:flutter/material.dart';
import '../page/jenisBilangan_page.dart';
import '../page/rekomendasi_page.dart';
import '../page/stopwatch_page.dart';
import '../page/timeconverter_page.dart';
import '../page/trackinglbs_page.dart';
import '../util/local_storage.dart';
import '../widget/custom_button.dart';
import '../widget/custom_text.dart';
import '../page/login_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? username;
  bool _isLoading = true;

  void logout() async {
    await LocalStorage.logout();
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => LoginPage()));
  }

  void getUsername() async {
    username = await LocalStorage.getString("username");
    if (username == null) {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => LoginPage()));
    }
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    getUsername();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _isLoading
          ? null
          : AppBar(
              title: CustomText.h2("Hai, $username!", color: Colors.white),
              actions: [CustomButton.logout(logout)],
              backgroundColor: Color.fromRGBO(251, 180, 72, 1),
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
            _menuButton(context, 'Stopwatch', StopwatchPage()),
            _menuButton(context, 'Types of Number', JenisbilanganPage()),
            _menuButton(context, 'Tracking LBS', TrackingLbsPage()),
            _menuButton(context, 'Time Converter', TimeConverterPage()),
            _menuButton(context, 'Recommendations', RekomendasiPage()),
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
