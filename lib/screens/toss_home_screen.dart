import 'package:TOSS/model/color_model.dart';
import 'package:TOSS/screens/change_color.dart';
import 'package:TOSS/screens/toss_timer_screen.dart';
import 'package:flutter/material.dart';
import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:easy_localization/easy_localization.dart';
import 'dart:math' as math;
import 'package:easy_localization/easy_localization.dart';

class TossHomeScreen extends StatefulWidget {
  List<String> inputList = [""];
  Color AppColor = Colors.black ;
  TossHomeScreen({
    Key? key,
    required this.inputList,
    required this.AppColor,
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
        backgroundColor:
        //widget.AppColor
        Colors.deepPurple[400]
        ,
        title: Row(
          children: [
            Text("AppName".tr() , style: TextStyle(fontSize: 40),),
            Expanded(child: SizedBox()),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.white),
              ),
                clipBehavior: Clip.hardEdge,
                onPressed: (){
              //   Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => ChangeColor()));

              if (context.locale == Locale('ar')){

                context.setLocale(Locale('en'));
              } else{
                context.setLocale(Locale('ar'));
              }
            }, child: Text("Lang".tr(),style: TextStyle(color: Colors.black),)),
          ],
        ),

      ),
      body: SafeArea(
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.85,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                       // context.tr("StartText")
                      "StartText".tr()

                     // "Hello, Let's Get Started"
                      ,
                      style: TextStyle(
                        color: Colors.deepPurple,
                        fontSize: 25,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Expanded(

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
                      style: TextStyle(
                        color: Colors.deepOrange
                      ),

                      textInputAction: TextInputAction.next,
                      decoration:  InputDecoration(

                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.deepPurpleAccent
                          ) ,
                            borderRadius: BorderRadius.circular(50.0)
                        ),

                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.deepPurpleAccent,
                          ),
                        ),


                        hintText: "TextFieldText".tr(),
                      ),
                      controller: controller,
                    ),
                  ),


                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
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
                        child:  Text(
                          "Add".tr(),
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
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
                                  msg: "ToastText".tr(),
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
                                      AppColor: widget.AppColor
                                    ),
                                  ),
                                );
                              }
                            },
                          );
                        },
                        child:  Text(
                          "pick".tr(),
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
