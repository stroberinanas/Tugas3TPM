import 'package:flutter/material.dart';

class JenisbilanganPage extends StatefulWidget {
  const JenisbilanganPage({super.key});

  @override
  State<JenisbilanganPage> createState() => _JenisbilanganPageState();
}

class _JenisbilanganPageState extends State<JenisbilanganPage> {
  TextEditingController _numberController = TextEditingController();
  String _result = '';

  String checkNumberType(String input) {
    //Bilangan cacah adalah himpunan bilangan asli yang diperluas dengan menyertakan nol.
    //Bilangan bulat adalah himpunan yang terdiri dari bilangan cacah dan negatif dari bilangan asli.
    //Bilangan prima adalah bilangan bulat positif yang hanya memiliki dua faktor, yaitu 1 dan bilangan itu sendiri.
    //Bilangan desimal adalah bilangan yang memiliki bagian pecahan, biasanya ditandai dengan titik desimal.

    if (input.isEmpty) {
      return 'Masukkan angka terlebih dahulu.';
    }
    double? number = double.tryParse(input);
    if (number == null) {
      return 'Input bukan angka yang valid.';
    }

    if (number % 1 != 0) {
      return 'Bilangan desimal.';
    }

    int integerPart = number.toInt();

    if (integerPart < 0) {
      return 'Bilangan bulat negatif.';
    } else if (integerPart == 0) {
      return 'Bilangan cacah (dan juga bilangan bulat).';
    } else {
      if (_isPrime(integerPart)) {
        return 'Bilangan prima dan bilangan bulat positif serta bilangan cacah.';
      } else {
        return 'Bilangan bulat positif serta bilangan cacah.';
      }
    }
  }

  bool _isPrime(int n) {
    if (n <= 1) return false;
    for (int i = 2; i * i <= n; i++) {
      if (n % i == 0) return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jenis Bilangan'),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(251, 180, 72, 1),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _numberController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Masukkan Bilangan',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _result = checkNumberType(_numberController.text);
                });
              },
              child: const Text('Cek Jenis Bilangan'),
            ),
            const SizedBox(height: 20),
            Text(
              _result,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
