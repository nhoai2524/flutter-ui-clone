import 'package:flutter/material.dart';

class AppFrame extends StatelessWidget {
  final Widget child;

  const AppFrame({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double cardWidth = width < 600 ? 320 : 360;

    return Stack(
      children: [

        /// BACKGROUND
        Positioned.fill(
          child: Image.asset(
            "assets/img/bg.webp",
            fit: BoxFit.cover,
          ),
        ),
        /// CONTENT
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 40),
            child: AspectRatio(
              aspectRatio: 9 / 19.5,
              child: Container(
                width: cardWidth,
                color: Colors.white,
                child: child,
              ),
            ),
          ),
        ),
      ],
    );
  }
}