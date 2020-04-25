import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:webapp/customShape-clipper.dart';
import 'package:webapp/styleGuide/style_guide.dart';
import 'dart:math' show pi;

class introScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body:intro()),
    );
  }
}

class intro extends StatefulWidget {
  @override
  _introState createState() => _introState();
}

class _introState extends State<intro> {
  @override
  Widget build(BuildContext context) {
    return screen();
  }
}

class screen extends StatefulWidget {
  @override
  _screenState createState() => _screenState();
}

class _screenState extends State<screen> with TickerProviderStateMixin {
  PageController _pageController;
  int _index = 0;
  double _pageOffset = 0;
  int page;

  AnimationController _blobController;
  Animation _blobAnimation;

  AnimationController _getStartController;
  Animation _getStartedAnimation;

  @override
  void initState() {
    print('page offset: $_pageOffset');
    _pageController = PageController(initialPage: 0)
      ..addListener(() {
        // print(_pageController.offset);

        setState(() {
          _pageOffset = _pageController.offset;
        });
        _index == 2 || _index == 3
            ? _blobController.forward()
            : _blobController.reverse();
        _index == 3
            ? _getStartController.forward()
            : _getStartController.reverse();
      });

    _blobController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    _blobAnimation =
        Tween<double>(begin: 1.0, end: 0.0).animate(_blobController);

    _getStartController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 880),
    );
    _getStartedAnimation =
        Tween<double>(begin: 0.0, end: 1.0).animate(_getStartController);
    super.initState();
  }

  @override
  void dispose() {
    _blobController.dispose();
    _getStartController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: bgColor,
        child: Stack(
          children: <Widget>[
            Container(
              child: PageView(
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                controller: _pageController,
                pageSnapping: true,
                onPageChanged: ((_pageIndex) {
                  setState(() {
                    _pageOffset = _pageController.offset;
                    _index = _pageIndex;
                    // print(_pageOffset);
                  });
                }),
                children: <Widget>[
                  Container(
                      // color: Colors.accents[1],
                      height: 200,
                      width: 200),
                  Container(
                      // color: Colors.accents[2],
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text('A platform that connects',
                              style: TextStyle(
                                  fontFamily: 'Futura-medium',
                                  fontSize: 17.0,
                                  color: Colors.grey[850])),
                          Text('Us with Us',
                              style: TextStyle(
                                  fontFamily: 'Futura-bold', fontSize: 35.0))
                        ],
                      ),
                      height: 200,
                      width: 200),
                  Container(
                    // color: Colors.accents[4],
                    height: 200,
                    width: 200,
                    child: CustomTextBg(
                        'Provide a platform for donors to search\nthe needies'),
                  ),
                  Container(
                    // color: Colors.accents[5],
                    height: 200,
                    width: 200,
                    child: Stack(
                      children: <Widget>[
                        CustomTextBg(
                            'Those who need help could easily find and\nconnect with the Contributors'),
                        Positioned(
                          bottom: 150.0,
                          left: 108.0,
                          right: 108.0,
                          child: FadeTransition(
                            opacity: _getStartedAnimation,
                            child: MaterialButton(
                              materialTapTargetSize:
                                  MaterialTapTargetSize.padded,
                              onPressed: () =>
                                  print('Get Started Button Pressed'),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: blueCol,
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10.0))),
                                height: 49,
                                width: 195,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      'Get Started',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Futura-medium',
                                          fontSize: 25.0),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
                top: -120,
                left: -150,
                child: FadeTransition(
                    opacity: _blobAnimation,
                    child: Transform.rotate(angle: 90, child: cutomOval()))),
            Positioned(
                top: 50,
                right: -230,
                child: FadeTransition(
                  opacity: _blobAnimation,
                  child: Transform.rotate(
                      angle: 200,
                      child: Transform.scale(scale: 0.85, child: cutomOval())),
                )),
            Positioned(
                bottom: -120,
                left: -200,
                child: FadeTransition(
                  opacity: _blobAnimation,
                  child: Transform.rotate(
                      angle: 290,
                      child: Transform.scale(scale: 0.9, child: cutomOval())),
                )),
            //
            //
            //
            //
            // jeevanLogo(page),
            AnimatedContainer(
              duration: Duration(milliseconds: 0),
              curve: Curves.easeInOut,
              child: Positioned(
                top: -_pageOffset > -423.52 ? -_pageOffset : -423.52,
                bottom: 0,
                left: 0,
                right: 0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      'assets/images/logo-png.png',
                      width: 90.0,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Image.asset(
                      'assets/images/title.png',
                      width: 220.0,
                    ),
                  ],
                ),
              ),
            ),
            //
            //
            //
            Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  _index != 3
                      ? FlatButton(
                          padding: EdgeInsets.only(right: 18.0),
                          onPressed: () {
                            setState(() {
                              _pageController.animateToPage(5,
                                  duration: Duration(milliseconds: 250),
                                  curve: Curves.decelerate);
                            });
                          },
                          child: Text('Skip',
                              style: TextStyle(
                                  fontFamily: 'Futura-light', fontSize: 15.0)),
                        )
                      : Text('')
                ],
              ),
            ),
            Positioned(bottom: 18.0, child: pageIndicator(_index)),
          ],
        ),
      ),
    );
  }

  Widget pageIndicator(int index) {
    return Container(
      width: MediaQuery.of(context).size.width,
      // decoration: BoxDecoration(border: Border.all(color: Colors.redAccent)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          circleIndex(index == 0 ? true : false),
          circleIndex(index == 1 ? true : false),
          circleIndex(index == 2 ? true : false),
          circleIndex(index == 3 ? true : false),
        ],
      ),
    );
  }

  Widget circleIndex(bool sel) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.0),
      child: ClipOval(
          child: Container(
              height: 15.0,
              width: 15.0,
              color: sel ? indicatorSel : indicatorUnSel)),
    );
  }
}

class cutomOval extends StatelessWidget {
  const cutomOval({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: topRightClip(),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.width,
        color: bg2Color,
      ),
    );
  }
}

class CustomTextBg extends StatelessWidget {
  String discription;
  CustomTextBg(this.discription);
  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(border: Border.all(color: Colors.redAccent)),
      height: 800.0,
      padding: EdgeInsets.only(top: 60.0),
      child: Stack(
        children: <Widget>[
          Positioned(
            bottom: 130.0,
            child: ClipPath(
              clipper: topRightClip(),
              child: Container(
                height: 400.0,
                width: MediaQuery.of(context).size.width,
                color: bg2Color,
              ),
            ),
          ),
          Positioned(
            left: 0.0,
            right: 0.0,
            bottom: 300.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  discription,
                  style: TextStyle(fontFamily: 'Futura-book', fontSize: 20.0),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
