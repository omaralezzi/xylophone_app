import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Xylophone App'),
        ),
        body: Column(
          children: [
            buildClickableContainer(Colors.red, 1),
            buildClickableContainer(Colors.orange, 2),
            buildClickableContainer(Colors.yellow, 3),
            buildClickableContainer(Colors.green, 4),
            buildClickableContainer(Colors.blue, 5),
            buildClickableContainer(Colors.indigo, 6),
            buildClickableContainer(Colors.purple, 7),
          ],
        ),
      ),
    );
  }

  Widget buildClickableContainer(Color color, int number) {
    return Expanded(
      child: GestureDetector(
        onTap: () => playAudio(number),
        child: Container(
          color: color,
          child: Center(
            child: Text(
              '$number',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }

  void playAudio(int noteNumber) {
    final player = AudioPlayer();
    final audioPath = 'note$noteNumber.wav';
    player.play(AssetSource(audioPath));
  }
}
