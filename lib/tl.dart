import 'package:flutter/material.dart';
import 'frame.dart';
import 'package:ui_clone/widgets/header.dart';
import 'package:ui_clone/widgets/footer.dart';
import 'add6.dart';
import 'add7.dart';
import 'add8.dart';
import 'add9.dart';
import 'add10.dart';

class DetailTL extends StatelessWidget {
  const DetailTL({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppFrame(
        child: Column(
          children: [
            AppHeader(title: "2 - TÒA NHÀ TRIỂN LÃM"),
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
    AudioScreen6(),
    AudioScreen7(),
    AudioScreen8(),
    AudioScreen9(),
    AudioScreen10(),
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
          image: "assets/img/add6.jpg",
          title: "6 - Phòng làm việc của Tổng thống",
          onTap: () => _goToScreen(context, 0),
        ),
        const SizedBox(height: 10),

        TourItem(
          image: "assets/img/add7.jpg",
          title: "7 - Phòng tiếp khách của Phó Tổng thống",
          onTap: () => _goToScreen(context, 1),
        ),
        const SizedBox(height: 10),

        TourItem(
          image: "assets/img/add8.jpg",
          title: "8 - Phòng trình Quốc thư",
          onTap: () => _goToScreen(context, 2),
        ),
        const SizedBox(height: 10),

        TourItem(
          image: "assets/img/add9.jpg",
          title: "9 - Thông tin liên lạc",
          onTap: () => _goToScreen(context, 3),
        ),
        const SizedBox(height: 10),

        TourItem(
          image: "assets/img/add10.jpg",
          title: "10 - Phòng An ninh",
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