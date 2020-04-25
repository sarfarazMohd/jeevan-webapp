import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webapp/model/helpLineModel.dart';
import 'package:webapp/model/peopleModel.dart';
import 'package:webapp/screen/addMore.dart';
import 'package:webapp/screen/intro_screen.dart';
import 'package:webapp/services/dataService.dart';
import 'package:webapp/styleGuide/style_guide.dart';
import 'package:webapp/widget/toggleButton.dart';
import 'package:provider/provider.dart';
import 'package:overlay_container/overlay_container.dart';
import 'package:toast/toast.dart';
import 'package:url_launcher/url_launcher.dart';

class homeScreenContributor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => dataService(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: mainScreen(),
        ),
      ),
    );
  }
}

class mainScreen extends StatefulWidget {
  @override
  _mainScreenState createState() => _mainScreenState();
}

class _mainScreenState extends State<mainScreen> {
  bool _gpsOn;
  final String fakeUserNum = '9592392263';
  List<FocusNode> focusToggle;

  @override
  void initState() {
    _gpsOn = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        navBar(),
        topPart(),
        bottomListing(),
      ],
    );
  }

  Widget navBar() {
    return Container(
        color: bgColor,
        width: MediaQuery.of(context).size.width,
        height: 120.0,
        child: Stack(
          children: <Widget>[
            Container(
              width: 125,
              decoration: BoxDecoration(
                color: bg2Color,
                borderRadius:
                    BorderRadius.only(bottomRight: Radius.circular(1000.0)),
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
                  borderRadius:
                      BorderRadius.only(topLeft: Radius.circular(1000.0)),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: 18.0, right: 18.0, bottom: 8.0, top: 50.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Hero(
                    tag: 'leading-icon',
                    child: IconButton(
                        padding: EdgeInsets.zero,
                        icon: Icon(Icons.menu, color: blueCol),
                        iconSize: 32.0,
                        onPressed: null),
                  ),
                  Hero(
                    tag: 'jeevan-logo',
                    child: Image.asset(
                      'assets/images/logo-png.png',
                      width: 50.0,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.lime, shape: BoxShape.circle),
                    height: 55.0,
                    width: 55.0,
                  )
                ],
              ),
            ),
          ],
        ));
  }

  Widget topPart() {
    var _formKey = GlobalKey<FormState>();
    String _name, _occupation, _address, _member, _phno;
    TextEditingController _memberController = TextEditingController();
    return Container(
      height: 290.0,
      // color: Colors.cyanAccent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 18.0, right: 18.0, top: 9.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                location(),
                // gpsSwitch(),//FOR FUTHER RELeASE INSHALLAH
                // gpsStatus2(),
                // gpsStatus(),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 8.0, bottom: 8.0, left: 18.0),
            child: Text(
              'Helpline number',
              style: TextStyle(
                  fontFamily: 'Futura-medium', fontSize: 22.0, color: blueCol),
            ),
          ),
          helplineListing(),
          Padding(
              padding: EdgeInsets.only(left: 18.0),
              child: RaisedButton(
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                color: blueCol,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(100.0))),
                onPressed: () {
                  print('View All window version');
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Scaffold(
                          appBar: AppBar(
                            backgroundColor: bgColor,
                            title: Text(
                              'View All',
                              style: TextStyle(color: blueCol),
                            ),
                            iconTheme: IconThemeData(color: blueCol),
                            centerTitle: true,
                          ),
                          body: GridView.builder(
                              itemCount: getHelp.length,
                              padding: EdgeInsets.all(18.0),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 5,
                                mainAxisSpacing: 5,
                              ),
                              itemBuilder: (BuildContext context, int index) {
                                return Card(
                                  child: Container(
                                    // height: 20.0,
                                    width: 100.0,
                                    decoration: BoxDecoration(
                                        border:
                                            Border.all(color: Colors.blueGrey),
                                        // boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5.0)],
                                        // image: DecorationImage(
                                        //     image: NetworkImage(_imgUrl), fit: BoxFit.cover),
                                        // color: color,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5.0))),
                                    padding: EdgeInsets.all(6.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(getHelp[index].title,
                                            style: TextStyle(
                                              fontFamily: 'Futura-medium',
                                              fontSize: 19.0,
                                            )),
                                        Text(getHelp[index].number,
                                            style: TextStyle(
                                                fontFamily: 'Futura-book',
                                                color: Colors.grey)),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            IconButton(
                                              padding: EdgeInsets.zero,
                                              color: blueCol,
                                              icon: Icon(Icons.call),
                                              onPressed: ()=>launch("tel:${getHelp[index].number}")
                                            ),
                                            IconButton(
                                              padding: EdgeInsets.zero,
                                              color: blueCol,
                                              icon: Icon(Icons.message),
                                              onPressed: () {
                                                launch(
                                                    "sms:${getHelp[index].number}");
                                              },
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              }))));
                },
                child: Text(
                  'View all',
                  style: TextStyle(
                      fontFamily: 'Futura-medium',
                      color: Colors.white,
                      fontSize: 12.0),
                ),
              )),
          Spacer(),
          Container(
              color: bgColor,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(left: 18.0, top: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'People around you',
                    style: TextStyle(
                        fontFamily: 'Futura-medium',
                        fontSize: 24.0,
                        color: blueCol),
                  ),
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.only(right: 18.0),
                    child: Container(
                      height: 30.0,
                      width: 100.0,
                      decoration: BoxDecoration(
                          color: blueCol,
                          borderRadius: BorderRadius.all(Radius.circular(5.0))),
                      child: InkWell(
                        onTap: () {
                          print('add more');
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => addMore()));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.add, color: Colors.white),
                            Text('Add more',
                                style: TextStyle(
                                  color: Colors.white,
                                ))
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ))
        ],
      ),
    );
  }

  Widget bottomListing() {
    return Expanded(
      flex: 3,
      child: Container(
        color: bgColor,
        padding: EdgeInsets.only(top: 8.0),
        child: Consumer<dataService>(
          builder: (context, service, child) =>
              ListView.builder(
                padding: EdgeInsets.only(
                  left: 14.0,
                  right: 14.0,
                ),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: service.allPeopleList.length,
                itemBuilder: (context, index) {
                  return peopleDetailCard(service.allPeopleList[index]);
                },
              ) ??
              Center(child: Text('Data not found')),
        ),
      ),
    );
  }

  Widget location() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          Icons.location_on,
          color: blueCol,
          size: 32.0,
        ),
        SizedBox(width: 8.0),
        Text(
          'Chandigarh',
          style: TextStyle(
              fontFamily: 'Futura-medium', color: blueCol, fontSize: 16.0),
        )
      ],
    );
  }

  Widget gpsStatus() {
    bool _gpsOn = false;
    return FlatButton(
      onPressed: () {
        setState(() {
          _gpsOn = true ? _gpsOn = false : _gpsOn = true;
          print(_gpsOn);
        });
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(50.0)),
          color: bg2Color,
        ),
        width: 100.0,
        height: 40.0,
        padding: EdgeInsets.only(left: 8.0, right: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              _gpsOn ? 'Online' : 'Offline',
              style: TextStyle(fontFamily: 'Futura-light', fontSize: 16.0),
            ),
            Container(
              decoration: BoxDecoration(
                color: _gpsOn ? Colors.green : Colors.red,
                shape: BoxShape.circle,
              ),
              height: 25.0,
              width: 25.0,
            )
          ],
        ),
      ),
    );
  }

  Widget gpsStatus2(bool _gpsOn) {
    return Switch(
      onChanged: (sel) {
        _gpsOn = !_gpsOn;
      },
      value: _gpsOn,
    );
  }

  Widget gpsSwitch() {
    bool status = true;
    return CustomMadeSwitch(
      activeColor: bg2Color,
      value: status,
      onChanged: (val) {
        status = val;
      },
    );
  }

  Widget helplineListing() {
    return Container(
        // color: Colors.orange,
        height: 120,
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
            itemCount: getHelp.length - 3,
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.only(top: 5.0, bottom: 8.0),
            itemBuilder: (context, index) {
              return helpWidget(getHelp[index]);
            }));
  }

  Widget helpWidget(helpLineModel help) {
    return Padding(
      padding: EdgeInsets.only(left: 12.0),
      child: Container(
        // height: 20.0,
        width: 150.0,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.blueGrey),
            // boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5.0)],
            // image: DecorationImage(
            //     image: NetworkImage(_imgUrl), fit: BoxFit.cover),
            // color: color,
            borderRadius: BorderRadius.all(Radius.circular(5.0))),
        padding: EdgeInsets.all(6.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(help.title,
                style: TextStyle(
                  fontFamily: 'Futura-medium',
                  fontSize: 14.0,
                )),
            Text(help.number,
                style:
                    TextStyle(fontFamily: 'Futura-book', color: Colors.grey)),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  padding: EdgeInsets.zero,
                  color: blueCol,
                  icon: Icon(Icons.call),
                  onPressed: () {
                    launch("tel:${help.number}");
                    print('Call ${help.number}');
                  },
                ),
                IconButton(
                  padding: EdgeInsets.zero,
                  color: blueCol,
                  icon: Icon(Icons.message),
                  onPressed: () {
                    launch("sms:${help.number}");
                    print('Message ${help.number}');
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget peopleDetailCard(peopleAround people) {
    String status = people.status;
    Color statusColor;

    switch (people.status) {
      case 'Verified':
        statusColor = Colors.green;
        break;
      case 'Spam':
        statusColor = Colors.redAccent;
        break;
      case 'Unverified':
        statusColor = Colors.grey[400];
        break;
      case 'Done':
        statusColor = Colors.orange;
        break;
      default:
        statusColor = Colors.grey[400];
        break;
    }

    showDetailOfPeople(peopleAround people) {
      bool showStatus = false;
      String intialStatus = people.status;
      String changeStatus;
      return showModalBottomSheet(
          backgroundColor: bgColor,
          elevation: 5.0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
            topRight: Radius.circular(15.0),
            topLeft: Radius.circular(15.0),
          )),
          context: context,
          builder: (BuildContext contextM) {
            return Wrap(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Name : ',
                                style: showDetailSheetField,
                              ),
                              Text(
                                people.name,
                                style: showDetailSheetValue,
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Occupation : ',
                                style: showDetailSheetField,
                              ),
                              Text(
                                people.occupation,
                                style: showDetailSheetValue,
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Family member : ',
                                style: showDetailSheetField,
                              ),
                              Text(
                                people.member,
                                style: showDetailSheetValue,
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Phone Number : ',
                                style: showDetailSheetField,
                              ),
                              Text(
                                people.number,
                                style: showDetailSheetValue,
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Checked by : ',
                                style: showDetailSheetField,
                              ),
                              people.verifiedBy != null
                                  ? SizedBox(
                                      width: 250.0,
                                      child: Text('${people.verifiedBy}'))
                                  : Text('none', style: showDetailSheetValue)
                            ],
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 18.0,
                      right: 18.0,
                      child: Container(
                        width: 100.0,
                        padding: EdgeInsets.all(2.0),
                        // color: Colors.limeAccent,
                        child: Column(
                          children: <Widget>[
                            //change status
                            PopupMenuButton<String>(
                              itemBuilder: ((context) => [
                                    PopupMenuItem(
                                      value: 'Verified',
                                      child: Text('Verified'),
                                    ),
                                    PopupMenuItem(
                                      value: 'Unverified',
                                      child: Text('Unverified'),
                                    ),
                                    PopupMenuItem(
                                      value: 'Done',
                                      child: Text('Done'),
                                    ),
                                    PopupMenuItem(
                                      value: 'Spam',
                                      child: Text('Spam'),
                                    ),
                                  ]),
                              onSelected: (index) {
                                setState(() {
                                  status = index;
                                  print(status);
                                  Provider.of<dataService>(context,
                                          listen: false)
                                      .changeStatus(people, status);
                                  Navigator.pop(context);
                                });
                              },
                              tooltip: 'Change status',
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    height: 35.0,
                                    padding: EdgeInsets.all(2.0),
                                    child: Text(status),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      // color: statusColor,
                                      border: Border.all(
                                          color: statusColor, width: 2.0),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(40.0),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 3.0),
                                  Text(
                                    'Tap to change',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 12.0,
                                        color: Colors.grey[700]),
                                  ),
                                ],
                              ),
                              offset: Offset(0, 100),
                            ),
                            SizedBox(height: 5),
                            Text(
                              'Note: your number will be saved for futher authenticity',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 12.0, color: Colors.grey[400]),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                )
              ],
            );
          });
    }

    return Padding(
          padding: EdgeInsets.only(bottom: 10.0),
          child: InkWell(
            onTap: () {
              showDetailOfPeople(people);

            },
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(3.0),
                    bottomLeft: Radius.circular(3.0),
                    bottomRight: Radius.circular(3.0),
                    topRight: Radius.circular(3.0),
                  )),
              child: Stack(
                children: <Widget>[
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(people.name,
                            style: TextStyle(
                                fontFamily: 'Futura-medium', fontSize: 18.0)),
                        Text(people.occupation,
                            style: TextStyle(
                                fontFamily: 'Futura-light', fontSize: 14.0)),
                        Text('Family : ${people.member}',
                            style: TextStyle(
                                fontFamily: 'Futura-light', fontSize: 14.0))
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        status,
                        style: TextStyle(
                            fontSize: 12.0,
                            color: Colors.white,
                            fontFamily: 'Futura-medium',
                            letterSpacing: 1),
                      ),
                      width: 80.0,
                      height: 25.0,
                      decoration: BoxDecoration(
                          color: statusColor,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15.0),
                            bottomLeft: Radius.circular(15.0),
                            bottomRight: Radius.circular(15.0),
                            topRight: Radius.circular(3.0),
                          )),
                    ),
                  ),
                  Positioned(
                      bottom: 0.0,
                      right: 0.0,
                      child: IconButton(
                        icon: Icon(Icons.call, color: blueCol, size: 32.0),
                        onPressed: () {

                          launch("tel:${people.number}");
                        },
                      ))
                ],
              ),
            ),
          ),
        ) ??
        Text('ERROR PERSIST');
  }
}

