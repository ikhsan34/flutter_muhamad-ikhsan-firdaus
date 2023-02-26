// Soal Prioritas 2 - Membuat list dan map
void main() {

  List list1 = [['satu', 1], ['dua', 2], ['tiga', 3]];

  Map map1 = {};

  for (var item in list1) {
    map1.addEntries({item[0]: item[1]}.entries);
  }

  print(map1);
  
}