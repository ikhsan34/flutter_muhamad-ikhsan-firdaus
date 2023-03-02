# (15) Flutter Layout

## Apa itu Layout?
+ Layout berfungsi untuk mengatur tata letak
+ Layout berbentuk widget yang mengatur widget di dalamnya.

## Single-child Layout
Single-child layout merupakan widget yang berisi satu widget.

### Container
+ Membuat sebuah box
+ Membungkus widget lain
+ Box memiliki margin, padding, dan border

```dart
Container(
  child Text('Teks');
);
```

#### Penggunaan Container

```dart
Container(
  margin: const EdgeInsets.all(10),
  padding: const EdgeInsets.all(10),
  decoration: BoxDecoration(
    border: Border.all(),
  ),
  child: const Text('Hallo'),
);
```

### Center
+ Membuat sebuah box
+ Membungkus widget lain
+ Memenuhi lebar dan tinggi ruang di luarnya
+ Meletakkan widget berada di bagian tengah

```dart
Center(
  child: Text('Teks'),
);
```

### SizedBox
+ Membuat sebuah box
+ Membungkus widget lain
+ Box dapat diatur lebar dan tingginya
+ Lebih sederhana dari container

```dart
SizedBox(
  width: 100,
  height: 150,
  child: Text('Teks'),
);
```

## Multi-child Layout
Multi-child Layout merupakan widget yang dapat berisi lebih dari 1 child widget (children).

### Column
+ Mengatur widgets secara vertikal

```dart
Column(
  children: const [
    Text('Teks'),
    Text('Teks'),
    Text('Teks'),
    Text('Teks'),
  ],
);
```

#### Contoh Penggunaan Column

```dart
Column(
  children: [
    Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(border: Border.all()),
      child: const Text('H'),
    ),
    Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(border: Border.all()),
      child: const Text('A'),
    ),
    Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(border: Border.all()),
      child: const Text('L'),
    ),
    Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(border: Border.all()),
      child: const Text('O'),
    ),
  ],
);
```

### Row
+ Mengatur widgets secara horizontal

```dart
Row(
  children: const [
    Text('teks');
    Text('teks');
    Text('teks');
    Text('teks');
  ]
);
```

#### Contoh Penggunaan Row

```dart
Row(
  children: [
    Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(border: Border.all()),
      child: const Text('H'),
    ),
    Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(border: Border.all()),
      child: const Text('A'),
    ),
    Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(border: Border.all()),
      child: const Text('L'),
    ),
    Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(border: Border.all()),
      child: const Text('O'),
    ),
  ],
);
```

### ListView
+ Mengatur widgets dalam bentuk list
+ Memiliki kemampuan scroll

```dart
ListView(
  children: [
    Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(border: Border.all()),
      child: const Text('H'),
    ),
  ]
);
```

### GridView
GridView berfungsi untuk mengatur child widgets dalam bentuk galeri.

```dart
GridView.count(
  crossAxisCount: num,
  children: [],
);
```

#### Contoh Penggunaan GridView

```dart
GridView.count(
  crossAxisCount: 2,
  children: [
    Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(border: Border.all()),
      child: const Text('H')
    ),
  ]
);
```
