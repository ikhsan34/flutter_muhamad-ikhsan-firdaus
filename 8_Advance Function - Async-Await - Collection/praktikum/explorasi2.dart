// Soal Eksplorasi 2 - Frekuensi data
void main() {
  
  List list1 = ['js', 'js', 'js', 'golang', 'python', 'js', 'js', 'golang', 'rust'];
  Map result = {};

  for(var item in list1) {
    if(result.containsKey(item)) {
      result[item] += 1;
    } else {
      result[item] = 1;
    }
  }

  print('Input: ' + list1.toString());
  print('Result: ' + result.toString());

}