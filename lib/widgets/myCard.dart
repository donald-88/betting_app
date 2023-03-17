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
    TextStyle winText = TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold);
    TextStyle loseText = TextStyle(color: Colors.white, fontSize: 14,);

    return Container(
      width: width-32,
      decoration:  BoxDecoration(
          color: Colors.grey.shade800,
          borderRadius: const BorderRadius.all(Radius.circular(12))),
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 80,
            height: 90,
            decoration: BoxDecoration(color: Colors.red.shade100, borderRadius: const BorderRadius.all(Radius.circular(12))),
            child: Center(child: Text("x1.0",style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600,),)),
          ),
          SizedBox(width: 10),
          SizedBox(
            width: width-192,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(team1, style: winText),
                    Text(score1, style: winText,)
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(team2, style: loseText),
                    Text(score2, style: loseText,)
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            width: 60,
            child: Center(child: Text(minute + r'`', style: winText,)))
          
        ],
      ),
    );
  }
}
