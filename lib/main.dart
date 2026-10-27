import 'package:flutter/material.dart';
import 'package:bmr_calculator/pages/input_page.dart';

// Fungsi main: titik masuk (entry point) aplikasi Flutter.
// runApp() menjalankan widget MyApp sebagai root dari widget tree.
void main() {
  runApp(const MyApp());
}

// MyApp adalah widget root aplikasi. Merupakan StatelessWidget karena
// tidak menyimpan state yang berubah. Bertanggung jawab atas konfigurasi
// tema (dark mode dengan warna custom) dan routing halaman awal.
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Konfigurasi tema: mode gelap dengan warna custom.
      theme: ThemeData.dark().copyWith(
        primaryColor: const Color(0xFF0A0E21),
        scaffoldBackgroundColor: const Color(0xFF0A0E21),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF0A0E21),
          centerTitle: true,
          elevation: 0.0,
        ),
      ),
      // Halaman awal aplikasi adalah InputPage (halaman input data BMR).
      home: InputPage(),
    );
  }
}