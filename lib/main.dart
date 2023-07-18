import 'package:flutter/material.dart';
// import 'package:splash_screen/onBoardingScreen/on_board_screen.dart';
import 'package:splash_screen/screen/splash_screen1.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
const MyApp({ Key? key }) : super(key: key);

  
  @override
  Widget build(BuildContext context){
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home:SplashScreen1() ,
      // home:OnBoardingScreen() ,
    );
  }
}