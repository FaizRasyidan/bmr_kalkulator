import 'package:flutter/material.dart';
import 'package:bmr_calculator/components/custom_card.dart';
import 'package:bmr_calculator/constants.dart';
import 'package:bmr_calculator/components/bottom_button.dart';

// ResultPage adalah halaman hasil perhitungan BMR.
// Menerima data hasil (result, bmr, information) dari InputPage.
class ResultPage extends StatelessWidget {
  const ResultPage(
      {required this.result, required this.bmi, required this.information});

  final String result;
  final String bmi;
  final String information;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('KALKULATOR BMR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Judul "Your Result" di bagian atas.
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: const Text(
                'Hasil Anda',
                style: TextStyle(
                  fontSize: 50.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          // Card utama yang menampilkan status, nilai BMR, dan penjelasan.
          Expanded(
            flex: 5,
            child: CustomCard(
              color: activeCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    result,
                    style: resultTextStyle,
                  ),
                  // Nilai BMR besar dengan satuan kcal/day.
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        bmi,
                        style: bmiTextStyle,
                      ),
                      const Text(
                        ' kkal/hari',
                        style: labelTextStyle,
                      ),
                    ],
                  ),
                  Text(
                    information,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 22.0,
                    ),
                  )
                ],
              ),
            ),
          ),
          // Tombol bawah: RE-CALCULATE untuk kembali ke InputPage.
          BottomButton(
            buttonTitle: 'HITUNG ULANG',
            onTap: () {
              // Kembali ke halaman sebelumnya (InputPage).
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}