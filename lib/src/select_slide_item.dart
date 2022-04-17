import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SelectSlideItem extends StatefulWidget {
  Map<String, String>? mapList;
  String text;
  String hint;
  double fontSize;
  double dropdownHeight;
  double imageHeight;
  Color fontColor;
  Duration duration;
  Function onChange;
  SelectSlideItem(
      {required this.mapList,
      required this.onChange,
      this.text = "items",
      this.hint = "Please select item",
      this.fontSize = 16,
      this.dropdownHeight = 50,
      this.imageHeight = 180,
      this.fontColor = const Color(0xff003087),
      this.duration = const Duration(milliseconds: 800),
      Key? key})
      : super(key: key);

  @override
  State<SelectSlideItem> createState() => _SelectSlideItemState();
}

class _SelectSlideItemState extends State<SelectSlideItem>
    with TickerProviderStateMixin {
  String? item;
  String? selectedImg;
  String? previousImg;
  bool isSelected = false;

  AnimationController? _biggerController;
  AnimationController? _smallerController;

  @override
  void dispose() {
    super.dispose();
    _biggerController!.dispose();
    _smallerController!.dispose();
  }

  @override
  void initState() {
    super.initState();

    _biggerController = AnimationController(
      vsync: this,
      duration: widget.duration,
      value: 0.3,
      lowerBound: 0.3,
      upperBound: 1.0,
    );

    _smallerController = AnimationController(
      vsync: this,
      duration: widget.duration,
      value: 1.0,
      lowerBound: 0.3,
      upperBound: 1.0,
    );
  }

  late final Animation<double> _animationBigger = CurvedAnimation(
    parent: _biggerController!,
    curve: Curves.easeInOutCubic,
  );
  late final Animation<double> _animationsmaller = CurvedAnimation(
    parent: _smallerController!,
    curve: Curves.easeOutCubic,
  );
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(widget.text,
                    style: TextStyle(
                        fontSize: widget.fontSize, color: widget.fontColor)),
                if (widget.mapList != null)
                  DropdownButton<String>(
                    style: TextStyle(
                        color: widget.fontColor, fontSize: widget.fontSize),
                    underline: Container(
                      height: 1,
                      color: widget.fontColor,
                    ),
                    itemHeight: widget.dropdownHeight,
                    value: item,
                    hint: Text(widget.hint),
                    items: widget.mapList!
                        .map((key, value) {
                          return MapEntry(
                              key,
                              DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              ));
                        })
                        .values
                        .toList(),
                    onChanged: (value) async {
                      _biggerController!.reset();
                      _biggerController!.forward();
                      _smallerController!.value = 1.0;
                      _smallerController!.reverse();

                      widget.onChange(value);

                      updateSelectedItem(widget.mapList!.entries
                          .firstWhere((element) => element.value == value)
                          .key);
                      item = value;
                    },
                  ),
              ]),
          Row(
            children: [
              TweenAnimationBuilder(
                tween: Tween<double>(begin: 0, end: 1),
                key: Key(item ?? ""),
                curve: Curves.ease,
                duration: widget.duration,
                builder: (BuildContext context, double value, _) {
                  return SizedBox(
                    height: selectedImg != null ? widget.imageHeight : 0,
                    child: Stack(
                      children: [
                        ScaleTransition(
                          scale: _animationBigger,
                          child: Opacity(
                            opacity: value,
                            child: Transform.translate(
                              offset: Offset(0.0, -100 * (1 - value)),
                              child: (selectedImg != null)
                                  ? Image.asset(selectedImg!,
                                      width: MediaQuery.of(context).size.width -
                                          30)
                                  : null,
                            ),
                          ),
                        ),
                        ScaleTransition(
                          scale: _animationsmaller,
                          child: Opacity(
                            opacity: 1 - value,
                            child: Transform.translate(
                              offset: Offset(0.0, 100 * value),
                              child: (previousImg != null)
                                  ? Image.asset(
                                      previousImg!,
                                      width: MediaQuery.of(context).size.width -
                                          30,
                                    )
                                  : null,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              )
            ],
          ),
        ],
      ),
    );
  }

  void updateSelectedItem(String imgpath) {
    setState(() {
      previousImg = selectedImg;
      selectedImg = imgpath;
    });
  }
}
