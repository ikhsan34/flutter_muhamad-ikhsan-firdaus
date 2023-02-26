// Soal Prioritas 2 - Class Course & Student

class Course{
  String judul;
  String deskripsi;

  Course(this.judul, this.deskripsi);

}

class Student {
  String nama = '';
  String kelas = '';
  List<Course> courses = [];

  void tambahCourse(String judul, String deskripsi) {
    Course course = Course(judul, deskripsi);
    courses.add(course);
  }

  // Remove course by index
  void hapusCourse(int index) {
    courses.removeAt(index);
  }

  void lihatCourses() {
    for(var item in courses) {
      int index = courses.indexOf(item);
      print('Index No: ' + index.toString());
      print('Judul: ' + item.judul);
      print('Deskripsi: ' + item.deskripsi);
    }
  }

}

void main() {

  // Initial object
  Student student1 = Student();
  student1.nama = 'Agus';
  student1.kelas = 'Flutter D';

  // Tambah courses
  student1.tambahCourse('Flutter', 'Mobile Dev with Flutter');
  student1.tambahCourse('ReactJS', 'Front end Web with ReactJS');
  student1.tambahCourse('UI/UX', 'Zero to Hero UI/UX Designing');
  student1.lihatCourses();

  // Hapus Course by index
  student1.hapusCourse(0);
  student1.lihatCourses();
  
}