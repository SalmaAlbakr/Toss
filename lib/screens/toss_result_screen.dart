import 'package:first_app/screens/toss_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:dart_random_choice/dart_random_choice.dart';
import 'package:animation_wrappers/animation_wrappers.dart';
import 'dart:math' as math;
import 'package:shape_of_view_null_safe/shape_of_view_null_safe.dart';

class TossResultScreen extends StatefulWidget {
  final List<String> inputList;
  const TossResultScreen({
    required this.inputList, Key? key})
      : super(key: key);

  @override
  State<TossResultScreen> createState() => _TossResultScreenState();
}

class _TossResultScreenState extends State<TossResultScreen>
    with TickerProviderStateMixin {

  List<Widget> anotherWidget = [
    const CircleAvatar(
      radius: 150,
      backgroundColor: Colors.white,
    ),
    PhysicalShape(
      elevation: 5.0,
      clipper: ShapeBorderClipper(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      color: Colors.white,
      child: const SizedBox(
        height: 300,
        width: 300,
      ),
    ),
    ShapeOfView(
      height: 300,
      width: 300,
      shape: PolygonShape(numberOfSides: 9),
      child: Container(
        color: Colors.white,
      ),
    ),
    ShapeOfView(
      height: 300,
      width: 300,
      shape: BubbleShape(
          position: BubblePosition.Bottom,
          arrowPositionPercent: 0.5,
          borderRadius: 20,
          arrowHeight: 10,
          arrowWidth: 10),
      child: Container(
        color: Colors.white,
      ),
    ),
  ];


  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 5),
    vsync: this,
  )..repeat();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    Widget randomWidget = randomChoice(anotherWidget);
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent[100],
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[400],
        title: Row(
          children: [
            const Text(
              "T",
              style: TextStyle(
                fontSize: 40,
                color: Colors.white,
              ),
            ),
            const Text(
              "O",
              style: TextStyle(
                fontSize: 40,
                color: Colors.white,
              ),
            ),
            AnimatedBuilder(
              animation: _controller,
              child: const Text(
                "\$",
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.white,
                ),
              ),
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
            AnimatedBuilder(
              animation: _controller,
              child: const Text(
                "\$",
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.white,
                ),
              ),
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
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Your Result is :",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
            ),

            ScaleAnimation(
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  randomWidget,
                  Center(
                    child: SizedBox(
                      height: 250,
                      width: 250,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 250,
                            width: 250,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  randomChoice(widget.inputList),
                                  maxLines: 5,
                                  style: const TextStyle(
                                    color: Colors.deepPurple,
                                    fontSize: 50,
                                    overflow: TextOverflow.ellipsis,
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        Colors.white,
                      ),
                    ),
                    onPressed: () {
                      widget.inputList.clear();
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TossHomeScreen(inputList: [],

                          ),
                        ),
                      );
                    },
                    child: const Text(
                      "Try New One",
                      style: TextStyle(
                        color: Colors.deepPurple,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.white),
                    ),
                    onPressed: () {
                      setState(
                        () {
                          randomChoice(widget.inputList);
                          randomWidget = randomChoice(anotherWidget);
                        },
                      );
                    },
                    child: const Text(
                      "Another choice",
                      style: TextStyle(
                        color: Colors.deepPurple,
                        fontSize: 20,
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
