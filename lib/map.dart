import 'package:flutter/material.dart';
import 'frame.dart';
import 'package:ui_clone/widgets/header.dart';
import 'package:ui_clone/widgets/footer.dart';
import 'add1.dart';
import 'add2.dart';
import 'add3.dart';
import 'add4.dart';
import 'add5.dart';
import 'add6.dart';
import 'add7.dart';
import 'add8.dart';
import 'add9.dart';
import 'add10.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  String currentFloor = "bunker";

  final List<Widget> screens = const [
    AudioScreen1(),
    AudioScreen2(),
    AudioScreen3(),
    AudioScreen4(),
    AudioScreen5(),
    AudioScreen6(),
    AudioScreen7(),
    AudioScreen8(),
    AudioScreen9(),
    AudioScreen10(),
  ];

  void _goToScreen(BuildContext context, int number) {
    int index = (number - 1) % 10;

    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => screens[index]),
    );
  }

  /// DATA 
  final Map<String, List<Map<String, dynamic>>> points = {
    "bunker": [
      {"num": 19, "top": 105.0, "left": 220.0},
      {"num": 20, "top": 125.0, "left": 250.0},
      {"num": 21, "top": 135.0, "left": 195.0},
      {"num": 22, "top": 155.0, "left": 180.0},
      {"num": 23, "top": 165.0, "left": 170.0},
      {"num": 24, "top": 180.0, "left": 110.0},
    ],
    "ground": [
      {"num": 25, "top": 185.0, "left": 115.0},
      {"num": 26, "top": 180.0, "left": 135.0},
      {"num": 27, "top": 170.0, "left": 155.0},
      {"num": 28, "top": 140.0, "left": 190.0},
      {"num": 29, "top": 120.0, "left": 140.0},
      {"num": 30, "top": 110.0, "left": 130.0},
      {"num": 31, "top": 145.0, "left": 145.0},
    ],
    "L1": [
      {"num": 1, "top": 110.0, "left": 120.0},
      {"num": 2, "top": 170.0, "left": 150.0},
      {"num": 3, "top": 150.0, "left": 180.0},
      {"num": 4, "top": 140.0, "left": 220.0},
    ],
    "L2": [
      {"num": 5, "top": 195.0, "left": 120.0},
      {"num": 6, "top": 210.0, "left": 135.0},
      {"num": 7, "top": 190.0, "left": 150.0},
      {"num": 8, "top": 155.0, "left": 210.0},
      {"num": 9, "top": 155.0, "left": 250.0},
      {"num": 10, "top": 100.0, "left": 250.0},
      {"num": 11, "top": 140.0, "left": 120.0},
      {"num": 12, "top": 110.0, "left": 100.0},
    ],
    "L3": [
      {"num": 13, "top": 195.0, "left": 130.0},
      {"num": 14, "top": 170.0, "left": 140.0},
      {"num": 15, "top": 155.0, "left": 180.0},
      {"num": 16, "top": 140.0, "left": 210.0},
    ],
    "L4": [
      {"num": 17, "top": 150.0, "left": 180.0},
      {"num": 18, "top": 90.0, "left": 100.0},
    ],
  };

  final floors = ["bunker", "ground", "L1", "L2", "L3", "L4"];

  final TransformationController _controller = TransformationController();

  @override
  void initState() {
    super.initState();

    _controller.addListener(() {
      setState(() {});
    });
  }

  double _getScale() {
    return _controller.value.getMaxScaleOnAxis();
  }

  @override
  Widget build(BuildContext context) {
    return AppFrame(
      child: Material(
        color: Colors.white,
        child: Column(
          children: [
            const AppHeader(title: "Bản đồ"),

            /// MAP (GIỮ NGUYÊN)
            Expanded(
              child: Center(
                child: InteractiveViewer(
                  transformationController: _controller,
                  minScale: 1,
                  maxScale: 4,
                  child: SizedBox(
                    width: 300,
                    height: 300,
                    child: Stack(
                      children: [
                        Positioned.fill(
                          child: Image.asset(
                            "assets/img/$currentFloor.png",
                            fit: BoxFit.contain,
                          ),
                        ),

                        ...points[currentFloor]!.map((p) {
                          return Positioned(
                            top: p["top"],
                            left: p["left"],
                            child: Transform(
                              alignment: Alignment.center,
                              transform: Matrix4.identity()
                                ..scale(1 / _getScale()),
                              child: _point(p["num"]),
                            ),
                          );
                        }).toList(),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            /// FLOOR 
            Container(
              height: 50,
              color: Colors.black,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: floors.map((floor) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        currentFloor = floor;
                        _controller.value = Matrix4.identity();
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.map, color: Colors.white),
                        const SizedBox(height: 3),
                        Text(
                          floor,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),

            const AppFooter(),
          ],
        ),
      ),
    );
  }

  Widget _point(int number) {
    return GestureDetector(
      onTap: () {
        _goToScreen(context, number); 
      },
      child: Container(
        width: 18,
        height: 18,
        decoration: const BoxDecoration(
          color: Colors.red,
          shape: BoxShape.circle,
        ),
        alignment: Alignment.center,
        child: Text(
          "$number",
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 10,
          ),
        ),
      ),
    );
  }
}