import 'package:flutter/material.dart';
import 'view.dart';
import 'frame.dart';
import 'map.dart';

class Detail extends StatefulWidget {
  const Detail({super.key});

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  final ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double cardWidth = width < 600 ? 320 : 360;

    double imageHeight = 220;

    ///  title
    double offset = controller.hasClients ? controller.offset : 0;

    double titleTop = imageHeight - 20 - offset;
    if (titleTop < 0) titleTop = 0;

    bool isScroll = offset > imageHeight - 40;

    return Scaffold(
      body: AppFrame(
        child: Stack(
          children: [
            /// BACKGROUND
            Positioned.fill(
              child: Image.asset("assets/img/bg.webp", fit: BoxFit.cover),
            ),

            /// CARD
            Center(
              child: Container(
                width: cardWidth,
                height: 650,
                color: Colors.white,

                child: Stack(
                  children: [
                    /// SCROLL CONTENT
                    NotificationListener<ScrollUpdateNotification>(
                      onNotification: (notification) {
                        setState(() {});
                        return true;
                      },
                      child: SingleChildScrollView(
                        controller: controller,
                        child: Column(
                          children: [
                            /// IMAGE
                            Image.asset(
                              "assets/img/place.jpg",
                              height: imageHeight,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),

                            const SizedBox(height: 40),

                            /// TEXT
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              child: Text(
                                "Dinh Độc Lập là một trong những địa điểm lịch sử nổi "
                                "tiếng tại Thành phố Hồ Chí Minh. Nơi đây từng là "
                                "phủ tổng thống của Việt Nam Cộng hòa trước năm 1975.\n\n"
                                "Ngày nay, Dinh Độc Lập trở thành một di tích lịch "
                                "sử quan trọng và thu hút nhiều du khách trong và "
                                "ngoài nước đến tham quan.\n\n"
                                "Du khách khi đến đây có thể tìm hiểu về lịch sử, "
                                "tham quan các phòng họp, phòng làm việc và nhiều "
                                "hiện vật lịch sử được lưu giữ tại đây.\n\n"
                                "Đây cũng là nơi gắn liền với sự kiện ngày "
                                "30/04/1975 – thời điểm kết thúc chiến tranh "
                                "và thống nhất đất nước.\n\n"
                                "Ngày nay, Dinh Độc Lập trở thành một trong những "
                                "địa điểm du lịch không thể thiếu của mỗi người "
                                "dân khi tới Thành phố Hồ Chí Minh. Không chỉ có "
                                "ý nghĩa về lịch sử mà Dinh Độc Lập còn thể hiện "
                                "nét kiến trúc tiêu biểu của Việt Nam thời kì "
                                "những thập niên 60.\n\n"
                                "Ngoài ra, Dinh Độc Lập thường là nơi diễn ra "
                                "các sự kiện lớn tổ chức tại thành phố, các buổi "
                                "tiếp khách của Đảng, Nhà nước tại TPHCM cũng như "
                                "chính quyền thành phố.\n\n"
                                "Đồng thời là nơi tổ chức quốc tang cho các lãnh "
                                "đạo Đảng, Nhà nước ở TPHCM và là điểm dừng cuối "
                                "cùng của giải đua Cúp Truyền Hình HTV hàng năm.",

                                textAlign: TextAlign.justify,
                                style: TextStyle(fontSize: 15, height: 1.6),
                              ),
                            ),

                            const SizedBox(height: 120),
                          ],
                        ),
                      ),
                    ),

                    /// TITLE BOX
                    Positioned(
                      top: titleTop,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: Container(
                          width: cardWidth * 0.55,
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          decoration: BoxDecoration(
                            color: isScroll ? Colors.black : Colors.white,
                            border: Border.all(color: Colors.grey),
                          ),
                          child: Text(
                            "DINH ĐỘC LẬP",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: isScroll ? Colors.white : Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),

                    /// MAP ICON
                    Positioned(
                      bottom: 80,
                      right: 20,
                      child: Container(
                        width: 45,
                        height: 45,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: const [
                            BoxShadow(color: Colors.black26, blurRadius: 6),
                          ],
                        ),
                        child: Center(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const MapScreen(),
                                ),
                              );
                            },
                            child: Image.asset(
                              "assets/img/map.png",
                              width: 22,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),

                    /// BUTTONS
                    Positioned(
                      bottom: 15,
                      left: 15,
                      right: 15,
                      child: Row(
                        children: [
                          /// DOWNLOAD
                          Expanded(
                            child: Container(
                              height: 48,
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: TextButton.icon(
                                onPressed: () {},
                                icon: Image.asset(
                                  "assets/img/download.png",
                                  width: 20,
                                  color: Colors.white,
                                ),
                                label: const Text(
                                  "Tải xuống",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(width: 10),

                          /// START
                          Expanded(
                            child: Container(
                              height: 48,
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: TextButton.icon(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const TourScreen(),
                                    ),
                                  );
                                },
                                icon: Image.asset(
                                  "assets/img/start.png",
                                  width: 20,
                                  color: Colors.white,
                                ),
                                label: const Text(
                                  "Tham quan",
                                  style: TextStyle(color: Colors.white),
                                ),
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
          ],
        ),
      ),
    );
  }
}
