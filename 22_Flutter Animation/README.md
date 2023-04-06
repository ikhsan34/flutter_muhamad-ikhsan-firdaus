# (22) Flutter Animation

## Animation
Animasi berfungsi untuk membuat aplikasi terlihat lebih hidup. Widget yang bergerak menambah daya tarik user. Animasi merupakan pergerakan dari kondisi A ke kondisi B.

## Implicit Animation
Implicit animation merupakan animasi yang sudah tersedia dari widget.

**Contoh**

```dart
bool isBig = false;

AnimatedContainer(
  width: isBig ? 200 : 100,
  height: isBig ? 200 : 100,
  color: Colors.red,
  duration: const Duration(milliseconds: 300)
)
```

## Transition
Transition merupakan animasi yang terjadi saat perpindahan halaman. Transition dilakukan pada bagian Navigator.push().

**Contoh**

```dart
Navigator.of(context).push(
  PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) {
      return AboutScreen();
    },
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      final tween = Tween(begin: const Offset(0, 0.5), end: Offset.zero);
      
      return SlideTransition(
        position: animation.drive(tween),
        child: child
      );
    }
  )
)
```

## Common Transition

### FadeTransition
FadeTransition yaitu halaman muncul dengan efek redup menuju ke tampak jelas secara penuh.

```dart
final tween = Tween(begin: 0.0, end: 1.0);

return FadeTransition(
  opacity: animation.drive(tween),
  child: child
);
```

### ScaleTransition
ScaleTransition yaitu halaman muncul dengan efek berubah ukuran dari tidak penuh menuju tampil keseluruhan.

```dart
final tween = Tween(begin: 0.0, end: 1.0);

return ScaleTransition(
  scale: animation.drive(tween),
  child: child
);
```
