import 'dart:convert';
import 'dart:io';
import 'package:betting_app/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import '../widgets/myCard.dart';

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
          s['markets'],
          s['totals'],
          s['over'],
          s['under'],
          s['v'],
          s['type']);
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text(
                "League",
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
              Text(
                league,
                style: const TextStyle(color: Colors.white),
              )
            ],
          ),
          const SizedBox(height: 20),
          Expanded(
            child: FutureBuilder<dynamic>(
                future: getOddsData(),
                builder: (context, snapshot) {
                  if (snapshot.data == null) {
                    return const Center(
                      child: SpinKitFoldingCube(color: Colors.white,size: 40),
                    );
                  } else {
                    return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return MyCard(
                            team1: snapshot.data[index].team1,
                            team2: snapshot.data[index].team2,
                            score1: snapshot.data[index].score1.toString(),
                            score2: snapshot.data[index].score2.toString(),
                            minute: snapshot.data[index].minute.toString(),
                            seconds: snapshot.data[index].seconds.toString(),
                          );
                        });
                  }
                }),
          )
        ],
      ),
    );
  }
}
