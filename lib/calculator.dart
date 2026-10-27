import 'constants.dart';

// Class Calculator berisi logika perhitungan BMR (Basal Metabolic Rate).
// BMR adalah jumlah kalori minimal yang dibutuhkan tubuh untuk menjalankan
// fungsi vital saat istirahat (pernapasan, detak jantung, sirkulasi, dll).
class Calculator {
  // Constructor menerima tinggi (cm), berat (kg), usia (tahun),
  // dan jenis kelamin (Gender). Semua bersifat wajib (required).
  Calculator({
    required this.height,
    required this.weight,
    required this.age,
    required this.gender,
  });

  // Properti yang menyimpan data input dari pengguna.
  final int height;
  final int weight;
  final int age;
  final Gender gender;

  // Variabel privat untuk menyimpan hasil perhitungan BMR.
  double _bmr = 0.0;

  // Metode untuk menghitung nilai BMR.
  // Menggunakan rumus Mifflin-St Jeor:
  //   Pria  : BMR = (10 x berat) + (6.25 x tinggi) - 5 + 5
  //   Wanita: BMR = (10 x berat) + (6.25 x tinggi) - 5 - 161
  // Hasil dikembalikan dalam bentuk String dengan 0 desimal (kcal/hari).
  String calculateBMR() {
    // Perhitungan dasar: (10 x berat kg) + (6.25 x tinggi cm) - (5 x usia)
    double base = (10 * weight) + (6.25 * height) - (5 * age);

    // Tambahkan konstanta berdasarkan jenis kelamin.
    if (gender == Gender.male) {
      // Pria: +5
      _bmr = base + 5;
    } else {
      // Wanita: -161
      _bmr = base - 161;
    }

    // Bulatkan hasil ke bilangan bulat (kcal/hari) dan kembalikan sebagai String.
    return _bmr.toStringAsFixed(0);
  }

  // Metode untuk mengembalikan status/label hasil BMR.
  // Nilai BMR ditampilkan apa adanya (tidak dikategorikan seperti BMI).
  String getResult() {
    return 'BMR Anda';
  }

  // Metode untuk mengembalikan penjelasan/interpretasi hasil BMR.
  // Menjelaskan arti dari nilai BMR yang didapat pengguna.
  String getInterpretation() {
    return 'Ini adalah jumlah kalori yang dibutuhkan tubuh Anda saat '
        'istirahat untuk menjalankan fungsi vital seperti pernapasan, '
        'sirkulasi darah, dan regulasi suhu tubuh. Kebutuhan kalori '
        'harian Anda yang sebenarnya akan lebih tinggi tergantung pada '
        'tingkat aktivitas Anda.';
  }
}