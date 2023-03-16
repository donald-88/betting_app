import 'dart:convert';
import 'dart:io';
import 'package:betting_app/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import '../widgets/myCard.dart';
import '../widgets/notificationsCard.dart';

class MyNotifications extends StatefulWidget {
  const MyNotifications({super.key});

  @override
  State<MyNotifications> createState() => _MyNotificationsState();
}

class _MyNotificationsState extends State<MyNotifications> {
  @override
  List slips = [];
  List filteredList = [];

  final String league = 'UEFA Nations League';

  getOddsData() async {
    var response = await http.get(
        Uri.https('api.betting-api.com', '1xbet/football/live/all'),
        headers: {
          HttpHeaders.authorizationHeader:
              '58be903e11884db0a97eea600fda6bfe271c174c668d48e4bf56f11b3ac19cd8'
        });

    var jsonData = jsonDecode(response.body);

    for (var s in jsonData) {
      Slip slip = Slip(
          s['team1'],
          s['team2'],
          s['title'],
          s['score1'],
          s['score2'],
          s['minute'],
          s['seconds'],
          // s['markets'],
          // s['totals'],
          // s['over'],
          // s['under'],
          // s['v'],
);
      slips.add(slip);
    }

    for (var filter in slips.where((element) => element.title == league)) {
      filteredList.add(filter);
      for (var f in filter.markets['totals']) {
        print(f['under']);
      }
    }
    return filteredList;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          
          children: [
          NotificationsCard()
        ]),
      ),
    );
  }
}
