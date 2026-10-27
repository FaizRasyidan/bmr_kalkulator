import 'package:flutter/material.dart';
import 'package:bmr_calculator/constants.dart';

// Widget IconCard: widget untuk menampilkan icon dan caption-nya.
// Digunakan untuk membuat card pilihan jenis kelamin (MALE/FEMALE).
class IconCard extends StatelessWidget {
  IconCard({this.cardIcon, required this.caption});

  final IconData? cardIcon;
  final String caption;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          cardIcon,
          size: 70.0,
        ),
        const SizedBox(
          height: 15.0,
        ),
        Text(
          caption,
          style: labelTextStyle,
        ),
      ],
    );
  }
}