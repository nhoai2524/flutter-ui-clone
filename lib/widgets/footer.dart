import 'package:flutter/material.dart';
import 'package:ui_clone/search.dart';
import 'package:ui_clone/map.dart';
import 'package:ui_clone/view.dart';


class AppFooter extends StatelessWidget {
  const AppFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      color: Colors.red,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          BottomItem("assets/img/list.png", "Danh sách",
          onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const TourScreen(),
                ),
              );
            },),

          BottomItem(
            "assets/img/keyboard.png",
            "Bàn phím",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const SearchScreen(),
                ),
              );
            },
          ),

          BottomItem("assets/img/map.png", "Bản đồ",
          onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const MapScreen(),
                ),
              );
            },),
        ],
      ),
    );
  }
}


class BottomItem extends StatefulWidget {
  final String icon;
  final String title;
  final VoidCallback? onTap;

  const BottomItem(this.icon, this.title, {this.onTap, super.key});

  @override
  State<BottomItem> createState() => _BottomItemState();
}

class _BottomItemState extends State<BottomItem> {
  bool hover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => hover = true),
      onExit: (_) => setState(() => hover = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedScale(
          scale: hover ? 1.1 : 1,
          duration: const Duration(milliseconds: 150),
          curve: Curves.easeOut,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                widget.icon,
                width: 22,
              ),
              const SizedBox(height: 4),
              Text(
                widget.title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}