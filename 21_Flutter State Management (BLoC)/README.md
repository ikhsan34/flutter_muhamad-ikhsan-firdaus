# (21) Flutter State Management with BLoC

## Declarative UI
Flutter memiliki sifat declarative yang artinya flutter membangun UI-nya pada screen untuk mencerminkan keadaan state saat ini.

![image](https://user-images.githubusercontent.com/10411833/229665028-7424eac8-68f1-4c62-8ce7-735812cbf49a.png)

## setState
+ State adalah ketika sebuah widget sedang aktif dan widget tersebut menyimpan data di memori
+ Flutter akan membangun ulang UI-nya ketika ada state atau data yang berubah
+ Ada 2 jenis state dalam flutter, ephemeral state dan app state

### Ephemeral State
+ Digunakan ketika tidak ada bagian lain pada widget tree yang membutuhkan untuk mengakses data widgetnya, contoh:
  + PageView
  + BottomNavigationBar
  + Switch Button
+ Tidak perlu state management yang kompleks
+ Hanya membutuhkan StatefulWidget dengan menggunakan fungsi setState()

### App State
+ Digunakan ketika bagian yang lain dari suatu aplikasi membutuhkan akses ke data state widget, contohnya:
  + Login info
  + Pengaturan preferensi pengguna
  + Keranjang belanja, dimana informasi yang pengguna pilih di suatu screen akan muncul di screen yang berbeda
  
### Pendekatan State Management
+ setState, lebih cocok penggunaannya pada ephemeral state
+ Provider, penggunaan untuk state management yang lebih kompleks seperti app state, pendekatan ini direkomendasikan oleh tim flutter karena mudah dipelajari
+ BLoC, Menggunakan pola stream/observable, untuk memisahkan UI dengan bisnis logicnya

## BLoC
BLoC atau Business Logic Component berperan untuk memisahkan antara business logic dengan UI.

![image](https://user-images.githubusercontent.com/10411833/229665687-a53d6296-be8f-4c7f-90b8-442f5242c665.png)

### Mengapa BLoC
+ Simple
+ Powerful
+ Testable

### Cara Kerja BLoC
+ Menerima event sebagai input
+ Dianalisa dan dikelola di dalam BLoC
+ Menghasilkan state sebagai output

![image](https://user-images.githubusercontent.com/10411833/229665793-b9374f1a-b72d-4c8f-8c89-2ce5a9484e2b.png)

### Stream
+ Stream yaitu rangkaian proses secara asynchronous
+ Stream merupakan actor utama di dalam BLoC

![image](https://user-images.githubusercontent.com/10411833/229665891-cbcdab45-d782-4931-932e-68328247b5e6.png)


### Menggunakan BLoC

#### Install Package

```yaml
dependencies:
  flutter:
    sdk: flutter
  flutter_bloc: ^8.0.1
  equatable: ^2.0.3
```

#### Membuat Folder BLoC
+ Buat file baru, counter_bloc.dart, counter_event.dart, counter_state.dart

![image](https://user-images.githubusercontent.com/10411833/229666408-d804b6fb-9d3a-4196-8ceb-5c0208ce8827.png)

#### Menambahkan Event
+ Tambahkan event di counter_event.dart

```dart
abstract class CounterEvent extends Equatable {
  const CounterEvent();
  
  @override
  List<Object> get props => [];
}

class Increment extends CounterEvent {
  
}

class Decrement extends CounterEvent {

}
```

#### Menambahkan State
+ Tambahkan state untuk menyimpan nilai counter di counter_state.dart

```dart
class CounterState extends Equatable {
  int value = 0;
  CounterState(this.value);
  
  @override
  List<Object> get props => [value];
}
```

#### Menambahkan Bussiness Logic
+ Tambahkan logika bisnis di counter_bloc.dart
+ Gunakan fungsi emit untuk mengirim state terbaru

```dart
class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState(0)) {
    on<Increment>((event, emit) => emit(CounterState(state.value + 1)));
    on<Decrement>((event, emit) => emit(CounterState(state.value - 1)));
  }
}
```

#### Menambahkan BlocProvider
+ Tambahkan BlocProvider di main.dart

```dart
Widget build(BuildContext context) {
  return BlocProvider<CounterBloc>(
    create: (context) => CounterBloc(),
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange
      ),
      home: const HomePage(),
    ),
  );
}
```

#### Membangun UI
+ Buat folder baru screens, di dalamnya buat file dart home_page.dart

```dart
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Latihan Bloc'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              '0',
              style: TextStyle(fontSize: 50),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
              
              },
              child: const Text('Increment'),
            ),
            ElevatedButton(
              onPressed: () {
              
              },
              child: const Text('Decrement'),
            ),
          ]
        )
      )
    );
  }
}
```

#### Menambahkan BlocBuilder
+ Tambahkan BlocBuilder di home_page.dart

```dart
body: BlocBuilder<CounterBloc, CounterState>(
  builder: (context, state) {
    return Center(
      child: Column(
        children: []
      )
    );
  }
```

#### Mengganti Text
+ Menampilkan nilai terbaru yang dimiliki state

```dart
Text(
  '${state.value}',
  style: const TextStyle(fontSize: 50)
),
```

#### Menambahkan context.read
+ Tambahkan context.read pada fungsi onPressed ElevatedButton

```dart
ElevatedButton(
  onPressed: () {
    context.read<CounterBloc>().add(Increment());
  },
  child: const Text('Increment'),
),
ElevatedButton(
  onPressed: () {
    context.read<CounterBloc>().add(Increment());
  },
  child: const Text('Decrement'),
),
```


