/*  List<bool> too = List.generate(3, (_)=>false);
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: Text(
                                          'Change Status',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontFamily: 'Futura-book',
                                              fontSize: 20.0),
                                        ),
                                        titlePadding: EdgeInsets.only(top: 8.0),
                                        elevation: 0.0,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(3.0))),
                                        actions: <Widget>[
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              ToggleButtons(
                                                children: <Widget>[
                                                  Icon(Icons.add_call),
                                                  Icon(Icons.airline_seat_flat),
                                                  Icon(Icons.add_location),
                                                ],
                                                isSelected: too,
                                                onPressed: (int index) {
                                                  setState(() {
                                                    too[index] = !too[index];
                                                  });
                                                },
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: <Widget>[
                                                  OutlineButton(
                                                    onPressed: () {
                                                      setState(() {
                                                        changeStatus = 'ver';

                                                        print(
                                                            'Initial Status : $intialStatus');
                                                        print(
                                                            'changed Status : $changeStatus');
                                                      });
                                                    },
                                                    child: Chip(
                                                      backgroundColor:
                                                          Colors.green,
                                                      label: Container(
                                                        width: 70.0,
                                                        alignment:
                                                            Alignment.center,
                                                        child: Text(
                                                          'Verified',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontFamily:
                                                                  'Futura-medium'),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  MaterialButton(
                                                    materialTapTargetSize:
                                                        MaterialTapTargetSize
                                                            .shrinkWrap,
                                                    onPressed: () {
                                                      setState(() {
                                                        changeStatus = 'unver';

                                                        print(
                                                            'Initial Status : $intialStatus');
                                                        print(
                                                            'changed Status : $changeStatus');
                                                      });
                                                    },
                                                    child: Chip(
                                                      backgroundColor:
                                                          Colors.grey[400],
                                                      label: Container(
                                                        width: 70.0,
                                                        alignment:
                                                            Alignment.center,
                                                        child: Text(
                                                            'Unverified',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontFamily:
                                                                    'Futura-medium')),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: <Widget>[
                                                  MaterialButton(
                                                    materialTapTargetSize:
                                                        MaterialTapTargetSize
                                                            .shrinkWrap,
                                                    onPressed: () {
                                                      setState(() {
                                                        changeStatus = 'done';

                                                        print(
                                                            'Initial Status : $intialStatus');
                                                        print(
                                                            'changed Status : $changeStatus');
                                                      });
                                                    },
                                                    child: Chip(
                                                      backgroundColor:
                                                          Colors.orange,
                                                      label: Container(
                                                        width: 70.0,
                                                        alignment:
                                                            Alignment.center,
                                                        child: Text(
                                                          'Done',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontFamily:
                                                                  'Futura-medium'),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  MaterialButton(
                                                    materialTapTargetSize:
                                                        MaterialTapTargetSize
                                                            .shrinkWrap,
                                                    onPressed: () {
                                                      setState(() {
                                                        changeStatus = 'spam';

                                                        print(
                                                            'Initial Status : $intialStatus');
                                                        print(
                                                            'changed Status : $changeStatus');
                                                      });
                                                    },
                                                    child: Chip(
                                                      backgroundColor:
                                                          Colors.redAccent,
                                                      label: Container(
                                                        width: 70.0,
                                                        alignment:
                                                            Alignment.center,
                                                        child: Text('Spam',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontFamily:
                                                                    'Futura-medium')),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: 8),
                                              RaisedButton(
                                                onPressed: () {
                                                  Provider.of<dataService>(
                                                          context,
                                                          listen: false)
                                                      .changeStatus(
                                                          people, changeStatus);
                                                  Navigator.pop(context);
                                                  Toast.show(
                                                      'Status changed Succesfully',
                                                      context,
                                                      gravity: Toast.BOTTOM,
                                                      textColor: Colors.white,
                                                      duration: 3);
                                                },
                                                child: Text('Confirm'),
                                              ),
                                              Text(
                                                'Note: your number will be saved for futher authenticity',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontSize: 14.0,
                                                    color: Colors.grey[400]),
                                              ),
                                            ],
                                          ),
                                        ],
                                      );
                                    });
                                //------------------------------Container(
                                height: 35.0,
                                padding: EdgeInsets.all(2.0),
                                child: Center(
                                    child: Text(
                                  status,
                                  style: TextStyle(
                                      fontSize: 12.0,
                                      color: Colors.white,
                                      fontFamily: 'Futura-medium',
                                      letterSpacing: 1),
                                )),
                                decoration: BoxDecoration(
                                  color: statusColor,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(40.0)),
                                ),
                              ),
                                */
