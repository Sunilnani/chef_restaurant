import 'package:flutter/material.dart';

class LDFilledButton extends StatelessWidget {
  const LDFilledButton({
    Key? key,
    this.child,
    this.color,
    this.textColor,
    this.disabledColor,
    required this.onPressed,
    this.shape,
    this.elevation,
    this.padding,
    this.minWidth = 88,
    this.height = 40,
    this.radius = 6,
  }) : super(key: key);

  final Function()? onPressed;
  final Widget? child;
  final Color? color;
  final Color? disabledColor;
  final Color? textColor;
  final OutlinedBorder? shape;
  final double? elevation;
  final EdgeInsets? padding;
  final double minWidth;
  final double height;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(

      style: ElevatedButton.styleFrom(
        padding: padding,
        backgroundColor: color,
        disabledBackgroundColor: disabledColor,
        shape: shape ?? RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
        elevation: elevation,
        textStyle: TextStyle(color: textColor),
        minimumSize: Size(minWidth, height),
      ),
      onPressed: onPressed,
      child: child,
    );
  }
}
