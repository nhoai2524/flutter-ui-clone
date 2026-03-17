import 'package:flutter/material.dart';
import 'package:ui_clone/view.dart';

class AppHeader extends StatelessWidget {
  final String title;
  final bool showBack;

  const AppHeader({super.key, required this.title, this.showBack = true});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          if (showBack)
            HoverIcon(
              onTap: () => Navigator.pop(context),
              child: Image.asset("assets/img/arrow_back.png", width: 20),
            )
          else
            const SizedBox(width: 20),

          const Spacer(),

          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),

          const Spacer(),

          Row(
            children: [
              HoverIcon(
                onTap: () => showLanguageDialog(context),
                child: Image.asset("assets/img/language.png", width: 20),
              ),
              const SizedBox(width: 10),
              HoverIcon(
                onTap: () {},
                child: Image.asset("assets/img/menu.png", width: 20),
              ),
            ],
          ),
        ],
      ),
    );
  }
}


class HoverIcon extends StatefulWidget {
  final Widget child;
  final VoidCallback onTap;

  const HoverIcon({super.key, required this.child, required this.onTap});

  @override
  State<HoverIcon> createState() => _HoverIconState();
}

class _HoverIconState extends State<HoverIcon> {
  bool hover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => hover = true),
      onExit: (_) => setState(() => hover = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedScale(
          scale: hover ? 1.15 : 1,
          duration: const Duration(milliseconds: 150),
          curve: Curves.easeOut,
          child: widget.child,
        ),
      ),
    );
  }
}
