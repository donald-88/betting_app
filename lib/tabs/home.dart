import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import '../dashboard.dart';
import '../widgets/myCard.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  

  final String league = 'UEFA Europa League';

  getOddsData() async {
    var response = await http.get(
        Uri.https('api.betting-api.com', '1xbet/football/live/all'),
        headers: {
          HttpHeaders.authorizationHeader:
              '58be903e11884db0a97eea600fda6bfe271c174c668d48e4bf56f11b3ac19cd8'
        });

    List jsonData = jsonDecode(response.body);

    List filtered = jsonData.where((element) => element['title'] == league).toList();
    
    return filtered;
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
                              team1: snapshot.data[index]['team1'],
                              team2: snapshot.data[index]['team2'],
                              score1: snapshot.data[index]['score1'].toString(),
                              score2: snapshot.data[index]['score2'].toString(),
                              minute: snapshot.data[index]['minute'].toString(),
                              seconds: snapshot.data[index]['seconds'].toString(),
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