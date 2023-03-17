import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  final String team1;
  final String team2;
  final String score1;
  final String score2;
  final String minute;
  final String odds;
  final Color color;

  const MyCard(
      {required this.team1,
      required this.team2,
      required this.score1,
      required this.score2,
      required this.minute,
      required this.odds,
      required this.color});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    TextStyle winText = const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold);
    TextStyle loseText = const TextStyle(color: Colors.white, fontSize: 12,);

    return Container(
      width: width-32,
      decoration:  BoxDecoration(
          color: Colors.grey.shade800,
          borderRadius: const BorderRadius.all(Radius.circular(12))),
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 80,
            height: 90,
            decoration: BoxDecoration(color: color, borderRadius: const BorderRadius.all(Radius.circular(12))),
            child:  Center(child: Text("x$odds",style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600,),)),
          ),
          const SizedBox(width: 10),
          SizedBox(
            width: width - 138,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(team1, style: winText,overflow: TextOverflow.ellipsis,),
                          const SizedBox(height: 5,),
                          Text(team2, style: loseText,overflow: TextOverflow.ellipsis,)
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 32,
                      child: Column(
                        children: [
                          Text(score1, style: winText,),
                          const SizedBox(height: 5,),
                          Text(score2, style: loseText,),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10,),
                    SizedBox(
                      width: 32,
                      child: Text('$minute`' , style: winText,))
                  ],
                ),
                 Divider(
                  thickness: 1,color: Colors.grey.shade700,
                ),
                Row(children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.pink.shade100, borderRadius: const BorderRadius.all(Radius.circular(25))
                    ),child: const Text("BTS",style: TextStyle(fontSize: 10),),
                  )
                ],),
                
              ],
            ),
          ),
          
          
        ],
      ),
    );
  }
}
