// Prioritas 2 - Funtion
void main() {

  int r = 10;

  var result = luasLingkaran(r);
  print('Luas lingkaran dengan jari-jari = ' + r.toString() + ' adalah:');
  print(result);
  
}

double luasLingkaran(int r) {
  return 22/7 * r * r;
}