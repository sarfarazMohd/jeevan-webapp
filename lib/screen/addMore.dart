import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webapp/model/peopleModel.dart';
import 'package:webapp/screen/homeContributor.dart';
import 'package:webapp/services/dataService.dart';
import 'package:webapp/styleGuide/style_guide.dart';
import 'package:provider/provider.dart';
import 'package:toast/toast.dart';

class addMore extends StatelessWidget {
  var _formKey = GlobalKey<FormState>();
  String _name, _occupation, _address, _member, _phno;
  static String _initMember = '0';
  TextEditingController _memberController = TextEditingController(
    text: _initMember,
  );

  final foldkey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Wrap(
          children: <Widget>[
            Container(
                color: bgColor,
                width: MediaQuery.of(context).size.width,
                height: 120.0,
                child: Column(
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        Container(
                          width: 125,
                          decoration: BoxDecoration(
                            color: bg2Color,
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(1000.0)),
                          ),
                        ),
                        Positioned(
                          right: 0.0,
                          bottom: 0.0,
                          child: Container(
                            width: 120,
                            height: 50,
                            decoration: BoxDecoration(
                              color: bg2Color,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(1000.0)),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 18.0, right: 18.0, bottom: 8.0, top: 50.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              IconButton(
                                  padding: EdgeInsets.zero,
                                  icon: Icon(Icons.arrow_back_ios,
                                      color: blueCol),
                                  iconSize: 32.0,
                                  onPressed: () {
                                    Navigator.pop(context);
                                  }),
                              Image.asset(
                                'assets/images/logo-png.png',
                                width: 50.0,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                )),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(14.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                !val.contains(RegExp('^[a-zA-Z ]+'))) {
                              return 'wrong input';
                            } else {
                              _name = val;
                              return null;
                            }
                          },
                          cursorColor: blueCol,
                          style: TextStyle(
                              fontSize: 18.0, fontFamily: 'Futura-book'),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 0.0, horizontal: 10.0),
                            fillColor: bg2Color,
                            filled: true,
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.0))),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12.0),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              fontSize: 18.0, fontFamily: 'Futura-book'),
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
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.0))),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12.0),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                !val.contains(RegExp('^[a-z A-Z]+'))) {
                              return 'wrong input';
                            } else {
                              _occupation = val;
                              return null;
                            }
                          },
                          cursorColor: blueCol,
                          style: TextStyle(
                              fontSize: 18.0, fontFamily: 'Futura-book'),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 0.0, horizontal: 10.0),
                            fillColor: bg2Color,
                            filled: true,
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.0))),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12.0),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                !val.contains(RegExp('^[0-9]+'))) {
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
                              fontSize: 18.0, fontFamily: 'Futura-book'),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 0.0, horizontal: 10.0),
                            fillColor: bg2Color,
                            filled: true,
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.0))),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12.0),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              fontSize: 18.0, fontFamily: 'Futura-book'),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 0.0, horizontal: 10.0),
                            fillColor: bg2Color,
                            filled: true,
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.0))),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12.0),
                    RaisedButton(
                      padding: EdgeInsets.symmetric(horizontal: 40.0),
                      color: blueCol,
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          print('CHECKING $_member');
                          print('OK');

                          Provider.of<dataService>(context, listen: false)
                              .addPeople(peopleAround(
                                  name: _name,
                                  occupation: _occupation,
                                  member: _member,
                                  status: 'Unverified',
                                  number: _phno));

                          print(
                              'People : ${dataService().allPeopleList.length}');

                          SnackBar(content: Text('Succesfully added'));
                          showToast(context);
                          Navigator.pop(context);
                        } else
                          print('ERROR IN FORM');
                      },
                      child: Text(
                        'Continue',
                        style: TextStyle(fontSize: 18.0, color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  showToast(BuildContext context) {
    return Toast.show('Added Succesfully', context,
        gravity: Toast.BOTTOM, textColor: Colors.white, duration: 3);
  }
}
