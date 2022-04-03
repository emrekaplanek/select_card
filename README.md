<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->

A Flutter package with animated customizable card items selection.

## Features

You can customize the card group with options such as difference colors, animation times, and enrich your widget with photo and detail information lists.

## Instalation

dependencies:
  card_selector: ^0.0.1

## Simple Useage
```dart
 SelectCard(
                context,
                imageSourceType: ImageSourceType.network,
                images: imagesFromNetwork,
                titles: titles,
                contents: contents,
                onTap: (String selectedItemTitle) {
                  debugPrint(selectedItemTitle);
                },
```

