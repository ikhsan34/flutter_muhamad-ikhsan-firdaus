import 'package:flutter/material.dart';
import 'package:assets_dialog_navigation/arguments/view_image_arguments.dart';
import 'package:assets_dialog_navigation/view_image.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => const Home(),
    },
    onGenerateRoute: (settings) {
      if (settings.name == '/view_image') {
        final args = settings.arguments as ViewImageArguments;

        return MaterialPageRoute(
          builder: (context) {
            return ViewImage(
              name: args.name,
              image: args.image,
            );
          },
        );
      }
      return null;
    },
  ));
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void showBottomSheet(BuildContext context, String name, String image) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10)
        )
      ),
      builder: (BuildContext context) {
        return Wrap(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Text(name),
              ),
            ),
            Image(
              image: AssetImage(image),
              width: double.infinity,
            ),
            const SizedBox(height: 20,),
            const Center(
              child: Text('View image on new page?')
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('No', style: TextStyle(color: Colors.red),),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(
                      context,
                      '/view_image',
                      arguments: ViewImageArguments(name: name, image: image)
                    );
                  },
                  child: const Text('Yes'),
                ),
              ],
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Assets'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20,),
            const Text('Flutter Assets, Dialog, Navitaion'),
            const Text('This font is using \'Rubik-Regular\''),

            const SizedBox(height: 20),
            const Text('JDM Cars'),
            GridView.count(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              primary: false,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 2,
              children: [
                GestureDetector(
                  onTap: () {
                    showBottomSheet(context, 'Nissan Silvia S15', 'assets/images/Nissan S15.jpg');
                  },
                  child: const Image(
                    image: AssetImage('assets/images/Nissan S15.jpg'),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    showBottomSheet(context, 'Nissan Silvia S14', 'assets/images/Nissan S14.jpg');
                  },
                  child: const Image(
                    image: AssetImage('assets/images/Nissan S14.jpg'),
                  ),
                ),GestureDetector(
                  onTap: () {
                    showBottomSheet(context, 'Nissan Skyline R34 GTR', 'assets/images/Nissan R34.jpg');
                  },
                  child: const Image(
                    image: AssetImage('assets/images/Nissan R34.jpg'),
                  ),
                ),GestureDetector(
                  onTap: () {
                    showBottomSheet(context, 'Nissan Silvia S13', 'assets/images/Nissan S13.jpg');
                  },
                  child: const Image(
                    image: AssetImage('assets/images/Nissan S13.jpg'),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
