import "package:flutter/material.dart";

import '../widget/background_circle.dart';

class YogaScreen extends StatefulWidget {
  const YogaScreen({Key? key}) : super(key: key);

  @override
  State<YogaScreen> createState() => _YogaScreenState();
}

class _YogaScreenState extends State<YogaScreen>
    with TickerProviderStateMixin {
  bool animatedContainer = false;
  late AnimationController imageAnimationController;
  late AnimationController iconAnimationController;

  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(Duration(milliseconds: 1))
        .then((value){setState(() {
      animatedContainer = true;
        });});
    imageAnimationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
      reverseDuration: Duration(seconds: 2),
    )..addStatusListener(
        (AnimationStatus status) {
           if (imageAnimationController.isCompleted) {
            imageAnimationController.reverse();
          } else if (imageAnimationController.isDismissed) {
            imageAnimationController.forward();
          }
        },
      );
    iconAnimationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    super.initState();
  }
@override
  void dispose() {
    imageAnimationController.dispose();
    iconAnimationController.dispose();
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final responsiveWidth = MediaQuery.of(context).size.width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 20,),
        AnimatedContainer(
          duration: Duration(seconds: 1),
          height: animatedContainer ? responsiveWidth * .9 : 0.0,
          width: animatedContainer ? responsiveWidth * .9 : 0.0,
          curve: Curves.easeOut,
          child: Stack(
            alignment: Alignment.center,
            children: [
              BackgroundCircle(
                borderColor: Colors.grey.shade400,
                borderWidth: 80,
                circleWidth: responsiveWidth * .9,
              ),
              BackgroundCircle(
                borderColor: Colors.blueAccent,
                borderWidth: 40,
                circleWidth: responsiveWidth * .8,
              ),
              SlideTransition(
                position:
                    Tween<Offset>(begin: Offset(0, -0.10), end: Offset(0, 0.10))
                        .animate(imageAnimationController),
                child: Container(
                  width: responsiveWidth * .8,
                  height: responsiveWidth * .8,
                  child: Image.asset("assets/yoga.png"),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 60,),
        IconButton(
          onPressed: (){
            if(imageAnimationController.isAnimating){
              iconAnimationController.reverse();
              imageAnimationController.stop();
            }
            else {
              iconAnimationController.forward();
              imageAnimationController.forward();
            }
          },
          icon: AnimatedIcon(
            icon: AnimatedIcons.play_pause,
            color: Colors.blue,
            progress: iconAnimationController,
            size: 50,
          ),
        )
      ],
    );
  }
}
