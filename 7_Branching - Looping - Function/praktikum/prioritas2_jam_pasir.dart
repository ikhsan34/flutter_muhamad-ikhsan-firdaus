// Soal Prioritas 2 - Jam Pasir
void main() {

  int num = 6;
  
  // Reverse Pyramid
  for (var i = 0; i < num; i++) {
    // Initial string
    String str = '';

    // Adding empty string
    for (var j = 0; j < i; j++) {
      str += ' ';
    }

    // Adding zero
    for (var k = 0; k < (num - i) * 2 - 1; k++) {
      str += '0';
    }

    // Print every loop 
    print(str);
  }

  // Pyramid
  for (var i = 2; i <= num; i++) {
    // Initial string
    String str = '';

    // Adding empty string
    for (var j = num - i; j > 0; j--) {
      str += ' ';
    }

    // Adding zero
    for (var k = 1; k <= 2 * i - 1; k++) {
      str += '0';
    }

    // Print every loop 
    print(str);
  }

}