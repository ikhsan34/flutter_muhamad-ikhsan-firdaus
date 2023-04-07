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
