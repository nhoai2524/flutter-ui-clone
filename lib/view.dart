import 'package:flutter/material.dart';
import 'frame.dart';
import 'package:ui_clone/widgets/header.dart';
import 'package:ui_clone/widgets/footer.dart';
import 'ddl.dart';
import 'tl.dart';

class TourScreen extends StatelessWidget {
  const TourScreen({super.key});

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

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(10),
      children: [
        /// ITEM 1
        TourItem(
          image: "assets/img/place.jpg",
          title: "0 - DINH ĐỘC LẬP",
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const DetailDDL(),
              ),
            );
          },
        ),

        const SizedBox(height: 10),

        /// ITEM 2
        TourItem(
          image: "assets/img/place2.jpg",
          title: "1 - TÒA NHÀ TRIỂN LÃM",
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const DetailTL(), 
              ),
            );
          },
        ),
      ],
    );
  }
}

void showLanguageDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierColor: Colors.black54,
    builder: (_) {
      return const _LanguageDialog();
    },
  );
}

class _LanguageDialog extends StatelessWidget {
  const _LanguageDialog();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TweenAnimationBuilder(
        duration: const Duration(milliseconds: 250),
        tween: Tween(begin: 0.9, end: 1.0),
        curve: Curves.easeOut,
        builder: (context, scale, child) {
          return Transform.scale(scale: scale, child: child);
        },
        child: Material(
          color: Colors.transparent,
          child: Container(
            width: 220,
            constraints: const BoxConstraints(maxHeight: 350),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: const [
                Padding(
                  padding: EdgeInsets.all(12),
                  child: Text(
                    "Chọn ngôn ngữ",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ),
                Divider(height: 1),
                Expanded(child: _LanguageList()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _LanguageList extends StatelessWidget {
  const _LanguageList();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        LanguageItem("Chinese", "assets/img/china.png"),
        LanguageItem("English", "assets/img/english.png"),
        LanguageItem("French", "assets/img/france.png"),
        LanguageItem("German", "assets/img/german.png"),
        LanguageItem("Japanese", "assets/img/japan.png"),
        LanguageItem("Vietnamese", "assets/img/vietnam.png"),
      ],
    );
  }
}

class LanguageItem extends StatefulWidget {
  final String name;
  final String icon;

  const LanguageItem(this.name, this.icon, {super.key});

  @override
  State<LanguageItem> createState() => _LanguageItemState();
}

class _LanguageItemState extends State<LanguageItem> {
  bool hover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => hover = true),
      onExit: (_) => setState(() => hover = false),
      child: InkWell(
        onTap: () => Navigator.pop(context),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          curve: Curves.easeOut,
          color: hover ? Colors.grey.shade100 : Colors.transparent,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          child: Row(
            children: [
              AnimatedScale(
                scale: hover ? 1.1 : 1,
                duration: const Duration(milliseconds: 180),
                child: Image.asset(widget.icon, width: 26),
              ),
              const SizedBox(width: 12),
              Text(
                widget.name,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: hover ? FontWeight.w600 : FontWeight.normal,
                  decoration: TextDecoration.none,
                ),
              ),
            ],
          ),
        ),
      ),
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