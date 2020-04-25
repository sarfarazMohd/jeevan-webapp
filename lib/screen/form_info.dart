import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webapp/styleGuide/style_guide.dart';

class form_info extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      color: Colors.white,
      home: Scaffold(
        body: formScreen(),
        // backgroundColor: Colors.redAccent
      ),
    );
  }
}

class formScreen extends StatefulWidget {
  @override
  _formScreenState createState() => _formScreenState();
}

class _formScreenState extends State<formScreen> {
  var _formKey = GlobalKey<FormState>();
  String _name, _occupation, _address, _member, _phno;
  static String _initMember = '0';
  TextEditingController _memberController = TextEditingController(
    text: _initMember,
  );
  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    double _screenHeight = MediaQuery.of(context).size.width;

    return Wrap(
      children: <Widget>[
        Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            // color: Colors.redAccent,
            child: Column(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Container(
                      height: 130.0,
                      width: 130.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(500.0)),
                        color: bg2Color,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(height: 180.0),
                        Image.asset('assets/images/logo-png.png', width: 60.0),
                      ],
                    ),
                  ],
                ),
                Container(
                  width: _screenWidth,
                  // color: Colors.lime,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: 38.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'Personal Information',
                              style: TextStyle(
                                  fontFamily: 'Futura-medium', fontSize: 22.0),
                            ),
                            SizedBox(width: 10.0),
                            Container(
                              color: blueCol,
                              height: 4.0,
                              width: 150.0,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 38.0, vertical: 20.0),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: <Widget>[
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'Name',
                                    style: TextStyle(
                                        color: Colors.grey[800],
                                        fontFamily: 'Futura-light',
                                        fontSize: 15.0),
                                  ),
                                  TextFormField(
                                    validator: (val) {
                                      if (val.isEmpty ||
                                          !val.contains(
                                              RegExp('^[a-zA-Z ]+'))) {
                                        return 'wrong input';
                                      } else {
                                        _name = val;
                                        return null;
                                      }
                                    },
                                    cursorColor: blueCol,
                                    style: TextStyle(
                                        fontSize: 18.0,
                                        fontFamily: 'Futura-book'),
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.symmetric(
                                          vertical: 0.0, horizontal: 10.0),
                                      fillColor: bg2Color,
                                      filled: true,
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5.0))),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 12.0),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'Phone Number',
                                    style: TextStyle(
                                        color: Colors.grey[800],
                                        fontFamily: 'Futura-light',
                                        fontSize: 15.0),
                                  ),
                                  TextFormField(
                                    validator: (val) {
                                      if (val.isEmpty ||
                                          !val.contains(RegExp('^[0-9]+'))) {
                                        return 'wrong input';
                                      } else {
                                        _phno = val;
                                        return null;
                                      }
                                    },
                                    cursorColor: blueCol,
                                    style: TextStyle(
                                        fontSize: 18.0,
                                        fontFamily: 'Futura-book'),
                                    keyboardType: TextInputType.phone,
                                    inputFormatters: <TextInputFormatter>[
                                      WhitelistingTextInputFormatter.digitsOnly
                                    ],
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.symmetric(
                                          vertical: 0.0, horizontal: 10.0),
                                      fillColor: bg2Color,
                                      filled: true,
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5.0))),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 12.0),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'Occupation',
                                    style: TextStyle(
                                        color: Colors.grey[800],
                                        fontFamily: 'Futura-light',
                                        fontSize: 15.0),
                                  ),
                                  TextFormField(
                                    validator: (val) {
                                      if (val.isEmpty ||
                                          !val.contains(
                                              RegExp('^[a-z A-Z]+'))) {
                                        return 'wrong input';
                                      } else {
                                        _occupation = val;
                                        return null;
                                      }
                                    },
                                    cursorColor: blueCol,
                                    style: TextStyle(
                                        fontSize: 18.0,
                                        fontFamily: 'Futura-book'),
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.symmetric(
                                          vertical: 0.0, horizontal: 10.0),
                                      fillColor: bg2Color,
                                      filled: true,
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5.0))),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 12.0),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'Family Member',
                                    style: TextStyle(
                                        color: Colors.grey[800],
                                        fontFamily: 'Futura-light',
                                        fontSize: 15.0),
                                  ),
                                  TextFormField(
                                    validator: (val) {
                                      if (val.isEmpty ||
                                          !val.contains(
                                              RegExp('^[0-9]+'))) {
                                        return 'wrong input';
                                      } else {
                                        _member = val;
                                        return null;
                                      }
                                    },
                                    keyboardType: TextInputType.phone,
                                    inputFormatters: <TextInputFormatter>[
                                      WhitelistingTextInputFormatter.digitsOnly
                                    ],
                                    cursorColor: blueCol,
                                    style: TextStyle(
                                        fontSize: 18.0,
                                        fontFamily: 'Futura-book'),
                                    decoration: InputDecoration(
                                    
                                      contentPadding: EdgeInsets.symmetric(
                                          vertical: 0.0, horizontal: 10.0),
                                      fillColor: bg2Color,
                                      filled: true,
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5.0))),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 12.0),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'Address',
                                    style: TextStyle(
                                        color: Colors.grey[800],
                                        fontFamily: 'Futura-light',
                                        fontSize: 15.0),
                                  ),
                                  TextFormField(
                                    validator: (val) {
                                      if (val.isEmpty) {
                                        return 'wrong input';
                                      } else {
                                        _address = val;
                                        return null;
                                      }
                                    },
                                    cursorColor: blueCol,
                                    style: TextStyle(
                                        fontSize: 18.0,
                                        fontFamily: 'Futura-book'),
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.symmetric(
                                          vertical: 0.0, horizontal: 10.0),
                                      fillColor: bg2Color,
                                      filled: true,
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5.0))),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 12.0),
                              RaisedButton(
                                padding: EdgeInsets.symmetric(horizontal: 40.0),
                                color: blueCol,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10.0))),
                                onPressed: () {
                                  if (_formKey.currentState.validate()) {
                                    print(_member);
                                    print('OK');
                                  } else
                                    print('ERROR IN FORM');
                                },
                                child: Text(
                                  'Continue',
                                  style: TextStyle(
                                      fontSize: 18.0, color: Colors.white),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )),
      ],
    );
  }
}

/*
Container(alignment: Alignment.topLeft,
        child: Column(
          children: <Widget>[
            Container(
              height: 180.0,
              width: 180.0,
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.only(bottomRight: Radius.circular(500.0)),
                color: bg2Color,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 170.0),
                Image.asset('assets/images/logo-png.png', width: 55.0),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.0),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[Text('Personal Information')],
                  )
                ],
              ),
            )
          ],
        ),
      ),
 */
