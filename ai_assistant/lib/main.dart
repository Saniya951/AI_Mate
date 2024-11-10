import 'package:ai_assistant/helper/global.dart';
import 'package:ai_assistant/helper/pref.dart';
import 'package:ai_assistant/screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); 

  //initialize hype
  await Pref.initalize();
  
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky); // for full screen app
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp,DeviceOrientation.portraitDown]);// for portrait mode

  runApp(const MyApp());
}

class MyApp extends StatelessWidget{ 
  const MyApp({super.key }); 

  @override 
  Widget build(BuildContext context){
    return GetMaterialApp(
      title: appName, 
      debugShowCheckedModeBanner: false,
      theme: ThemeData( 
        appBarTheme:const AppBarTheme(
          titleTextStyle: TextStyle(fontWeight:FontWeight.w500, fontSize:20, color:Color.fromARGB(255, 253, 253, 253)),
          elevation:2,
          iconTheme: IconThemeData(color:Colors.white),
          centerTitle:true, 
          backgroundColor: Color.fromARGB(255, 0, 0, 83),
      )),  
      home: const SplashScreen(),
    );
  }  
}

   