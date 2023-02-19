// Soal Explorasi 1 - Palindrom
void main() {
  
  // Input string
  String str = "mobil balap";

  // Print and call palindromCheck function
  print(str);
  print(palindromCheck(str));

}

// Declare function for palindrom check
String palindromCheck(String str) {

  // Reversing the string
  final arrayString = str.split('');
  final reversedArrayString = arrayString.reversed;
  final reverseString = reversedArrayString.join();

  // Check if the string is equal to reversed string
  if(str == reverseString) {
    return 'palindrom';
  }

  // return result
  return 'bukan palindrom';
}