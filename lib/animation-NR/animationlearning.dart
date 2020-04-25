import 'package:flutter/material.dart';

class home extends StatefulWidget {
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> with TickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1500));
    _controller.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(child: growingContainer(controller: _controller,));
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
