import 'package:ray/prak1.dart' as prak1;

void main(List<String> arguments) {
  // print('Hello world: ${prak1.calculate()}!');
  var a = "Raymon";
  var umur = 20;
  var alamat = "Jl. Raya No. 1";
  var tinggi = "170 cm";
  var iseng = umur + int.parse(tinggi.split(' ')[0]);
  print("Nama: $a");
  print("Umur: $umur");
  print("Alamat: $alamat");
  print("Hasil iseng: $iseng");
}