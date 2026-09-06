import 'package:prak1/prak1.dart' as prak1;
const String name = "Raymon"; // sama seperti var (lebih baik jika langsung di tentukan)
const int age = 20;

void main(List<String> arguments) {
  // print('Hello world: ${prak1.calculate()}!');
  // var a = "Raymon";
  // var umur = 20;
  // var alamat = "Jl. Raya No. 1";
  // var tinggi = "170 cm";
  // var iseng = umur + int.parse(tinggi.split(' ')[0]);
  // print("Nama: $a");
  // print("Umur: $umur");
  // print("Alamat: $alamat");
  // print("Hasil iseng: $iseng");

  // name = "Yanto"; // error karena name adalah const
  // const String name = "Yanto"; // jika begini maka yang diambil adalah name yang di dalam main, bukan yang di luar main
  final String nama = "Yanto";
  final int umur =21;
  // nama = "Raymon Devtant"; tidak bisa diubah karena nama adalah final
  print('Nama saya $name, umur saya $age tahun');
  print('Nama saya $nama, umur saya $umur tahun');
}