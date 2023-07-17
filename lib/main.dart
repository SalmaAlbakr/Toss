import 'package:TOSS/model/box_name.dart';
import 'package:TOSS/model/color_model.dart';
import 'package:TOSS/screens/splash_screen1.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

void main() async {

  await Hive.initFlutter();
  WidgetsFlutterBinding.ensureInitialized();

  // final directory = await getApplicationDocumentsDirectory();
  // Hive.init(directory.path);
  // Hive.registerAdapter(ColorModelClassAdapter());
  // await Hive.openBox(BoxName.AppColorBoxName);
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
        supportedLocales: [
          Locale('en'),
          Locale('ar')
        ],
        path: 'assets/translations',
        fallbackLocale: Locale('en'),
        child: FirstScreen()
    ),
  );
}
class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        home:
        SplashScreen());
  }
}

// class test extends StatelessWidget {
//   const test({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       floatingActionButton: FloatingActionButton(onPressed: (){
//         // if (context.locale == Locale('ar')){
//         //
//         //   context.setLocale(Locale('en'));
//         // } else{
//         //   context.setLocale(Locale('ar'));
//         // }
//       }),
//       body: Center(
//         child: Text("StartText".tr()),
//       ),
//     );
//   }
// }
