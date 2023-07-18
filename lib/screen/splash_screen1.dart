import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:splash_screen/onBoardingScreen/on_board_screen.dart';
// import 'package:splash_screen/screen/splash_screen3.dart';

class SplashScreen1 extends StatefulWidget {
  const SplashScreen1({super.key});

  @override
  State<SplashScreen1> createState() => _SplashScreen1State();
}

class _SplashScreen1State extends State<SplashScreen1>
    with TickerProviderStateMixin {
  late final AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.blue, Colors.purple],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: 
              // Lottie.asset(
              //   'assets/anim/welcome1.gif',
                Lottie.network('https://lottie.host/3aa2b9cf-8c8e-4eeb-b60e-a90a36f7bc1b/RGxtn9v06M.json',
                controller: _controller,
                onLoaded: (composition) {
                  _controller
                    ..duration = composition.duration
                    ..forward().then((value) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const OnBoardingScreen()));
                    });
                },
              ),
            ),

            // const SizedBox(
            //   height: 16,

            // ),
            // const Text('Welcome...',
            // style: TextStyle(
            //   color: Colors.green,
            //   fontSize: 50,
            // ),
            // )
          ],
        ),
      ),
    );
  }
}
