// Soal Prioritas 2 - class Matematika

class Matematika {
  void hasil() {

  }
}

class KelipatanPersekutuanTerkecil implements Matematika {

  int x = 0;
  int y = 0;

  @override
  int hasil() {

    // Initialize min and max from given number
    int min = x > y ? y : x;
    int max = x > y ? x : y;

    // Kelipatan Persekutuan Terkecil
    int kpk = max;
    
    while(kpk % min != 0) {
      kpk += max;
    }

    return kpk;
    
  }

}

class FaktorPersekutuanTerbesar implements Matematika {

  int x = 0;
  int y = 0;

  @override
  int hasil() {
    // Faktor Persekutuan Terbesar
    int fpb = 1;
    for(var i = 1; i <= x && i <= y; i++) {
      if(x % i == 0 && y % i == 0) {
        fpb = i;
      }
    }

    return fpb;
    
  }

}

void main() {

  // Init object
  var operation = KelipatanPersekutuanTerkecil();
  operation.x = 10;
  operation.y = 4;
  print('Kelipatan Persekutuan Terkecil: ');
  print(operation.hasil());

  var operation2 = FaktorPersekutuanTerbesar();
  operation2.x = 10;
  operation2.y = 4;
  print('Faktor Persekutuan Terbesar: ');
  print(operation2.hasil());
  
}