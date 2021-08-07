import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class BlurEffect extends StatelessWidget {
  final String blurEffect = 'assets/images/blur_effect.png';

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Positioned(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(blurEffect),
            fit: BoxFit.cover,
          ),
        ),
      ),
      top: -screenSize.height / 1.6,
    );
  }
}

class BlurEffectPaintMap extends StatelessWidget {
  final Map<String, double> dimensionsMap;
  BlurEffectPaintMap({@required this.dimensionsMap});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Positioned(
      right: dimensionsMap["right"],
      left: dimensionsMap["left"],
      bottom: dimensionsMap["bottom"],
      top: dimensionsMap["top"],
      child: Stack(
        children: [
          Transform.rotate(
            angle: dimensionsMap["rotation"] != null ? -3.14 / dimensionsMap["rotation"] : -3.14 / 4,
            child: BackdropFilter(
              filter: ui.ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
              child: Container(
                decoration: new BoxDecoration(
                  gradient: new LinearGradient(
                    colors: <Color>[Color(0xffA480E5).withOpacity(.5), Color(0xff5DA1E0).withOpacity(.5)],
                    begin: FractionalOffset.topLeft,
                    end: FractionalOffset.topRight,
                  ),
                  borderRadius: BorderRadius.circular(80.0),
                ),
                width: dimensionsMap["width"],
                height: dimensionsMap["height"],
              ),
            ),
          ),
          BackdropFilter(
            filter: ui.ImageFilter.blur(sigmaX: 20, sigmaY: 20),
            child: Container(
              alignment: Alignment.center,
              // Choose Colors.black.withOpacity(0.3) here if you want a shadow effect in addition to blurring.
              color: Colors.transparent,
              // This part is new, creating the cutout.
              child: CustomPaint(
                size: screenSize,
                painter: HoleInBlur(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HoleInBlur extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double radius = -600;
    double blurRadius = 300;
    canvas.drawCircle(
      Offset(0, -100),
      radius,
      Paint()
        ..blendMode = BlendMode.xor
        // The mask filter gives some fuziness to the cutout.
        ..maskFilter = MaskFilter.blur(BlurStyle.normal, blurRadius),
    );
  }

  @override
  bool shouldRepaint(HoleInBlur oldDelegate) => false;
}

kTopBlurEffect(Size screenSize) {
  if (screenSize.width > 1500) {
    return {
      "right": 0.0,
      "left": 0.0,
      "top": 0.0,
      "bottom": 0.0,
      "rotation": 1.0,
      "height": 1.0,
      "width": 1.0,
    };
  } else if (screenSize.width > 1200) {
    return {
      "right": 0.0,
      "left": (screenSize.width / 10),
      "top": -(screenSize.height / 2.2),
      "bottom": 0.0,
      "width": screenSize.width,
      "height": screenSize.height / 1.3
    };
  } else if (screenSize.width > 700) {
    return {
      "right": 0.0,
      "left": -(screenSize.width / 20),
      "top": -(screenSize.height / 3),
      "bottom": 0.0,
      "width": screenSize.width / 1,
      "height": screenSize.height / 1.8
    };
  } else {
    return {
      "right": 0.0,
      "left": -(screenSize.width / 40),
      "top": -(screenSize.height / 5.1),
      "bottom": 0.0,
      "width": screenSize.width,
      "height": screenSize.height / 2.1
    };
  }
}

kLeftBlurEffect(Size screenSize) {
  if (screenSize.width > 1500) {
    return {
      "right": 0.0,
      "left": 0.0,
      "top": 0.0,
      "bottom": 0.0,
      "rotation": 1.0,
      "height": 1.0,
      "width": 1.0,
    };
  } else if (screenSize.width > 1200) {
    return {
      "right": 0.0,
      "left": -(screenSize.width / 2.3),
      "top": screenSize.height / 3,
      "bottom": 0.0,
      "height": screenSize.height / 1.5,
      "width": screenSize.width / 1.4
    };
  } else if (screenSize.width > 700) {
    return {
      "right": screenSize.width / 2,
      "left": -(screenSize.width / 2),
      "top": screenSize.height / 3.3,
      "bottom": 0.0,
      "height": screenSize.height / 2.0,
      "width": screenSize.width / 1.2
    };
  } else {
    return {
      "right": screenSize.width / 2,
      "left": -(screenSize.width / 2.3),
      "top": screenSize.height / 2.3,
      "bottom": 0.0,
      "height": screenSize.height / 2.9,
      "width": screenSize.width / 1.2
    };
  }
}

kRightBlurEffect(Size screenSize) {
  if (screenSize.width > 1500) {
    return {
      "right": 0.0,
      "left": 0.0,
      "top": 0.0,
      "bottom": 0.0,
      "rotation": 1.0,
      "height": 1.0,
      "width": 1.0,
    };
  } else if (screenSize.width > 1200) {
    return {
      "right": -(screenSize.width / 3.3),
      "left": screenSize.width / 1.3,
      "top": screenSize.height / 6,
      "bottom": 0.0,
      "height": screenSize.height / 2.1,
      "width": screenSize.width / 1,
    };
  } else if (screenSize.width > 700) {
    return {
      "right": -(screenSize.width / 3.3),
      "left": screenSize.width / 1.43,
      "top": screenSize.height / 4.6,
      "bottom": 0.0,
      "height": screenSize.height / 2.2,
      "width": screenSize.width / 1,
    };
  } else {
    return {
      "right": -(screenSize.width / 3.3),
      "left": screenSize.width / 1.4,
      "top": screenSize.height / 3,
      "bottom": 0.0,
      "height": screenSize.height / 2.8,
      "width": screenSize.width / 1,
    };
  }
}

kBottomBlurEffect(Size screenSize) {
  if (screenSize.width > 1500) {
    return {
      "right": 0.0,
      "left": 0.0,
      "top": 0.0,
      "bottom": 0.0,
      "rotation": 1.0,
      "height": 1.0,
      "width": 1.0,
    };
  } else if (screenSize.width > 1200) {
    return {
      "right": -50.0,
      "left": screenSize.width / 3,
      "top": screenSize.height / 1.4,
      "bottom": -400.0,
      "rotation": -4.0,
      "height": screenSize.height,
      "width": screenSize.width,
    };
  } else if (screenSize.width > 700) {
    return {
      "right": -50.0,
      "left": screenSize.width / 5,
      "top": screenSize.height / 1.4,
      "bottom": -400.0,
      "rotation": -4.0,
      "height": screenSize.height,
      "width": screenSize.width,
    };
  } else {
    return {
      "right": -50.0,
      "left": screenSize.width / 5,
      "top": screenSize.height / 1.3,
      "bottom": -200.0,
      "rotation": -4.0,
      "height": screenSize.height,
      "width": screenSize.width,
    };
  }
}
