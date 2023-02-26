// Soal Prioritas 1 - Bangun Ruang

class BangunRuang {
  int panjang = 0;
  int lebar = 0;
  int tinggi = 0;

  // double volume() {
  //   return this.panjang * this.lebar * this.tinggi;
  // }

  void volume() {
    int result = this.panjang * this.lebar * this.tinggi;
    print('Volume Bangun Ruang: ' + result.toString());
  }

}

class Kubus extends BangunRuang {

  int sisi = 0;

  @override
  void volume() {
    int result = this.panjang * this.lebar * this.tinggi;
    print('Volume Kubus: ' + result.toString());
  }

}

class Balok extends BangunRuang {

  @override
  void volume() {
    int result = this.panjang * this.lebar * this.tinggi;
    print('Volume Balok: ' + result.toString());
  }

}

void main() {
  
  Kubus kubus = Kubus();
  kubus.panjang = 10;
  kubus.lebar = 10;
  kubus.tinggi = 10;
  kubus.volume();

  Balok balok = Balok();
  balok.panjang = 15;
  balok.lebar = 6;
  balok.tinggi = 8;
  balok.volume();

}