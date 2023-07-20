
import 'package:TOSS/main.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.settings),
            SizedBox(width: 5,),
            Text("setting".tr()),
          ],
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                      style: ButtonStyle(
                        // backgroundColor: MaterialStateProperty.all(Colors.white),
                      ),
                      clipBehavior: Clip.hardEdge,
                      onPressed: (){
                        //   Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => ChangeColor()));

                        if (context.locale == Locale('ar')){

                          context.setLocale(Locale('en'));
                        } else{
                          context.setLocale(Locale('ar'));
                        }
                      }, child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.g_translate_outlined),
                      SizedBox(width: 5,),
                      Text("Lang".tr(),style: TextStyle(color: Colors.white),),
                    ],
                  )),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(


                      onPressed: () => FirstScreen.of(context).changeTheme(ThemeMode.light),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.light_mode),
                          SizedBox(width: 5,),
                          Text("Light".tr()),
                        ],
                      )),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                      onPressed: () => FirstScreen.of(context).changeTheme(ThemeMode.dark),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.dark_mode_outlined),
                          SizedBox(width: 5,),
                          Text("Dark".tr()),
                        ],
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
