# Praktikum Flutter Animation

## Flutter App - Contact List

### Soal Prioritas 1
![Soal Prioritas 1](https://user-images.githubusercontent.com/10411833/230734538-8a88bd58-7529-4fd3-8b14-f80a92ee2428.gif)

### Soal Prioritas 2
![Soal Prioritas 2](https://user-images.githubusercontent.com/10411833/230734541-36121b79-ae1b-4e9a-9a98-7733836929f9.gif)

### Soal Eksplorasi
![Soal Eksplorasi](https://user-images.githubusercontent.com/10411833/230734544-e149f2ca-9cb0-4023-a958-3ea61159a967.gif)

### Dynamic Page Transition
![Dynamic Page Transition](https://user-images.githubusercontent.com/10411833/230734548-bf10def0-7268-4b08-b834-75777646d3ae.gif)

#### Code
```dart
import 'dart:math';
import 'package:flutter/material.dart';

Route animateRoute(BuildContext context, Widget nextPage) {

  int randomIndex = Random().nextInt(3);

  Widget slideTransition(BuildContext context, Animation animation, Animation secondaryAnimation, Widget child) {
    const begin = Offset(0.0, -1.0);
    const end = Offset.zero;
    const curve = Curves.easeInOut;
    final tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

    return SlideTransition(
      position: animation.drive(tween),
      child: child,
    );
  }

  Widget fadeTransition(Animation animation, Widget child) {
    const curve = Curves.easeInOut;
    final tween = Tween(begin: 0.0, end: 1.0).chain(CurveTween(curve: curve));
    
    return FadeTransition(
      opacity: animation.drive(tween),
      child: child
    );
  }

  Widget scaleTransition(Animation animation, Widget child) {
    const curve = Curves.easeInOut;
    final tween = Tween(begin: 0.0, end: 1.0).chain(CurveTween(curve: curve));

    return ScaleTransition(
      alignment: Alignment.bottomCenter,
      scale: animation.drive(tween),
      child: child
    );
  }

  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => nextPage,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {

      List<Widget> transitions = [
        slideTransition(context, animation, secondaryAnimation, child),
        fadeTransition(animation, child),
        scaleTransition(animation, child)
      ];

      return transitions[randomIndex];
    },
  );
}

```
