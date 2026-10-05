# Week 6
Praktikum 1

Membuat project baru
![alt text](screenshots/BuatProjectBaru.png)

Download package
![alt text](screenshots/Package.png)

Create Struktur Folder
![alt text](screenshots/StrukturFolder.png)

Tema Terang
![alt text](screenshots/TemaTerang.png)

Tema Gelap
![alt text](screenshots/TemaGelap.png)

Terakhir Dibuka
![alt text](screenshots/TerakhirDibuka.png)

TerakhirDibukaDanTemaGelap
![alt text](screenshots/TerakhirBukaGelap.png)

Pertanyaan Praktikum 1
1. Karena jika di simpan di build sering terjadi re-rendered atau panggilan berulan terus menerus
sehingga bisa memicu infinite loop
2. Pertama user menekan switch lalu mengubah value boolean jika true akan diubah gelap
   Kedua nilai akan di kirim ke prefs.dart lalu disitulah prefs.dart akan mengubah tema jadi gelap/terang
   Ketiga saat berubah ke darkmode maka di main akan load themedmode darkmode dan sebaliknya
   Keempat data itu akan di simpan ke storage menggunakan sharedpreferences dimana nanti ia akan mengirimkan value data 
   secara berpasangan yaitu variable dan valuenya
   Kelima data akan tersimpan di storage/disk dan saat kita membuka aplikasi kembali maka terakhir dibuka akan berubah dan darkmode/lightmode akan sama dan tidak berubah seperti saat kita close aplikasi 
3. Kelebihan:
   - UI sangat responsif jadi perubahan tema terasa instant
   - Aplikasi lebih ringan karena tidak ada loading indicator setiap kali user menekan switch
   Kekurangan:
   - Inkonsistensi data dimana jika kita gagal mengiriim data ke storage tampilan UI akan berganti namun data di storage belum berubah
   - Kompleksitas rollback pengembang harus menyediakan mekanisme untuk membatalkan perubahan UI jika sistem gagal menyimpan
   perubahan di storage 
   - Kondisi balapan dimana jika user menekan switch dengan cepat ada kemungkinan data yang tidak sinkron dimana data bisa saling mendahului yang bisa membuat hasil akhir di UI dan data yang disimpan di storage berbeda

Praktikum 2
1. Karena sqlite tidak memiliki tipe data boolean jadi kita menggunakan tipe data dirty
2. Agar test bisa menyuntikkan database palsu atau in-memory tanpa menyentuh SQLite sungguhan (dependency injection). Pola ini dipakai di Praktikum 5 dan akan dipakai lagi pada Minggu 12 (Testing & QA).
3. Agar nilai tidak pernah digabung langsung ke string SQL sehingga aman dari SQL injection.
4. Maka perangkat yang sudah memiliki database lama tidak akan mendapatkan kolom baru

Praktikum 3