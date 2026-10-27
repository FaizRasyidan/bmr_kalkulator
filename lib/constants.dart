import 'package:flutter/material.dart';

// Warna kartu saat aktif (dipilih) dan tidak aktif.
// activeCardColor: warna kartu yang sedang dipilih pengguna.
// inactiveCardColor: warna kartu yang tidak dipilih.
const activeCardColor = Color(0xFF1D1E33);
const inactiveCardColor = Color(0xFF111328);

// Tinggi container tombol di bagian bawah layar.
const bottomContainerHeight = 80.0;

// Warna tombol di bagian bawah layar (CALCULATE / RE-CALCULATE).
const bottomContainerColor = Color(0xFFEB1555);

// Enum (tipe data enumerasi) untuk jenis kelamin.
// Enum adalah tipe data yang terdiri dari sekumpulan nilai bernama.
// Di sini kita membuat tipe data sendiri bernama Gender yang hanya
// bisa berisi nilai male atau female. Digunakan untuk menentukan
// rumus BMR yang tepat (pria dan wanita memiliki rumus berbeda).
enum Gender {
  male,
  female,
}

// Style teks untuk label (misalnya "HEIGHT", "WEIGHT", "AGE").
const labelTextStyle = TextStyle(
  fontSize: 18.0,
  color: Color(0xFF8D8E98),
);

// Style teks untuk angka besar (misalnya nilai tinggi/berat/usia).
const numberTextStyle = TextStyle(
  fontSize: 45.0,
  fontWeight: FontWeight.w900,
);

// Style teks untuk teks pada tombol bawah.
const buttonTextStyle = TextStyle(
  fontSize: 25,
  fontWeight: FontWeight.bold,
);

// Style teks untuk status hasil (misalnya "Your BMR").
const resultTextStyle = TextStyle(
  color: Color(0xFF24D876),
  fontSize: 22,
  fontWeight: FontWeight.bold,
);

// Style teks untuk nilai BMR yang besar.
const bmiTextStyle = TextStyle(
  fontSize: 100,
  fontWeight: FontWeight.bold,
);