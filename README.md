# select_card Flutter widget

A Flutter package with animated customizable card items selection.


## Features

You can customize the card group with options such as difference colors, animation times, and enrich your widget with photo and detail information lists.

## Widgets

SelectGroupCard();  
SelectSingleCard();

## Simple Usage

```dart
SelectGroupCard(context,
                titles: titles,
                onTap: (String selectedTitle) {
                  debugPrint(selectedTitle);
                });
```
## Usage with properties

![Demo 2](https://raw.githubusercontent.com/emrekaplanek/mediaRepository/main/select_card_media/select_card.gif)

```dart
Text(
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

```

