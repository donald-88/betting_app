import 'dart:convert';
import 'dart:io';

import 'package:betting_app/widgets/myCard.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:http/http.dart' as http;

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List slips = [];
  List filteredList = [];

  getOddsData() async {
    var response = await http.get(
        Uri.https('api.betting-api.com', '1xbet/football/live/all'),
        headers: {
          HttpHeaders.authorizationHeader:
              '58be903e11884db0a97eea600fda6bfe271c174c668d48e4bf56f11b3ac19cd8'
        });

    var jsonData = jsonDecode(response.body);

    for (var s in jsonData) {
      Slip slip = Slip(s['team1'], s['team2'], s['title'], s['score1'], s['score2'], s['minute'], s['seconds']);
      slips.add(slip);
    }

    for (var filter in slips.where((element) => element.title == 'UEFA Nations League')) {
      filteredList.add(filter);
    }
    return filteredList;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 41, 41, 41),
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          splashRadius: 16,
          icon: const Icon(Iconsax.menu),
          color: Colors.white,
        ),
        backgroundColor: const Color.fromARGB(255, 41, 41, 41),
        title: const Text(
          "Get Money Gang",
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              height: 50,
              decoration: const BoxDecoration(
                  color: Color.fromRGBO(61, 61, 61, 1),
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      const Text(
                        "League",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      IconButton(
                        splashRadius: 16,
                        icon: const Icon(
                          Iconsax.arrow_down_1,
                          size: 16,
                          color: Colors.white,
                        ),
                        onPressed: () {},
                      )
                    ],
                  ),
                  Row(
                    children: [
                      const Text(
                        "Bet Type",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      IconButton(
                        splashRadius: 16,
                        icon: const Icon(
                          Iconsax.arrow_down_1,
                          size: 16,
                          color: Colors.white,
                        ),
                        onPressed: () {},
                      )
                    ],
                  )
                ],
              ),
            ),
            Expanded(
              child: FutureBuilder<dynamic>(
                  future: getOddsData(),
                  builder: (context, snapshot) {
                    if (snapshot.data == null) {
                      return const Center(
                        child: Text('...Loading...'),
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
      ),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: const Color.fromARGB(255, 41, 41, 41),
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Iconsax.home,
                  color: Colors.white,
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: Icon(
                  Iconsax.notification,
                  color: Color.fromARGB(255, 151, 151, 151),
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: Icon(
                  Iconsax.wallet,
                  color: Color.fromARGB(255, 151, 151, 151),
                ),
                label: '')
          ]),
    );
  }
}

class Slip {
  final String team1, team2, title;
  final int score1, score2, minute, seconds;

  Slip(this.team1, this.team2,this.title, this.score1, this.score2, this.minute, this.seconds);
}
