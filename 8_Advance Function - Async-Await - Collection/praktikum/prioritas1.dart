// Soal Prioritas 1 - fungtion pengali
void main() async {

  List list1 = await pengali([1,2,3,4,5], 10);

  print(list1);
  
}

// Function pengali
Future<List> pengali(List<int> listNum, int pengali) async {

  List result = [];

  for(var num in listNum) {
    await Future.delayed(const Duration(seconds: 1), () {
      result.add(num * pengali);
    });
  }

  return result;
}