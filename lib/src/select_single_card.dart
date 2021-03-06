import 'package:flutter/material.dart';

import '../enums/enums.dart';

///This widget represents a card, it gets string parameters for its use. It has
///to take title. Content and image parameters can be optionally provided. With
/// this widget you can choose a lot from cards. Single cards will add animated
///  visual beauty to your application.
// ignore: must_be_immutable
class SelectSingleCard extends StatefulWidget {
  BuildContext context;
  ImageSourceType? imageSourceType;
  Function onTap;
  double radius;
  Color contentTextColor;
  Color titleTextColor;
  Color cardBackgroundColor;
  Color cardSelectedColor;
  Duration duration;
  String? content;
  String title = "";
  String? id;
  String? image;

  SelectSingleCard(this.context,
      {required this.title,
      required this.onTap,
      this.id,
      this.content,
      this.imageSourceType,
      this.image,
      this.radius = 10,
      this.contentTextColor = const Color(0xff003087),
      this.titleTextColor = const Color(0xff003087),
      this.cardBackgroundColor = const Color(0xffCCd6E7),
      this.cardSelectedColor = const Color(0xff003087),
      this.duration = const Duration(milliseconds: 100),
      Key? key})
      : super(key: key);

  @override
  State<SelectSingleCard> createState() => _SelectSingleCardState();
}

class _SelectSingleCardState extends State<SelectSingleCard>
    with TickerProviderStateMixin {
  AnimationController? _controller; //renk animasyonuna ait kontoller
  AnimationController? _sizeController; //boyut animasyonuna ait kontoller
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
      //print(_sizeController!.value);
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
      child: AnimatedBuilder(
        animation: _controller!,
        builder: (BuildContext context, _) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(10, 18, 10, 18),
            child: GestureDetector(
              onTap: () {
                if (isSelected) {
                  _controller!.reverse();
                  _sizeController!.reverse();
                  selectedName = widget.title;
                } else {
                  selectedName = widget.title;
                  _controller!.forward();
                  _sizeController!.forward();
                }
                try {
                  if (widget.id != null) {
                    widget.onTap(widget.title, widget.id);
                  } else {
                    widget.onTap(widget.title);
                  }
                } catch (e) {
                  widget.onTap(widget.title);
                }
              },
              child: selectedName == widget.title
                  ? ScaleTransition(
                      scale: _sizeController!,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 5, right: 5),
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
                                  if (widget.image != null) buildImage(),
                                  buildSelectedTitle(),
                                  if (widget.content != null && isSelected)
                                    buildSelectedContent(),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.only(left: 5, right: 5),
                      child: Container(
                          width: 80,
                          decoration: BoxDecoration(
                              color: widget.cardBackgroundColor,
                              borderRadius: BorderRadius.all(
                                  Radius.circular(widget.radius))),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              if (widget.image != null) buildImage(),
                              buildTitle(),
                            ],
                          )),
                    ),
            ),
          );
        },
      ),
    );
  }

  /// Fonksiyon - se??ilmi?? i??eri??i g??r??nt??ler
  Center buildSelectedContent() {
    // se??ilmi?? Content i??eri??i
    return Center(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(6, 0, 6, 2),
        child: Text(
          widget.content!,
          style: TextStyle(
            color: widget.contentTextColor,
            fontSize: 8,
            overflow: TextOverflow.ellipsis,
          ),
          textAlign: TextAlign.center,
          maxLines: 2,
        ),
      ),
    );
  }

  /// Fonksiyon - se??ilmi?? title g??r??nt??ler
  Center buildSelectedTitle() {
    // se??ilmi?? title i??eri??i
    return Center(
      child: Text(
        widget.title,
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

  /// Fonksiyon - title g??r??nt??ler
  Center buildTitle() {
    // title i??eri??i
    return Center(
        child: Text(
      widget.title,
      style: TextStyle(
        color: widget.titleTextColor,
        fontSize: 14,
        fontWeight: FontWeight.w600,
      ),
      textAlign: TextAlign.center,
      maxLines: 4,
    ));
  }

  /// Fonksiyon - image g??r??nt??ler
  Center buildImage() {
    // varsa g??rsel i??eri??i
    return Center(
      child: widget.imageSourceType == ImageSourceType.network
          ? buildNetworkImage()
          : buildAssetImage(),
    );
  }

  /// Fonksiyon - network image g??r??nt??ler
  Image buildNetworkImage() {
    // g??rselin networkten g??r??nt??lenmesi sa??lan??r
    return Image.network(
      widget.image!,
      height: 45,
      width: 45,
    );
  }

  /// Fonksiyon - asset image g??r??nt??ler
  Image buildAssetImage() {
    // g??rselin assetlerden g??r??nt??lenmesi sa??lan??r
    return Image.asset(
      widget.image!,
      height: 45,
      width: 45,
    );
  }
}
