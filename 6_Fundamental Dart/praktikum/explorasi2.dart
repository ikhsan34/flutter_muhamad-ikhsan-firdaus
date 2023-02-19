// Soal Explorasi 2 - Faktor sebuah bilangan
void main() {

  // input
  int num = 24;
  print('Faktor dari bilangan ' + num.toString() + ' adalah: ');

  for (var i = 1; i < num; i++) {
    // modulus (sisa) check
    if(num % i == 0) { 
      print(i);
    }
  }
}