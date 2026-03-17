import 'package:flutter/material.dart';
import 'frame.dart';
import 'package:ui_clone/widgets/header.dart';
import 'package:ui_clone/widgets/footer.dart';

// IMPORT SCREEN
import 'add1.dart';
import 'add2.dart';
import 'add3.dart';
import 'add4.dart';
import 'add5.dart';

class DetailDDL extends StatelessWidget {
  const DetailDDL({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppFrame(
        child: Column(
          children: [
            AppHeader(title: "1 - DINH ĐỘC LẬP"),
            Expanded(child: _TourList()),
            AppFooter(),
          ],
        ),
      ),
    );
  }
}

class _TourList extends StatelessWidget {
  const _TourList();

  final List<Widget> _screens = const [
    AudioScreen1(),
    AudioScreen2(),
    AudioScreen3(),
    AudioScreen4(),
    AudioScreen5(),
  ];

  void _goToScreen(BuildContext context, int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => _screens[index],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(10),
      children: [
        TourItem(
          image: "assets/img/add1.jpg",
          title: "1 - Phòng Nội các",
          onTap: () => _goToScreen(context, 0),
        ),
        const SizedBox(height: 10),

        TourItem(
          image: "assets/img/add2.jpg",
          title: "2 - Phòng Đại yến",
          onTap: () => _goToScreen(context, 1),
        ),
        const SizedBox(height: 10),

        TourItem(
          image: "assets/img/add3.jpg",
          title: "3 - Cầu thang trung tâm",
          onTap: () => _goToScreen(context, 2),
        ),
        const SizedBox(height: 10),

        TourItem(
          image: "assets/img/add4.jpg",
          title: "4 - Phòng Khánh tiết",
          onTap: () => _goToScreen(context, 3),
        ),
        const SizedBox(height: 10),

        TourItem(
          image: "assets/img/add5.jpg",
          title: "5 - Phòng Hội đồng An ninh Quốc gia",
          onTap: () => _goToScreen(context, 4),
        ),
      ],
    );
  }
}

class TourItem extends StatefulWidget {
  final String image;
  final String title;
  final VoidCallback? onTap;

  const TourItem({
    super.key,
    required this.image,
    required this.title,
    this.onTap,
  });

  @override
  State<TourItem> createState() => _TourItemState();
}

class _TourItemState extends State<TourItem> {
  bool hover = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector( 
      onTap: widget.onTap,
      child: MouseRegion(
        onEnter: (_) => setState(() => hover = true),
        onExit: (_) => setState(() => hover = false),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOut,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            boxShadow: hover
                ? [BoxShadow(color: Colors.black26, blurRadius: 12)]
                : [],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Stack(
              children: [
                AnimatedScale(
                  scale: hover ? 1.05 : 1,
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.easeOut,
                  child: Image.asset(
                    widget.image,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 12,
                    ),
                    color: Colors.red,
                    child: Text(
                      widget.title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}