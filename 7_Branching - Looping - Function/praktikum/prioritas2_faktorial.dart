// Soal Prioritas 2 - Faktorial
void main() {

  double num1 = 10;
  double num2 = 40;
  double num3 = 50;

  double result1 = num1;
  String str1 = num1.toInt().toString();
  double result2 = num2;
  String str2 = num2.toInt().toString();
  double result3 = num3;
  String str3 = num3.toInt().toString();

  // Faktorial num1
  for (var i = num1 - 1; i > 0; i--) {
    result1 *= i;
    str1 += 'x' + i.toInt().toString();
  }
  print('Faktorial dari ' + num1.toInt().toString() + ' adalah ');
  print(str1);
  print('yaitu: ' + result1.toString());
  print(''); // Empty line

  // Faktorial num2
  for (var i = num2 - 1; i > 0; i--) {
    result2 *= i;
    str2 += 'x' + i.toInt().toString();
  }
  print('Faktorial dari ' + num2.toInt().toString() + ' adalah ');
  print(str2);
  print('yaitu: ' + result2.toString());
  print(''); // Empty line

  // Faktorial num1
  for (var i = num3 - 1; i > 0; i--) {
    result3 *= i;
    str3 += 'x' + i.toInt().toString();
  }
  print('Faktorial dari ' + num3.toInt().toString() + ' adalah ');
  print(str3);
  print('yaitu: ' + result3.toString());
  print(''); // Empty line

}