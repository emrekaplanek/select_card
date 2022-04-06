import 'package:flutter/material.dart';
import 'package:select_card/select_card.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final List<String> titles = <String>[
    'Emre Kaplan',
    'Oğuzcan',
    'Cansu',
    'Ahmet',
    "Mete",
    "Fatih Burak Kaplan ",
  ];
  final List<String> contents = <String>[
    'Lorem ipsum dolor sit amet, consectetur ',
    'Mauris vitae, tristique',
    'Volutpat convallis tellus',
    'Metus maximus sit amet.',
    "Integer tristique sodales",
    "Sed sodales lacus Metus maximus sit tristique sodales Mauris vitae, tristique"
  ];
  final List<String> imagesFromNetwork = <String>[
    'https://gravatar.com/avatar/37b27392b82a7f94676757c1c2d10273?s=400&d=robohash&r=x',
    'https://gravatar.com/avatar/36f1d92605a3bf914d94cd136d3c7ec3?s=400&d=robohash&r=x',
    'https://gravatar.com/avatar/5ef18de85860bd24b4d95f3dcd41eccb?s=400&d=robohash&r=x',
    'https://gravatar.com/avatar/ce9c78d5127331baa3c67c7f67973967?s=400&d=robohash&r=x',
    "https://gravatar.com/avatar/d7204273c98a64cf10cef68ef561e722?s=400&d=robohash&r=x",
    "https://gravatar.com/avatar/f4f5b41a89722855c614bb1ea1dacc4d?s=400&d=robohash&r=x"
  ];
  final List<String> imagesFromAsset = <String>[
    'assets/clock.png',
    'assets/clock.png',
    'assets/clock.png',
    'assets/clock.png',
    'assets/clock.png',
    'assets/clock.png',
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Package Control',
        theme: ThemeData(
          primarySwatch: Colors.deepOrange,
        ),
        home: Scaffold(
            appBar: AppBar(
              title: const Text("Package Control Example"),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text(
                      "Simplest Select GROUP Card Example",
                      style: TextStyle(color: Colors.deepOrange, fontSize: 16),
                    ),
                  ),
                  SelectGroupCard(context, titles: titles,
                      onTap: (String selectedTitle) {
                    debugPrint(selectedTitle);
                  }),
                  const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text(
                      "Select GROUP Card Example with properties",
                      style: TextStyle(color: Colors.purple, fontSize: 16),
                    ),
                  ),
                  SelectGroupCard(context,
                      titles: titles,
                      imageSourceType: ImageSourceType.network,
                      images: imagesFromNetwork,
                      contents: contents,
                      cardBackgroundColor: Colors.orange.shade200,
                      cardSelectedColor: Colors.deepOrange,
                      titleTextColor: Colors.blue.shade900,
                      contentTextColor: Colors.black87,
                      onTap: (String selectedTitle) {
                    debugPrint(selectedTitle);
                  }),
                  const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text(
                      "Select SINGLE Card Example with properties",
                      style: TextStyle(color: Colors.deepPurple, fontSize: 16),
                    ),
                  ),
                  Row(
                    children: [
                      SelectSingleCard(context,
                          title: titles[2],
                          imageSourceType: ImageSourceType.network,
                          image: imagesFromNetwork[1],
                          content: contents[0],
                          cardBackgroundColor: Colors.amberAccent,
                          cardSelectedColor: Colors.blue,
                          titleTextColor: Colors.blue.shade900,
                          contentTextColor: Colors.black87,
                          onTap: (String selectedTitle) {
                        debugPrint(selectedTitle);
                      }),
                      SelectSingleCard(context,
                          title: titles[5],
                          imageSourceType: ImageSourceType.network,
                          image: imagesFromNetwork[5],
                          content: contents[5],
                          cardBackgroundColor: Colors.black12,
                          cardSelectedColor: Colors.green,
                          titleTextColor: Colors.white,
                          contentTextColor: Colors.black87,
                          onTap: (String selectedTitle) {
                        debugPrint(selectedTitle);
                      }),
                      SelectSingleCard(context,
                          title: titles[0],
                          imageSourceType: ImageSourceType.network,
                          image: imagesFromNetwork[3],
                          content: contents[0],
                          cardBackgroundColor: Colors.blue.shade600,
                          cardSelectedColor: Colors.deepOrange,
                          titleTextColor: Colors.white,
                          contentTextColor: Colors.white70,
                          onTap: (String selectedTitle) {
                        debugPrint(selectedTitle);
                      }),
                    ],
                  ),
                ],
              ),
            )));
  }
}
