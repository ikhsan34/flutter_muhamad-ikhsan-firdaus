// Soal Eksplorasi - Pengelola buku

// Class Book
class Book {
  int id;
  String judul;
  String penerbit;
  int harga;
  String kategori;

  Book(this.id, this.judul, this.penerbit, this.harga, this.kategori);

}

// Storing books
class Storage {
  List<Book> books = [];


  // Tambah buku
  void tambahBuku(int id, String judul, String penerbit, int harga, String kategori) {
    Book buku = Book(id, judul, penerbit, harga, kategori);
    books.add(buku);
  }

  // Hapus buku by id
  void hapusBuku(int id) {
    for(var book in books) {
      if(book.id == id) {
        int index = books.indexOf(book);
        books.removeAt(index);
        break; // Break loop after remove (causing exception if not)
      }
    }
  }

  // Print List buku
  void lihatBuku() {
    for(var book in books) {
      print('================'); // Separator
      print('ID: ' + book.id.toString());
      print('Judul: ' + book.judul);
      print('Penerbit: ' + book.penerbit);
      print('Harga: ' + book.harga.toString());
      print('Kategori: ' + book.kategori);

    }
  }

}

void main() {

  // Init storage
  Storage storage1 = Storage();
  storage1.tambahBuku(1, 'Dilan 1990', 'MDP', 50000, 'romance');
  storage1.tambahBuku(2, 'Dilan 1991', 'MDP', 45000, 'romance');
  storage1.tambahBuku(3, 'The Great Gatsby', "Charles Scribner's Sons", 120000, 'Tragedy');
  storage1.lihatBuku();

  // Hapus buku by Id
  storage1.hapusBuku(1);
  print('===============');
  print('Setelah dihapus');
  storage1.lihatBuku(); // print buku after remove
  
}