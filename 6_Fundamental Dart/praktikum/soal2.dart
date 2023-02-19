// Soal Prioritas 2
void main() {

  // 3 Variables String
  String str1 = 'Hello, ';
  String str2 = 'my name is ';
  String str3 = 'Ikhsan';

  // Print 3 strings together
  print(str1 + str2 + str3);

  // Cylinder volume
  int r = 7;
  int t = 10;
  var result = 22/7 * r * r * t;
  // Print result
  print('Volume: ' + result.toString());

  // Cylinder volume with diameter
  int diameter = 14;
  int height = 20;
  var result2 = 22/7 * (1/2 * diameter) * (1/2 * diameter) * height;

  // print result2
  print('Volume with diameter: ' + result2.toString());
}