import "package:flutter/material.dart";
class BackgroundCircle extends StatefulWidget {
  const BackgroundCircle({Key? key, required this.circleWidth, required this.borderColor, required this.borderWidth}) : super(key: key);
  final double circleWidth;
  final Color borderColor;
  final double borderWidth;

  @override
  State<BackgroundCircle> createState() => _BackgroundCircleState();
}

class _BackgroundCircleState extends State<BackgroundCircle> {
  @override
  Widget build(BuildContext context) {
    return Container (
      width: widget.circleWidth,
      height: widget.circleWidth,
      decoration: BoxDecoration(

        shape: BoxShape.circle,
        border: Border.all(width:widget.borderWidth ,color: widget.borderColor)
      ),
    );
  }
}

