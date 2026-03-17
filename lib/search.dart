import 'package:flutter/material.dart';
import 'frame.dart';
import 'package:ui_clone/widgets/header.dart';
import 'package:ui_clone/widgets/footer.dart';
import 'audio.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String input = "";

  void onNumberTap(String number) {
    setState(() {
      if (input.length < 6) {
        input += number;
      }
    });
  }

  void onDelete() {
    setState(() {
      if (input.isNotEmpty) {
        input = input.substring(0, input.length - 1);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppFrame(
        child: Column(
          children: [
            /// HEADER 
            const AppHeader(title: "P01"),

            /// BODY
            Expanded(
              child: Container(
                color: const Color(0xFFDCE5EB), 
                child: Column(
                  children: [
                    const SizedBox(height: 20),

                    /// TEXT
                    const Text(
                      "Enter the keycode of the content you want to see",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 30),

                    /// DISPLAY NUMBER
                    Text(
                      input,
                      style: const TextStyle(
                        fontSize: 40,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const Spacer(),

                    /// KEYPAD
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          buildRow(["1", "2", "3"]),
                          buildRow(["4", "5", "6"]),
                          buildRow(["7", "8", "9"]),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const SizedBox(width: 80),
                              buildButton("0"),
                              buildDeleteButton(),
                            ],
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 15),

                    InkWell(
                      onTap: () {
                        if (input == "00") {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const AudioScreen(),
                            ),
                          );
                        }
                      },
                      child: Container(
                        width: double.infinity,
                        color: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: const Center(
                          child: Text(
                            "Ok",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const AppFooter(),
          ],
        ),
      ),
    );
  }


  Widget buildRow(List<String> numbers) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: numbers.map((e) => buildButton(e)).toList(),
      ),
    );
  }

  Widget buildButton(String number) {
    return GestureDetector(
      onTap: () => onNumberTap(number),
      child: Container(
        width: 80,
        height: 45,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Center(
          child: Text(number, style: const TextStyle(fontSize: 18)),
        ),
      ),
    );
  }

  Widget buildDeleteButton() {
    return GestureDetector(
      onTap: onDelete,
      child: Container(
        width: 80,
        height: 45,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
        ),
        child: const Center(child: Icon(Icons.backspace)),
      ),
    );
  }
}
