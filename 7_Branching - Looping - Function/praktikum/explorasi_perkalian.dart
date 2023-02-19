// Soal Eksplorasi - Tabel Perkalian
void main() {
  
  // Input
  int num = 9;

  for (var i = 1; i <= num; i++) {
    // Empty string
    String str = '';
    for (var j = 1; j <= num; j++) {
      str += (j * i).toString();
      str += ' '; // give spaces
    }
    print(str);
  }

}