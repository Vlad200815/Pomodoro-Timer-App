import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:timer_button/timer_button.dart';

// ignore: must_be_immutable
class MyButtonWaite extends StatelessWidget {
  final String label;
  final int timeOutInSeconds;
  var player = AudioPlayer();
  final VoidCallback onPressed;
  MyButtonWaite(
      {super.key,
      required this.onPressed,
      required this.label,
      required this.timeOutInSeconds});

  @override
  Widget build(BuildContext context) {
    return TimerButton(
      buttonType: ButtonType.outlinedButton,
      disabledColor: Color.fromARGB(255, 128, 24, 255),
      color: Colors.deepPurple,
      activeTextStyle: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
      label: label,
      timeOutInSeconds: timeOutInSeconds,
      onPressed: onPressed,
    );
  }
}
