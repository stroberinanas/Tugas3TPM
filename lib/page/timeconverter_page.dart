import 'package:flutter/material.dart';

class TimeConverterPage extends StatefulWidget {
  const TimeConverterPage({super.key});

  @override
  State<TimeConverterPage> createState() => _TimeConverterPageState();
}

class _TimeConverterPageState extends State<TimeConverterPage> {
  final TextEditingController _yearController = TextEditingController();
  String _result = '';
  bool _showResult = false;

  void _convertTime() {
    final String input = _yearController.text;
    if (input.isEmpty) {
      setState(() {
        _result = 'Masukkan jumlah tahun terlebih dahulu!';
        _showResult = true;
      });
      return;
    }

    final double? years = double.tryParse(input);
    if (years == null || years < 0) {
      setState(() {
        _result = 'Masukkan angka tahun yang valid!';
        _showResult = true;
      });
      return;
    }

    final double totalDays = years * 365;
    final double totalHours = totalDays * 24;
    final double totalMinutes = totalHours * 60;
    final double totalSeconds = totalMinutes * 60;

    setState(() {
      _result = '''
$years Tahun setara dengan:
🕐 ${totalHours.toStringAsFixed(0)} Jam
🕑 ${totalMinutes.toStringAsFixed(0)} Menit
🕒 ${totalSeconds.toStringAsFixed(0)} Detik
''';
      _showResult = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text("Konversi Waktu"),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(251, 180, 72, 1),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const Icon(Icons.access_time_rounded,
                size: 100, color: Colors.orange),
            const SizedBox(height: 16),
            const Text(
              'Konversi Tahun ke Jam, Menit, Detik',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            TextField(
              controller: _yearController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Masukkan jumlah tahun',
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white,
                prefixIcon: const Icon(Icons.edit_calendar),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _convertTime,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(251, 180, 72, 1),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  textStyle: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w600),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text('Konversi'),
              ),
            ),
            const SizedBox(height: 30),
            AnimatedOpacity(
              opacity: _showResult ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 300),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.orange.shade300),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.orange.shade100,
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    )
                  ],
                ),
                child: Text(
                  _result,
                  style: const TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
