// Soal Prioritas 2 - Async Faktorial
void main() async {
  double input = 5;
  double result = await factorial(input);

  print("input: " + input.toString());
  print("result: " + result.toString());
}

Future<double> factorial(double num) async {

  if(num > 0) {
    double result = await Future.delayed(const Duration(seconds: 1), () async => num * await factorial(num - 1));
    return result;
  }

  return 1;
}