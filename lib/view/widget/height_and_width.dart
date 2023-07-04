import 'package:flutter/material.dart';

class ConstHeight extends StatelessWidget {
  final double height;
  const ConstHeight(
    this.height, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
    );
  }
}

class ConstWidth extends StatelessWidget {
  final double width;
  const ConstWidth(
    this.width, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
    );
  }
}
