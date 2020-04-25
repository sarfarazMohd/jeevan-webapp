import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:webapp/model/peopleModel.dart';

class dataService extends ChangeNotifier {
  dataService() {
    mockPeopleData();

    for (var i = 0; i < _people.length; i++) {
      print(_people[i]);

      print('Mock method : people length ${_people.length}');
    }

    print('Length mock data ${_people.length}');
    notifyListeners();
  }

  final List<peopleAround> _people = [];

  UnmodifiableListView<peopleAround> get allPeople =>
      UnmodifiableListView(_people);

  List get allPeopleList => _people;

  changeStatus(peopleAround people, String newStatus) {
    _people.forEach((val) {
      if (val == people) {
        people.status = newStatus;
      }
    });
    notifyListeners();
  }

  void addPeople(peopleAround people) {
    _people.add(people);
    print('add in new Data');
    print('GETTING  ${people.toString()}');
    notifyListeners();
  }

  List<peopleAround> getPeople() {
    print('List of people around getPeople');

    return _people;
  }

  void mockPeopleData() {
    print('Adding fake data');
    _people.add(peopleAround(
        name: 'Suresh',
        occupation: 'Carpenter',
        member: '3',
        status: 'Verified',
        number: '8756459860',
        verifiedBy: ['9592378963', '9345631229', '9345631229', '9345631229']));

    _people.add(peopleAround(
        name: 'Bhakt',
        occupation: 'Proud Jobless',
        member: '0',
        status: 'Spam',
        number: '8756459860',
        verifiedBy: null));

    _people.add(peopleAround(
        name: 'Suraj',
        occupation: 'Daily Wager',
        member: '5',
        status: 'Unverified',
        number: '8756459860',
        verifiedBy: null));

    _people.add(peopleAround(
        name: 'Rahul',
        occupation: 'Painter',
        member: '2',
        status: 'Done',
        number: '8756459860',
        verifiedBy: null));

    _people.add(peopleAround(
        name: 'Arnab Goswami',
        occupation: 'GodiMedia Anchor',
        member: '0',
        status: 'Spam',
        number: '8756459860',
        verifiedBy: null));

    for (var i = 0; i < _people.length; i++) {
      print(_people[i]);

      print('Mock method : people length ${_people.length}');
    }

    print('Length mock data ${_people.length}');
    notifyListeners();
  }
}
