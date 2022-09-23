import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  final String team1;
  final String team2;
  final String score1;
  final String score2;
  final String minute;
  final String seconds;

  const MyCard(
      {required this.team1,
      required this.team2,
      required this.score1,
      required this.score2,
      required this.minute,
      required this.seconds});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      decoration: const BoxDecoration(
          color: Color.fromARGB(255, 61, 61, 61),
          borderRadius: BorderRadius.all(Radius.circular(25))),
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Center(
        child: SizedBox(
            height: 100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          width: (width - 20) / 2.5,
                          child: Text(
                            team1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 14),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Text(
                          score1,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 17),
                        )
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text('vs',
                            style:
                                TextStyle(color: Colors.white, fontSize: 14))
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          width: (width - 20) / 2.5,
                          child: Text(
                            team2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 14),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Text(
                          score2,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 17),
                        )
                      ],
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center ,
                  children: [
                    Text(
                      "Time - $minute : $seconds",
                      style: const TextStyle(fontSize: 14, color: Colors.white),
                    )
                  ],
                )
              ],
            )),
      ),
    );
  }
}
