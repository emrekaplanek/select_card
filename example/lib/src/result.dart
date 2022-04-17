import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Result extends StatefulWidget {
  String? text;
  Result({
    Key? key,
    this.text,
  }) : super(key: key);

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          const Text(
            "Selected: ",
            style: TextStyle(color: Colors.deepOrange, fontSize: 16),
          ),
          Text(
            widget.text ?? "",
            style: const TextStyle(color: Colors.black, fontSize: 16),
          ),
        ],
      ),
    );
  }
}
