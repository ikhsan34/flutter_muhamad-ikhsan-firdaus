// Soal Eksplorasi - Bilangan prima
void main() {

  int num = 23;
  bool result = primeCheck(num);
  print(num);

  if(result) {
    print('bilangan prima');
  } else {
    print('bukan bilangan prima');
  }
  
}

bool primeCheck(int num) {

  // Number 1 and 2 excluded
  if (num == 1) {
    return false;
  } else if (num == 2) {
    return false;
  }

  // Loop check if number can be divided by number that below it self
  for (var i = 2; i < num; i++) {
    if (num % i == 0) {
      return false;
    }
  }

  return true;
}