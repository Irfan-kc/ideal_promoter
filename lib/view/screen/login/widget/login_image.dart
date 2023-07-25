import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        constraints: const BoxConstraints(
          maxHeight: 310,
        ),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/stunning_3D_cartoon.png'),
          ),
        ),
      ),
    );
  }
}
