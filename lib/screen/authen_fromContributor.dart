import 'package:flutter/material.dart';
import 'package:webapp/styleGuide/style_guide.dart';

class authenticate_page_contributor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      color: Colors.white,
      home: Scaffold(
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
  bool _secPass;

  @override
  void initState() {
    _secPass = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
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
                          TextFormField(
                            controller: _passwordCont,
                            obscureText: _secPass,
                            cursorColor: blueCol,
                            decoration: InputDecoration(
                              suffixIcon:IconButton(
                                icon: _secPass
                                    ? Icon(Icons.lock_outline,
                                        color: blueCol)
                                    : Icon(Icons.lock_open,
                                        color: blueCol),
                                onPressed: () {
                                  setState(() {
                                    _secPass = !_secPass;
                                  });
                                },
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 14.0),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10.0),
                                  )),
                              fillColor: strokeTextFIled,
                              filled: true,
                              hintText: 'Password',
                              hintStyle: TextStyle(
                                  fontFamily: 'Futura-light',
                                  color: Colors.grey,
                                  fontSize: 18.0),
                            ),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'password must have 8 characters';
                              } else {
                                return null;
                              }
                            },
                          ),
                          SizedBox(height: 5.0),
                          Row(
                            children: <Widget>[
                              Text('Not a contributor?',
                                  style: TextStyle(
                                      fontFamily: 'Futura-light',
                                      fontSize: 11.0,
                                      color: Colors.grey[600])),
                              Spacer(),
                              Text('Forgot Password?',
                                  style: TextStyle(
                                      fontFamily: 'Futura-light',
                                      fontSize: 11.0,
                                      color: Colors.grey[600])),
                            ],
                          ),
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
                                    'Login as Contributor',
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
              SizedBox(height: 60.0),
              Divider(
                  thickness: 2.0,
                  indent: 60.0,
                  endIndent: 60.0,
                  color: Colors.grey[350]),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Login with',
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontFamily: 'Futura-medium', fontSize: 18.0),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 120.0, vertical: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        MaterialButton(
                            // color: Colors.greenAccent,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100.0)),
                            materialTapTargetSize: MaterialTapTargetSize.padded,
                            child: Image.asset('assets/images/google-logo.png',
                                width: 55),
                            onPressed: () {
                              print('Google Icons');
                            }),
                        MaterialButton(
                            // color: Colors.greenAccent,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100.0)),
                            materialTapTargetSize: MaterialTapTargetSize.padded,
                            child: Image.asset('assets/images/facebook.png',
                                width: 48),
                            onPressed: () {
                              print('Facebook login Icons');
                            }),
                      ],
                    ),
                  )
                ],
              ),
              MaterialButton(
                  child: Text('Contact us',
                      style: TextStyle(
                          fontFamily: 'Futura-light', fontSize: 12.0)),
                  onPressed: () {})
            ],
          ),
        ],
      ),
    );
  }

  Color hexToColor(String code) {
    return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }
}
