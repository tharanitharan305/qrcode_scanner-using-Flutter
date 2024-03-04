import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class welcome extends StatefulWidget {
  welcome({required this.text, required this.text2, required this.text3});
  String text;
  String text2;
  String text3;
  State<welcome> createState() => welcomeState();
}

class welcomeState extends State<welcome> {
  var colorizeColors = [
    Colors.purple,
    Colors.blue,
    Colors.yellow,
    Colors.red,
  ];

  var colorizeTextStyle = TextStyle(
    fontFamily: 'Horizon',
  );
  Widget build(context) {
    return AnimatedTextKit(
      animatedTexts: [
        FlickerAnimatedText(
          widget.text,
          textStyle: const TextStyle(
            fontSize: 32.0,
            fontWeight: FontWeight.bold,
          ),
          // speed: const Duration(milliseconds: 2000),
        ),
        WavyAnimatedText(
            speed: Duration(milliseconds: 300),
            widget.text,
            textStyle:
                GoogleFonts.lexend(fontWeight: FontWeight.bold, fontSize: 32)),
        ColorizeAnimatedText(widget.text,
            textStyle: GoogleFonts.orbitron(
                fontSize: 50.0, fontWeight: FontWeight.bold),
            colors: colorizeColors),
        FadeAnimatedText(
          widget.text,
          textStyle: const TextStyle(
            fontSize: 32.0,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
      repeatForever: true,
      pause: const Duration(milliseconds: 100),
      displayFullTextOnTap: true,
      stopPauseOnTap: true,
    );
  }
}
