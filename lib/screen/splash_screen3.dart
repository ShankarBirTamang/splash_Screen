import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Homepage1 extends StatefulWidget {
  const Homepage1({ Key? key }) : super(key: key);

  @override
  State<Homepage1> createState() => _Homepage1State();
}

class _Homepage1State extends State<Homepage1> with TickerProviderStateMixin {  
  late final AnimationController _controller ;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose(){
    _controller.dispose();
    super.dispose();
  }

  bool clicked = false ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: (){
              if(!clicked){
                clicked = true;
                _controller.forward();
              }else{
                clicked = false;
                _controller.reverse();                           
              }
            },
            child: Lottie.network('https://lottie.host/7eecbfe3-3136-4dc2-b610-1249323e0565/gpxN7b0ONQ.json',
            controller: _controller ,
            onLoaded: (composition){
              _controller
                ..duration = composition.duration 
                ..forward()
                ..repeat();
            }
          
            ),
          )
        ],
      ),
    );
  }
}