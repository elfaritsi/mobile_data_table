import 'dart:ui';

import 'package:flutter/material.dart';

// Saya telah mencoba script ini dartpad dan hasilnya error,
// tetapi jika script ini dijalankan pada emulator tidak ada error dan aplikasi berjalan
// tetapi pada page 1 terdapat error "a renderflex overflowed by 36 pixels on the right"
// table melebihi batas layar, saya telah mencari2 error ini di internet tetapi tidak menemukan
// jawaban yang pas. 

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Daeng Mhd El Faritsi - 6SIA4"),
      ),
      body: ListView(
        children: [
          Container(
              margin: EdgeInsets.only(top: 20, bottom: 20),
              child: Center(
                  child: Text(
                "Daeng Mhd El Faritsi - 6SIA4",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ))),
          DataTable(columns: [
            DataColumn(label: Text("NIRM")),
            DataColumn(label: Text("Nama Mahasiswa")),
            DataColumn(label: Text("Jurusan"))
          ], rows: [
            DataRow(cells: [
              DataCell(Text("2019020807")),
              DataCell(Text("Anto Gomblo")),
              DataCell(Text("Komputer")),
            ]),
            DataRow(cells: [
              DataCell(Text("2017080506")),
              DataCell(Text("Bembenk Maulana")),
              DataCell(Text("Kedokteran"))
            ]),
            DataRow(cells: [
              DataCell(Text("2016080309")),
              DataCell(Text("Usup Mesin")),
              DataCell(Text("Pemesinan"))
            ]),
          ]),
          Container(
              margin: EdgeInsets.all(20),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return SecondPage();
                    }));
                  },
                  child: Text("Tabel dengan List")))
        ],
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Tabel dengan list"),
        ),
        body: ListView(
          children: [
            Container(
                margin: EdgeInsets.only(top: 20, bottom: 20),
                child: Center(
                    child: Text(
                  "Tabel dengan list",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ))),
            DataTable(
                columns: [
                  DataColumn(label: Text("Nama Kampus")),
                  DataColumn(label: Text("Alamat")),
                ],
                rows: Kampus.getDataKampus()
                    .map((data) => DataRow(cells: [
                          DataCell(Text(data.nama)),
                          DataCell(Text(data.alamat))
                        ]))
                    .toList()),
            Container(
                margin: EdgeInsets.all(20),
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Kembali")))
          ],
        ),
      ),
    );
  }
}

class Kampus {
  String nama, alamat;

  Kampus({this.nama, this.alamat});

  static List<Kampus> getDataKampus() {
    return <Kampus>[
      Kampus(nama: "Universitas Indonesia", alamat: "Jl. Pelajar"),
      Kampus(nama: "Universitas Padjajaran", alamat: "Jl. Kembang"),
      Kampus(nama: "Universitas Brawijaya", alamat: "Jl. Melati"),
    ];
  }
}
