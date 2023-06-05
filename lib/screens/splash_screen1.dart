import 'dart:async';
import 'dart:math' as math;
import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:first_app/screens/toss_home_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {

  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 5),
    vsync: this,
  )..repeat();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }


  Widget latterT = Text("");
  Widget latterO = Text("");
  Widget latterS = Text("");
  Widget lastS   = Text("");

  void initState() {
    super.initState();

    Timer(const Duration(seconds: 1), () {
      setState(() {
        latterT = ScaleAnimation(
          duration: Duration(seconds: 1),
          child: Text(
            "T",
            style: TextStyle(fontSize: 100, fontWeight: FontWeight.bold,color: Colors.white),
          ),
        );
      });
    });
    Timer(const Duration(seconds: 1), () {
      setState(() {
        latterO = ScaleAnimation(
          duration: Duration(seconds: 1),
          child: Text(
            "O",
            style: TextStyle(fontSize: 100, fontWeight: FontWeight.bold,color: Colors.white),
          ),
        );
      });
    });
    Timer(const Duration(seconds: 1), () {
      setState(() {
        latterS = ScaleAnimation(
          duration: Duration(seconds: 1),
          child: AnimatedBuilder(
            animation: _controller,
            child: Text("\$" , style:TextStyle(fontSize: 100, fontWeight: FontWeight.bold,color: Colors.white) ),
            builder: (BuildContext context, Widget? child) {
              return Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001)
                  ..rotateY(
                    _controller.value * (-math.pi),
                  ),
                child: child,
              );
            },
          ),
        );
      });
    });
    Timer(const Duration(seconds: 3), () {
      setState(() {
        lastS = ScaleAnimation(
          duration: Duration(seconds: 1),
          child: AnimatedBuilder(
            animation: _controller,
            child: Text("\$" , style:TextStyle(fontSize: 100, fontWeight: FontWeight.bold,color: Colors.white) ),
            builder: (BuildContext context, Widget? child) {
              return Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001)
                  ..rotateY(
                    _controller.value * (-math.pi),
                  ),
                child: child,
              );
            },
          ),
        );
      });
    });
    Timer(Duration(seconds: 5) , () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (BuildContext context) {
            return TossHomeScreen(inputList: [],);
          },
        ),
      );
    },);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[400],
      body: SafeArea(

        child: Center(
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                latterT,
                latterO,
                latterS,
                lastS,

              ],
            ),
          ),
        ),
      ),
    );
  }
}
