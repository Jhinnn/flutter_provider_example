import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ColorWidget extends StatelessWidget {
  final Color textColor;
  final Color? bgColor;
  final Color? borderColor;
  const ColorWidget(
      {super.key, required this.textColor, this.bgColor = Colors.black, this.borderColor = Colors.white38});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
    
      decoration: BoxDecoration(color: bgColor,border: Border.all(width: 10,color: borderColor!)),
      child: Center(
          child: Text(
        'Container',
        style: TextStyle(color: textColor),
      )),
    );
  }
}
