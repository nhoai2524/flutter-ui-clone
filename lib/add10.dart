import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'frame.dart';

class AudioScreen10 extends StatefulWidget {
  const AudioScreen10({super.key});

  @override
  State<AudioScreen10> createState() => _AudioScreenState10();
}

class _AudioScreenState10 extends State<AudioScreen10> {
  final player = AudioPlayer();

  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  @override
  void initState() {
    super.initState();

    player.setAsset("assets/img/audio.mp3");

    player.durationStream.listen((d) {
      if (d != null) duration = d;
    });

    player.positionStream.listen((p) {
      setState(() => position = p);
    });
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  String formatTime(Duration d) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final m = twoDigits(d.inMinutes.remainder(60));
    final s = twoDigits(d.inSeconds.remainder(60));
    return "$m:$s";
  }

  @override
  Widget build(BuildContext context) {
    return AppFrame(
      child: Material(
        color: Colors.white,
        child: Column(
          children: [
            /// HEADER
            Container(
              height: 50,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back),
                  ),
                  const SizedBox(width: 5),
                  const Expanded(
                    child: Text(
                      "10 - Phòng An ninh",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),

            /// IMAGE
            Expanded(
              child: Image.asset(
                "assets/img/add10.jpg",
                width: double.infinity,
                height: 750,
              ),
            ),

            /// AUDIO
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Row(
                children: [
                  /// PLAY / PAUSE
                  StreamBuilder<PlayerState>(
                    stream: player.playerStateStream,
                    builder: (context, snapshot) {
                      final playing = snapshot.data?.playing ?? false;

                      return IconButton(
                        icon: Icon(
                          playing ? Icons.pause : Icons.play_arrow,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          if (playing) {
                            player.pause();
                          } else {
                            player.play();
                          }
                        },
                      );
                    },
                  ),

                  /// TIME (GỘP)
                  Text(
                    "${formatTime(position)}/${formatTime(duration)}",
                    style: const TextStyle(fontSize: 13, color: Colors.black),
                  ),

                  const SizedBox(width: 8),

                  /// SLIDER
                  Expanded(
                    child: SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        trackHeight: 3,
                        activeTrackColor: Colors.grey,
                        inactiveTrackColor: Colors.grey.shade300,
                        thumbColor: Colors.black,
                        overlayColor: Colors.black12,
                        thumbShape: const RoundSliderThumbShape(
                          enabledThumbRadius: 6,
                        ),
                      ),
                      child: Slider(
                        min: 0,
                        max: duration.inSeconds.toDouble() == 0
                            ? 1
                            : duration.inSeconds.toDouble(),
                        value: position.inSeconds
                            .clamp(0, duration.inSeconds)
                            .toDouble(),
                        onChanged: (value) {
                          player.seek(Duration(seconds: value.toInt()));
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
