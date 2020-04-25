import 'package:flutter/material.dart';
import 'package:flutter_sequence_animation/flutter_sequence_animation.dart';

class sequenceAnimationView extends StatefulWidget {
  @override
  _sequenceAnimationViewState createState() => _sequenceAnimationViewState();
}

class _sequenceAnimationViewState extends State<sequenceAnimationView>
    with TickerProviderStateMixin {
  AnimationController controller;
  SequenceAnimation seqAnimation;
  @override
  void initState() {
    controller = AnimationController(vsync: this);

    seqAnimation = SequenceAnimationBuilder()
        .addAnimatable(
            animatable: Tween<double>(begin: 450, end: 0),
            from: Duration(seconds: 0),
            to: Duration(seconds: 1),
            tag: 'margin-slide')
        .addAnimatable(
            animatable: Tween<double>(begin: 0, end: 10),
            from: Duration(seconds: 1),
            to: Duration(seconds: 4),
            tag: 'angleRotate')
        .addAnimatable(
            animatable:
                ColorTween(begin: Colors.blueAccent, end: Colors.orangeAccent),
           from: Duration(seconds: 4),
            to: Duration(seconds: 7),
            tag: 'colorT')
        .animate(controller);

    controller.forward();


    super.initState();
  }

  animateNow() {
controller = AnimationController(vsync: this);

    seqAnimation = SequenceAnimationBuilder()
        .addAnimatable(
            animatable: Tween<double>(begin: 450, end: 0),
            from: Duration(seconds: 0),
            to: Duration(seconds: 1),
            tag: 'margin-slide')
        .addAnimatable(
            animatable: Tween<double>(begin: 0, end: 10),
            from: Duration(seconds: 1),
            to: Duration(seconds: 4),
            tag: 'angleRotate')
        .addAnimatable(
            animatable:
                ColorTween(begin: Colors.blueAccent, end: Colors.orangeAccent),
           from: Duration(seconds: 4),
            to: Duration(seconds: 7),
            tag: 'colorT')
        .animate(controller);

    controller.forward();

  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        AnimatedBuilder(
          animation: controller,
          builder: (context, child) => Center(
            child: RotationTransition(
              child: Container(
                margin: EdgeInsets.only(left: seqAnimation['margin-slide'].value),
                height: 200,
                width: MediaQuery.of(context).size.width,
                color:seqAnimation['colorT'].value,
              ),
              turns: seqAnimation['angleRotate'],
            ),
          ),
        ),
        // FlatButton(onPressed:  animateNow(), child: Text('Animate Now'))
      ],
    );
  }
}

/*

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) => Opacity(
        opacity: seqAnimation['fade-in'].value,
              child: Center(
                child: Container(
          margin: EdgeInsets.only(left: seqAnimation['margin-slide'].value),
          height: seqAnimation['grow'].value,
          width: MediaQuery.of(context).size.width,
          color: Colors.orangeAccent,
        ),
              ),
      ),
    );
  }
 */
