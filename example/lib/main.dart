import 'package:flutter/material.dart';
import 'package:select_card/select_card.dart';
import 'package:select_card_example_project/src/result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<String> titles = <String>[
    'Emre Kaplan',
    'Oğuzcan',
    'Cansu',
    'Ahmet',
    "Mete",
    "Fatih Burak Kaplan ",
  ];
  final List<String> ids = <String>[
    'id-123',
    'id-134',
    'id-145',
    'id-156',
    "id-167",
    "id-178",
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
  final Map<String, String> carMap = {
    'assets/cars/car4.png': 'automobile',
    'assets/cars/car6.png': "VIP",
    'assets/cars/car1.png': "18+1",
    'assets/cars/car3.png': "Panelvan",
    'assets/cars/car7.png': "Pick-Up",
    'assets/cars/car5.png': "SUV",
    'assets/cars/car2.png': "Other",
  };
  final Map<String, String> cakeMap = {
    'assets/cakes/cake1.png': 'Strawbery Pie',
    'assets/cakes/cake2.png': "Cheese Pie",
    'assets/cakes/cake3.png': "Donut",
    'assets/cakes/cake4.png': "Roll Cake",
    'assets/cakes/cake5.png': "Waffle",
    'assets/cakes/cake6.png': "Croissant",
  };

  String? cardGroupResult;
  String? cardGroupResult2;
  String? cardGroupResult3;
  String? singleCardResult;
  String? selectSlideResult;
  String? selectSlideResult2;

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
//---------------------------------------------------------------------
              const Padding(
                padding: EdgeInsets.all(12.0),
                child: Text(
                  "Simplest Select GROUP Card Example which returns title and id",
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
              ),
              //this widget returns both title and id
              SelectGroupCard(context, titles: titles, ids: ids,
                  onTap: (title, id) {
                debugPrint(title);
                debugPrint(id);
                setState(() {
                  cardGroupResult = title + " " + id;
                });
              }),
              Result(text: cardGroupResult),
              const Divider(
                height: 20,
                thickness: 3,
                indent: 20,
                endIndent: 20,
                color: Color.fromARGB(255, 16, 39, 189),
              ),
//---------------------------------------------------------------------
              const Padding(
                padding: EdgeInsets.all(12.0),
                child: Text(
                  "Select GROUP Card Example with properties which returns just title",
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
              ),
              //this widget just returns title
              SelectGroupCard(context,
                  titles: titles,
                  imageSourceType: ImageSourceType.network,
                  images: imagesFromNetwork,
                  contents: contents,
                  cardBackgroundColor: const Color.fromARGB(255, 128, 201, 235),
                  cardSelectedColor: Colors.deepOrange,
                  titleTextColor: Colors.blue.shade900,
                  contentTextColor: Colors.black87, onTap: (title) {
                debugPrint(title);
                setState(() {
                  cardGroupResult2 = title;
                });
              }),
              Result(text: cardGroupResult2),
              const Divider(
                height: 20,
                thickness: 3,
                indent: 20,
                endIndent: 20,
                color: Color.fromARGB(255, 16, 39, 189),
              ),
//---------------------------------------------------------------------
              const Padding(
                padding: EdgeInsets.all(12.0),
                child: Text(
                  "Select GROUP Card Example which returns just title even if you give id list",
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
              ),
              //this widget just returns title even if you give id list
              SelectGroupCard(context,
                  titles: titles,
                  ids: ids,
                  imageSourceType: ImageSourceType.network,
                  images: imagesFromNetwork,
                  contents: contents, onTap: (title) {
                debugPrint(title);
                setState(() {
                  cardGroupResult3 = title;
                });
              }),
              Result(text: cardGroupResult3),
              const Divider(
                height: 20,
                thickness: 3,
                indent: 20,
                endIndent: 20,
                color: Color.fromARGB(255, 16, 39, 189),
              ),
//---------------------------------------------------------------------
              const Padding(
                padding: EdgeInsets.all(12.0),
                child: Text(
                  "Select SINGLE Card Example with properties",
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
              ),
              Row(
                children: [
                  // this single card returns title and id
                  SelectSingleCard(context,
                      title: titles[2],
                      id: ids[2],
                      imageSourceType: ImageSourceType.network,
                      image: imagesFromNetwork[1],
                      content: contents[0],
                      cardBackgroundColor: Colors.amberAccent,
                      cardSelectedColor: Colors.blue,
                      titleTextColor: Colors.blue.shade900,
                      contentTextColor: Colors.black87, onTap: (title, id) {
                    debugPrint(title);
                    debugPrint(id);
                    setState(() {
                      singleCardResult = title + " " + id;
                    });
                  }),
                  // this single card returns just title
                  SelectSingleCard(context,
                      title: titles[5],
                      imageSourceType: ImageSourceType.network,
                      image: imagesFromNetwork[5],
                      content: contents[5],
                      cardBackgroundColor: Colors.orange,
                      cardSelectedColor: Colors.green,
                      titleTextColor: Colors.white,
                      contentTextColor: Colors.black87, onTap: (title) {
                    debugPrint(title);
                    setState(() {
                      singleCardResult = title;
                    });
                  }),
                  // this single card returns title even if you give id param
                  SelectSingleCard(context,
                      title: titles[0],
                      id: ids[0],
                      imageSourceType: ImageSourceType.network,
                      image: imagesFromNetwork[3],
                      content: contents[0],
                      cardBackgroundColor: Colors.blue.shade600,
                      cardSelectedColor: Colors.deepOrange,
                      titleTextColor: Colors.white,
                      contentTextColor: Colors.white70, onTap: (title) {
                    debugPrint(title);
                    setState(() {
                      singleCardResult = title;
                    });
                  }),
                ],
              ),
              Result(text: singleCardResult),
              const Divider(
                height: 20,
                thickness: 3,
                indent: 20,
                endIndent: 20,
                color: Color.fromARGB(255, 16, 39, 189),
              ),
// //---------------------------------------------------------------------
              const Padding(
                padding: EdgeInsets.all(12.0),
                child: Text(
                  "Simplest Select Slide İtem Example ",
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
              ),
              SelectSlideItem(
                  mapList: carMap,
                  onChange: (title) {
                    debugPrint(title);
                    setState(() {
                      selectSlideResult = title;
                    });
                  }),
              Result(text: selectSlideResult),
              const Divider(
                height: 20,
                thickness: 3,
                indent: 20,
                endIndent: 20,
                color: Color.fromARGB(255, 16, 39, 189),
              ),
//---------------------------------------------------------------------
              const Padding(
                padding: EdgeInsets.all(12.0),
                child: Text(
                  "Select Slide İtem Example with properties",
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
              ),
              SelectSlideItem(
                  mapList: cakeMap,
                  fontColor: Colors.purple,
                  fontSize: 18,
                  text: "Cakes",
                  hint: "Please select cake",
                  imageHeight: 200,
                  duration: const Duration(milliseconds: 900),
                  onChange: (title) {
                    debugPrint(title);
                    setState(() {
                      selectSlideResult2 = title;
                    });
                  }),
              Result(text: selectSlideResult2),
              const Divider(
                height: 20,
                thickness: 3,
                indent: 20,
                endIndent: 20,
                color: Color.fromARGB(255, 16, 39, 189),
              ),
// //---------------------------------------------------------------------
            ],
          ),
        ),
      ),
    );
  }
}
