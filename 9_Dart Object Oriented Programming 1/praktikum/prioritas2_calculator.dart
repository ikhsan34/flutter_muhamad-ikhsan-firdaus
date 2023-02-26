// Soal Prioritas 2 - Calculator
class Calculator {

  int penjumlahan(int num1, int num2) {
    return num1 + num2;
  }

  int pengurangan(int num1, int num2) {
    return num1 - num2;
  }

  int perkalian(int num1, int num2) {
    return num1 * num2;
  }

  double pembagian(int num1, int num2) {
    return num1 / num2;
  }

}

void main(List<String> args) {

  Calculator calculator = Calculator();

  int penjumlahan = calculator.penjumlahan(5, 5);
  int pengurangan = calculator.pengurangan(10, 5);
  int perkalian = calculator.perkalian(3, 2);
  double pembagian = calculator.pembagian(20, 2);

  print(penjumlahan);
  print(pengurangan);
  print(perkalian);
  print(pembagian);
  
}