import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class animatedWithHook extends HookWidget {
  @override
  Widget build(BuildContext context) {
    var controller = useAnimationController(duration: Duration(seconds: 3));
    controller.forward(); 
    return Center(
        child: growingContainer(
      controller: controller,
    ));
  }
}

class growingContainer extends AnimatedWidget {
  growingContainer({AnimationController controller})
      : super(
            listenable: Tween<double>(begin: 0, end: 200).animate(controller));
  @override
  Widget build(BuildContext context) {
    Animation<double> anima = listenable;
    return Container(
      color: Colors.orangeAccent,
      width: anima.value,
      height: anima.value,
    );
  }
}

/*
Stack(
      children: <Widget>[
        Container(color: Colors.blueAccent),
        AnimatedContainer(
            duration: Duration(milliseconds: 800),
            transform: Matrix4.rotationZ(5.5),
            child: Container(color: Colors.deepOrangeAccent))
      ],
    );
 */
