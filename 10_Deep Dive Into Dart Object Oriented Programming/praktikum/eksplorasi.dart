// Soal Eksplorasi - class Shape implements

class Shape {

  void getArea() { // Cannot initialize return type to int, causing problem to class Circle

  }
  
  void getPerimeter() {

  }
}

class Circle implements Shape {

  int radius = 0;

  @override
  double getArea() { // using double cause dividing is has to be double type
    return 22/7 * radius * radius / 4;
  }

  @override
  double getPerimeter() {
    return 2 * 22/7 * radius / 2;
  }

}

class Square implements Shape {

  int side = 0;

  @override
  int getArea() { // using int to follow instructions from question
    return side * side;
  }

  @override
  int getPerimeter() {
    return 4 * side;
  }

}

class Rectangle implements Shape {

  int width = 0;
  int height = 0;

  @override
  int getArea() {
    return width * height;
  }

  @override
  int getPerimeter() {
    return (2 * width) + (2 * height);
  }

}


void main() {

  Circle circle = Circle();
  circle.radius = 10;
  print('Circle Area: ' + circle.getArea().toString());
  print('Circle Perimeter: ' + circle.getPerimeter().toString());

  Square square = Square();
  square.side = 5;
  print('Square Area: ' + square.getArea().toString());
  print('Square Perimeter: ' + square.getPerimeter().toString());

  Rectangle rectangle = Rectangle();
  rectangle.width = 10;
  rectangle.height = 5;
  print('Rectangle Area: ' + rectangle.getArea().toString());
  print('Rectangle Perimeter: ' + rectangle.getPerimeter().toString());
  
}