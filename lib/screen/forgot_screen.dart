import 'package:flutter/material.dart';
import 'package:webapp/styleGuide/style_guide.dart';

class forgotScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      color: Colors.white,
      home: Scaffold(
        backgroundColor: bgColor,
        body: authenScreen(),
        // backgroundColor: Colors.redAccent
      ),
    );
  }
}

class authenScreen extends StatefulWidget {
  @override
  _authenScreenState createState() => _authenScreenState();
}

class _authenScreenState extends State<authenScreen> {
  final _formKey = GlobalKey<FormState>(); //CHECK LATER
  TextEditingController _userNameCont;
  TextEditingController _passwordCont;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Stack(children: <Widget>[
      Container(
        color: bg2Color,
        height: MediaQuery.of(context).size.height,
        child: Wrap(
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  height: 122,
                ),
                Container(
                  // color: Colors.cyanAccent,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset('assets/images/logo-png.png', width: 90.0),
                      SizedBox(height: 10),
                      Image.asset('assets/images/title.png', width: 220.0),
                    ],
                  ),
                ),
                Container(
                  height: 100,
                  // color: Colors.greenAccent,
                ),
                Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 60.0),
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          controller: _userNameCont,
                          cursorColor: blueCol,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 14.0),
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10.0),
                                )),
                            fillColor: strokeTextFIled,
                            filled: true,
                            hintText: 'Email',
                            hintStyle: TextStyle(
                                fontFamily: 'Futura-light',
                                color: Colors.grey,
                                fontSize: 18.0),
                          ),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'email is must';
                            } else {
                              return null;
                            }
                          },
                        ),
                        SizedBox(height: 10),
                        Column(
                          children: <Widget>[
                            SizedBox(height: 14.0),
                            Wrap(
                              children: <Widget>[
                                FlatButton(
                                  color: blueCol,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.0))),
                                  onPressed: () {
                                    print('Login Button Pressed');
                                    if (_formKey.currentState.validate()) {
                                      print('Validation Checked ALL RIGHT');
                                    } else {
                                      print('Error in form');
                                    }
                                  },
                                  child: Center(
                                    child: Text(
                                      'Reset',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Futura-Medium',
                                          fontSize: 20.0),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: screenHeight / 3.3),
                MaterialButton(
                    child: Text('Contact us',
                        style: TextStyle(
                            fontFamily: 'Futura-light', fontSize: 12.0)),
                    onPressed: () {})
              ],
            ),
          ],
        ),
      ),
      Container(
        // color: Colors.amberAccent,
        child: Padding(
          padding: EdgeInsets.only(bottom: 0.0, left: 8.0, top: 55.0),
          child: IconButton(
            icon: Icon(Icons.arrow_back_ios, size: 30.0,color: blueCol),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
      ),
    ]);
  }
}
