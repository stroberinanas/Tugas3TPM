import 'package:flutter/material.dart';

class ShowData extends StatefulWidget {
  const ShowData({Key? key}) : super(key: key);

  @override
  _ShowDataState createState() => _ShowDataState();
}

class _ShowDataState extends State<ShowData> {
  final List<Map<String, String>> anggotaKelompok = [
    {"nomor": "1", "nim": "123220013", "nama": "Insyuzuu Cahyani"},
    {"nomor": "2", "nim": "123220022", "nama": "R.A. Kurnia Haqiki"},
    {"nomor": "3", "nim": "123220085", "nama": "Sabila Khairina S"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Data Anggota Kelompok"),
        backgroundColor: Color.fromRGBO(251, 180, 72, 1),
        elevation: 0,
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        color: Colors.grey[100], // Light background color
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Text(
                'Daftar Anggota Kelompok',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      // Header Row
                      Container(
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(251, 180, 72, 1),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: const [
                            Text('No',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                            Text('NIM',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                            Text('Nama',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                      const SizedBox(height: 5),
                      // Data Rows
                      Expanded(
                        child: ListView.builder(
                          itemCount: anggotaKelompok.length,
                          itemBuilder: (context, index) {
                            final anggota = anggotaKelompok[index];
                            return Container(
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(color: Colors.grey[300]!),
                                ),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(anggota["nomor"]!,
                                      style: const TextStyle(fontSize: 16)),
                                  Text(anggota["nim"]!,
                                      style: const TextStyle(fontSize: 16)),
                                  Text(anggota["nama"]!,
                                      style: const TextStyle(fontSize: 16)),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
