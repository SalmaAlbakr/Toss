import 'package:TOSS/screens/toss_timer_screen.dart';
import 'package:flutter/material.dart';
import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:math' as math;

class TossHomeScreen extends StatefulWidget {
  List<String> inputList = [""];
  TossHomeScreen({
    Key? key,
    required this.inputList,
  }) : super(key: key);

  @override
  State<TossHomeScreen> createState() => _TossHomeScreenState();
}

class _TossHomeScreenState extends State<TossHomeScreen>
    with TickerProviderStateMixin {
  TextEditingController controller = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 5),
    vsync: this,
  )..repeat();
  @override
  void dispose() {
    _controller.dispose();
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        child: Form(
          key: formKey,
          child: ListView(
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Hello, Let's Get Started",
                  style: TextStyle(
                    color: Colors.deepPurple,
                    fontSize: 25,
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              SizedBox(
                height: 350,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: widget.inputList.length,
                  itemBuilder: (context, index) {
                    return ScaleAnimation(
                      child: Card(
                        elevation: 5,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                widget.inputList[index],
                                style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                              IconButton(
                                onPressed: () {
                                  setState(
                                    () {
                                      widget.inputList.removeAt(index);
                                    },
                                  );
                                },
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.deepPurple,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    hintText: "Enter your Options here",
                  ),
                  controller: controller,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      Colors.deepPurple,
                    ),
                  ),
                  onPressed: () {
                    setState(
                      () {
                        widget.inputList.add(controller.text);
                        controller.clear();
                      },
                    );
                  },
                  child: const Text(
                    "add",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      Colors.deepPurple,
                    ),
                  ),
                  onPressed: () {
                    setState(
                      () {
                        if (widget.inputList.isEmpty) {
                          Fluttertoast.showToast(
                            msg: "plz enter an options",
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 5,
                            backgroundColor: Colors.grey,
                            textColor: Colors.white,
                            fontSize: 16.0,
                          );
                        } else {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TossTimerScreen(
                               // index: widget.index,
                                inputList: widget.inputList,
                              ),
                            ),
                          );
                        }
                      },
                    );
                  },
                  child: const Text(
                    "Pick",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
