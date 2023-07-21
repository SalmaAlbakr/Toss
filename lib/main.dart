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
class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
  static _FirstScreenState of(BuildContext context) =>
      context.findAncestorStateOfType<_FirstScreenState>()!;
}

class _FirstScreenState extends State<FirstScreen> {
  ThemeMode _themeMode = ThemeMode.system;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
//46458C
          appBarTheme: AppBarTheme(color: Colors.deepPurple[400]),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Color(0xFF9D6DFA))
              )
          ),

          brightness: Brightness.light,),
        darkTheme: ThemeData(
          appBarTheme: AppBarTheme(color: Color(0xFF624F82)),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Color(0xFF46458C))
              )
          ),
          brightness: Brightness.dark,
          /* dark theme settings */
        ),
        themeMode: _themeMode,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        home:
        SplashScreen());
  }

  void changeTheme(ThemeMode themeMode) {
    setState(() {
      _themeMode = themeMode;
    });
  }
}

