import 'package:flutter/material.dart';

// Widget CustomCard: widget reusable berbentuk kotak (card) yang banyak
// digunakan di aplikasi. Membungkus child widget dengan warna dan
// border radius tertentu. Dibuat reusable agar kode lebih modular.
class CustomCard extends StatelessWidget {
  // color: warna latar kartu.
  // cardChild: widget anak yang akan ditampilkan di dalam kartu.
  // onPress: fungsi yang dipanggil saat kartu ditekan.
  CustomCard({required this.color, this.cardChild, this.onPress});

  final Color color;
  final Widget? cardChild;
  final Function()? onPress;

  @override
  Widget build(BuildContext context) {
    // GestureDetector mendeteksi gerakan tap pada widget anak.
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: const EdgeInsets.all(15.0),
        padding: const EdgeInsets.only(left: 1.0, right: 1.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: cardChild,
      ),
    );
  }
}