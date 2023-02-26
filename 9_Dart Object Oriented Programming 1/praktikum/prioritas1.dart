// Soal Prioritas 1 - Class Hewan & Mobil

class Hewan {
  String nama; // nama hewan
  int berat; // berat hewan

  Hewan(this.nama, this.berat);

}

class Mobil {
  int kapasitas = 100; //  Kapasitas tersisa in Kg(s)
  List muatan = []; // Muatan hewan

  void tambahMuatan(Hewan hewan) {
    if(hewan.berat <= this.kapasitas) {
      kapasitas -= hewan.berat;
      muatan.add(hewan.nama);
    } else {
      print('Kapasitas tidak cukup'); // Print ketika kapasitas tidak cukup
    }
  }
}

void main() {

  Hewan kambing = Hewan('Kambing', 10);

  Mobil truck = Mobil();
  print(truck.muatan); // Print muatan truck
  print(truck.kapasitas); // Kapasitas truck
  truck.tambahMuatan(kambing);
  print(truck.muatan);
  print(truck.kapasitas); // Kapasitas berkurang ketika muatan ditambahkan
  
}