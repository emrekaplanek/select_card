library select_card;

import 'package:flutter/material.dart';

enum ImageSourceType { asset, network }

class SelectCardGroup extends StatefulWidget {
  BuildContext context;
  ImageSourceType? imageSourceType;
  Function onTap;
  double radius;
  Color contentTextColor;
  Color titleTextColor;
  Color cardBackgroundColor;
  Color cardSelectedColor;
  Duration duration;
  List<String> titles = [];
  List<String?>? contents = [];
  List<String?>? images = [];
  SelectCardGroup(this.context,
      {required this.titles,
      required this.onTap,
      this.contents,
      this.imageSourceType,
      this.images,
      this.radius = 10,
      this.contentTextColor = const Color(0xff003087),
      this.titleTextColor = const Color(0xff003087),
      this.cardBackgroundColor = const Color(0xffCCd6E7),
      this.cardSelectedColor = const Color(0xff003087),
      this.duration = const Duration(milliseconds: 100),
      Key? key})
      : super(key: key);

  @override
  State<SelectCardGroup> createState() => _SelectCardGroupState();
}

class _SelectCardGroupState extends State<SelectCardGroup>
    with TickerProviderStateMixin {
  AnimationController? _controller;
  AnimationController? _sizeController;
  Animation? _colorAnimation;

  bool isSelected = false;
  String selectedName = "";

  @override
  void initState() {
    super.initState();
    //-------AnimationControllers---------------------
    _controller = AnimationController(vsync: this, duration: widget.duration);
    _sizeController = AnimationController(
      vsync: this,
      duration: widget.duration,
      value: 1.0,
      lowerBound: 1.0,
      upperBound: 1.3,
    );
    // ------Animations--------------------
    _colorAnimation = ColorTween(
            begin: widget.cardBackgroundColor, end: widget.cardSelectedColor)
        .animate(_controller!);

    _controller!.addListener(() {
      // print(_controller!.value);
      // print(_colorAnimation!.value);
      // print(_sizeController!.value);
    });

    _controller!.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          isSelected = true;
        });
      } else if (status == AnimationStatus.dismissed) {
        setState(() {
          isSelected = false;
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller!.dispose();
    _sizeController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 145,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: widget.titles.length,
          itemBuilder: (context, index) {
            return AnimatedBuilder(
              animation: _controller!,
              builder: (BuildContext context, _) {
                return Padding(
                  padding: const EdgeInsets.fromLTRB(10, 17, 10, 17),
                  child: GestureDetector(
                    onTap: () {
                      if (isSelected) {
                        _controller!.reverse();
                        _sizeController!.reverse().then((value) {
                          selectedName = widget.titles[index];
                          _controller!.forward();
                          _sizeController!.forward();
                          return null;
                        });
                      } else {
                        selectedName = widget.titles[index];
                        _controller!.forward();
                        _sizeController!.forward();
                      }
                      widget.onTap(widget.titles[index]);
                    },
                    child: selectedName == widget.titles[index]
                        ? ScaleTransition(
                            scale: _sizeController!,
                            child: Container(
                              width: 90,
                              decoration: BoxDecoration(
                                  color: _colorAnimation!.value,
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(widget.radius))),
                              child: Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: widget.cardBackgroundColor,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(widget.radius - 2))),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      if (widget.images != null &&
                                          widget.images!.length ==
                                              widget.titles.length)
                                        if (widget.images![index] != null)
                                          buildImage(index),
                                      buildSelectedTitle(index),
                                      if (widget.contents != null &&
                                          widget.contents!.length ==
                                              widget.titles.length)
                                        if (widget.contents![index] != null)
                                          buildSelectedContent(index),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          )
                        : Container(
                            width: 80,
                            decoration: BoxDecoration(
                                color: widget.cardBackgroundColor,
                                borderRadius: BorderRadius.all(
                                    Radius.circular(widget.radius))),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                if (widget.images != null &&
                                    widget.images!.length ==
                                        widget.titles.length)
                                  if (widget.images![index] != null)
                                    buildImage(index),
                                buildTitle(index),
                              ],
                            )),
                  ),
                );
              },
            );
          }),
    );
  }

  Center buildSelectedContent(int index) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(6, 0, 6, 2),
        child: Text(
          widget.contents![index]!,
          style: TextStyle(
            color: widget.contentTextColor,
            fontSize: 8,
            overflow: TextOverflow.ellipsis,
          ),
          textAlign: TextAlign.center,
          maxLines: 3,
        ),
      ),
    );
  }

  Center buildSelectedTitle(int index) {
    return Center(
      child: Text(
        widget.titles[index],
        style: TextStyle(
          color: widget.titleTextColor,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
        textAlign: TextAlign.center,
        maxLines: 2,
      ),
    );
  }

  Center buildTitle(int index) {
    return Center(
        child: Text(
      widget.titles[index],
      style: TextStyle(
        color: widget.titleTextColor,
        fontSize: 14,
        fontWeight: FontWeight.w600,
      ),
      textAlign: TextAlign.center,
      maxLines: 4,
    ));
  }

  Center buildImage(int index) {
    return Center(
      child: widget.imageSourceType == ImageSourceType.network
          ? buildNetworkImage(index)
          : buildAssetImage(index),
    );
  }

  Image buildNetworkImage(int index) {
    return Image.network(
      widget.images![index]!,
      height: 45,
      width: 45,
    );
  }

  Image buildAssetImage(int index) {
    return Image.asset(
      widget.images![index]!,
      height: 45,
      width: 45,
    );
  }
}
