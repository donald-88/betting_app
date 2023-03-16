import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import '../widgets/myCard.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List leagues = [
    'EPL',
    'LFP',
    'DFL',
    'Serie A',
    'Ligue 1',
    'UCL',
    'UEL',
  ];

  List odds = [
    1.0,1.1,1.2,1.3
  ];

  List<Color> chipColors = [
    Colors.amber.shade300,
    Colors.green.shade300,
    Colors.blue.shade300,
    Colors.teal.shade300,
    Colors.pink.shade300,
    Colors.purple.shade300,
    Colors.orange.shade300
  ];
  
  

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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 8),
              const Text("Get Money!!", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),
              const SizedBox(height: 28),
              SizedBox(
                height: 40,
                width: double.infinity,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: leagues.length,
                  itemBuilder: (context, index){
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 4),
                    child: FilterChip(label: Text(leagues[index]),selectedColor: Colors.amber ,onSelected: (bool value){}));
                }),
              ),
              SizedBox(height: 8),
              SizedBox(
                height: 40,
                width: double.infinity,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: odds.length,
                  itemBuilder: (context, index){
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 4),
                    child: FilterChip(
                      label: Text('x${odds[index].toString()}'), onSelected: (bool value){}));
                }),
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
        ),
      );
  }
}