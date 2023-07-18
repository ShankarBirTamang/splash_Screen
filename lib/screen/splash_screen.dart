 import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:splash_screen/screen/imagepage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({ Key? key }) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();

  
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    super.initState();
    Future.delayed(const Duration(seconds: 3),() {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const Homepage(),));
    },);

  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,overlays: SystemUiOverlay.values);  
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
            body: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(colors:[Colors.blue,Colors.purple] , 
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                 )
              ), 
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(child: Image(
                    image: AssetImage('assets/anim/animation1.gif'),
                      height : 150 ,
                      width: 300,
                      fit: BoxFit.cover,
                    )),
                ],
              ),            
            ),
           
    );
  }

}


