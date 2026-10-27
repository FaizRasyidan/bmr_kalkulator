import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmr_calculator/components/custom_card.dart';
import 'package:bmr_calculator/components/icon_card.dart';
import 'package:bmr_calculator/constants.dart';
import 'package:bmr_calculator/pages/result_page.dart';
import 'package:bmr_calculator/components/bottom_button.dart';
import 'package:bmr_calculator/components/round_icon_button.dart';
import 'package:bmr_calculator/calculator.dart';

// InputPage adalah halaman input data pengguna.
// Menggunakan StatefulWidget karena nilai-nilai input (gender, tinggi, berat, usia)
// dapat berubah seiring interaksi pengguna, sehingga perlu state management.
class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  // State awal: gender default pria, tinggi 160 cm, berat 60 kg, usia 20 tahun.
  Gender selectedGender = Gender.male;
  int height = 160;
  int weight = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('KALKULATOR BMR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Baris pertama: dua kartu untuk memilih jenis kelamin (MALE / FEMALE).
          // Kartu yang dipilih akan berwarna activeCardColor, yang lain inactiveCardColor.
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: CustomCard(
                    color: selectedGender == Gender.male
                        ? activeCardColor
                        : inactiveCardColor,
                    cardChild: IconCard(
                      cardIcon: FontAwesomeIcons.mars.data,
                      caption: 'PRIA',
                    ),
                    // Saat kartu MALE ditekan, ubah selectedGender menjadi male.
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: CustomCard(
                    color: selectedGender == Gender.female
                        ? activeCardColor
                        : inactiveCardColor,
                    cardChild: IconCard(
                      cardIcon: FontAwesomeIcons.venus.data,
                      caption: 'WANITA',
                    ),
                    // Saat kartu FEMALE ditekan, ubah selectedGender menjadi female.
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          // Kartu kedua: input tinggi badan menggunakan Slider.
          Expanded(
            child: CustomCard(
              color: activeCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'TINGGI BADAN',
                    style: labelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: numberTextStyle,
                      ),
                      const Text(
                        'cm',
                        style: labelTextStyle,
                      ),
                    ],
                  ),
                  // Slider untuk memilih tinggi badan (120 - 220 cm).
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: const Color(0xFF8D8E98),
                      thumbColor: const Color(0xFFEB1555),
                      overlayColor: const Color(0x29EB1555),
                      thumbShape:
                          const RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                          const RoundSliderOverlayShape(overlayRadius: 30.0),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      onChanged: (double value) {
                        // Update state tinggi badan saat slider digeser.
                        setState(() {
                          height = value.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Baris ketiga: dua kartu untuk input WEIGHT dan AGE.
          // Masing-masing menggunakan tombol + dan - (RoundIconButton).
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: CustomCard(
                    color: activeCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'BERAT BADAN',
                          style: labelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: numberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus.data,
                              onPressed: () {
                                // Kurangi berat badan, minimal 30 kg.
                                setState(() {
                                  if (weight >= 30) {
                                    weight--;
                                  }
                                });
                              },
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus.data,
                              onPressed: () {
                                // Tambah berat badan.
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: CustomCard(
                    color: activeCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'USIA',
                          style: labelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: numberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus.data,
                              onPressed: () {
                                // Kurangi usia, minimal 1 tahun.
                                setState(() {
                                  if (age >= 1) {
                                    age--;
                                  }
                                });
                              },
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus.data,
                              onPressed: () {
                                // Tambah usia.
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Tombol bawah: CALCULATE.
          // Saat ditekan, buat instance Calculator dengan data input,
          // hitung BMR, lalu navigasi ke ResultPage dengan membawa hasil.
          BottomButton(
            buttonTitle: 'HITUNG',
            onTap: () {
              // Inisialisasi objek Calculator dengan tinggi, berat, usia, dan gender.
              Calculator cal = Calculator(
                  height: height, weight: weight, age: age, gender: selectedGender);
              // Hitung nilai BMR.
              String bmr = cal.calculateBMR();
              // Ambil status dan penjelasan hasil.
              String result = cal.getResult();
              String information = cal.getInterpretation();
              // Navigasi ke halaman hasil (ResultPage) dengan membawa data.
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(
                    result: result,
                    bmi: bmr,
                    information: information,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}