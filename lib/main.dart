
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bkash/splash_screen/view/splash_screen.dart';

import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor:Colors.red,
    // systemNavigationBarColor:awsEndColor,
  ));
}

class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context){

    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    return GetMaterialApp(

      //color: Colors.lime,
      debugShowCheckedModeBanner: false,


      home: SplashScreenPage(),


    );

  }

}

