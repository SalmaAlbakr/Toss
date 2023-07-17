import 'package:TOSS/model/color_model.dart';
import 'package:TOSS/screens/toss_home_screen.dart';
import 'package:flutter/material.dart';

class ChangeColor extends StatelessWidget {
   ChangeColor({Key? key ,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: (){

           Color AppColor = Colors.orange;

            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => TossHomeScreen(inputList: [],AppColor: AppColor,)));

          },
          child: Text("change color"),
        ),
      ),
    );
  }
}
