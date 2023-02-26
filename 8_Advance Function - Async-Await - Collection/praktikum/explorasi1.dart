// Soal Eksplorasi 1 - Unique Lists
void main() {

  List list1 = ['amuse', 'tommy kaira', 'spoon', 'HKS', 'litchfield', 'amuse', 'HKS'];
  List result = uniqueList(list1);

  print('Input: ' + list1.toString());
  print('Result: ' + result.toString());
  
}

List uniqueList(List list) {

  List result = [];

  for(var item in list) {
    if(!result.contains(item)) {
      result.add(item);
    }
  }

  return result;
}