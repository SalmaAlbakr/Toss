import 'dart:async';
import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:TOSS/screens/toss_result_screen.dart';
import 'package:flutter/material.dart';

class TossTimerScreen extends StatefulWidget {
  final List<String> inputList;
  const TossTimerScreen({
    required this.inputList, Key? key})
      : super(key: key);

  @override
  State<TossTimerScreen> createState() => _TossTimerScreenState();
}

class _TossTimerScreenState extends State<TossTimerScreen> {
  Widget time = ScaleAnimation(
    duration: const Duration(seconds: 1),
    child: const Text(
      "3",
      style: TextStyle(
        fontSize: 100,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
  );
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 2),
      () {
        setState(
          () {
            time = FadedScaleAnimation(
              scaleDuration: const Duration(seconds: 1),
              child: const Text(
                "2",
                style: TextStyle(
                  fontSize: 100,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            );
          },
        );
      },
    );
    Timer(
      const Duration(seconds: 3),
      () {
        setState(
          () {
            time = ScaleAnimation(
              duration: const Duration(seconds: 1),
              child: const Text(
                "1",
                style: TextStyle(
                  fontSize: 100,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            );
          },
        );
      },
    );
    Timer(
      const Duration(seconds: 5),
      () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (BuildContext context) {
              return TossResultScreen(
                inputList: widget.inputList,
              );
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircleAvatar(
          backgroundColor: Colors.deepPurple[400],
          radius: 100,
          child: time,
        ),
      ),
    );
  }
}
