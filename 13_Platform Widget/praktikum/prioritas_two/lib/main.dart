import 'package:flutter/cupertino.dart';

void main() {

  const darkTheme = CupertinoThemeData.raw(Brightness.dark, null, null, null, null, null);

  runApp(const CupertinoApp(
    theme: darkTheme,
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('CupertinoApp'),
      ),
      child: Center(
        child: Text('This is CupertinoApp'),
      ),
    );
  }
}