// Soal Prioritas 2 - Pyramid Loop
void main() {
  // Number of levels
  int num = 8;

  for (var i = 1; i <= num; i++) {

    // Initial string
    String str = '';

    // Adding empty string
    for (var j = num - i; j > 0; j--) {
      str += ' ';
    }

    // Adding asterisk
    for (var k = 1; k <= 2 * i - 1; k++) {
      str += '*';
    }

    // Print every loop 
    print(str);

  }

}