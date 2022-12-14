import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class MyPixel extends StatelessWidget {
  final color;
  final child;
  MyPixel({this.color, this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Container(
            color: color,
            child: Center(
              child: child,
            ),
          )),
    );
  }
}
