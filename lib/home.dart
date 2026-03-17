import 'package:flutter/material.dart';
import 'detail.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    double cardWidth = width < 600 ? 320 : 360;

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset("assets/img/bg.webp", fit: BoxFit.cover),
          ),

          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 40),
              child: AspectRatio(
                aspectRatio: 9 / 19.5,
                child: Container(
                  width: cardWidth,
                  color: const Color.fromARGB(255, 255, 249, 249),

                  child: Column(
                    children: [
                      const SizedBox(height: 20),

                      /// logo
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 0),
                        width: double.infinity,
                        child: Image.asset(
                          "assets/img/logo.png",
                          fit: BoxFit.contain,
                        ),
                      ),
                      const SizedBox(height: 0),

                      Expanded(
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            /// image
                            Positioned.fill(
                              child: Image.asset(
                                "assets/img/place.jpg",
                                fit: BoxFit.cover,
                              ),
                            ),

                            /// button
                            Positioned(
                              bottom: 50, 
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.red,
                                  shape: const CircleBorder(),
                                  padding: const EdgeInsets.all(16), 
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const Detail(),
                                    ),
                                  );
                                },
                                child: const Icon(
                                  Icons.arrow_forward,
                                  size: 22, 
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
