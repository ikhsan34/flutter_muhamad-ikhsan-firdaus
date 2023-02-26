// Soal Prioritas 2 - Rata-rata
void main() {
  
  List<int> data1 = [7, 5, 3, 5, 2, 1];
  int sum = 0;
  int result;

  for (var item in data1) {
    sum += item;
  }
  result = (sum / data1.length).ceil();

  print(result);

}