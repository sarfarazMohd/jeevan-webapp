import 'package:flutter/material.dart';

class peopleAround {
   String name;
   String occupation;
   String member;
   String status;
   String number;
   List<String> verifiedBy;

  peopleAround(
      {@required this.name,
      @required this.occupation,
      @required this.member,
      @required this.status,
      @required this.number,
      this.verifiedBy});

  @override
  String toString() {
    print('Name : $name');
    print('Occupation : $occupation');
    print('Member : $member');
    print('Status : $status');
    print('Number : $number');
    print('Verified By : $verifiedBy');
    print('Name : ' + name);
    return super.toString();
  }
}

// List<peopleAround> getPeople = [
//   peopleAround(
//       name: 'Suresh',
//       occupation: 'Carpenter',
//       member: '3',
//       status: 'ver',
//       number: '8756459860',
//       verifiedBy: ['9592378963','9345631229','9345631229','9345631229']),
//   peopleAround(
//       name: 'Bhakt',
//       occupation: 'Proud Jobless',
//       member: '0',
//       status: 'spam',
//       number: '8756459860',
//       verifiedBy: null),
//   peopleAround(
//       name: 'Suraj',
//       occupation: 'Daily Wager',
//       member: '5',
//       status: 'unver',
//       number: '8756459860',
//       verifiedBy: null),
//   peopleAround(
//       name: 'Rahul',
//       occupation: 'Painter',
//       member: '2',
//       status: 'done',
//       number: '8756459860',
//       verifiedBy: null),
//   peopleAround(
//       name: 'Arnab Goswami',
//       occupation: 'GodiMedia Anchor',
//       member: '0',
//       status: 'spam',
//       number: '8756459860',
//       verifiedBy: null),
// ];
