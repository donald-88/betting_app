import 'package:betting_app/widgets/myCard.dart';
import 'package:flutter/material.dart';
import '../widgets/notificationsCard.dart';

class MyNotifications extends StatefulWidget {
  const MyNotifications({super.key});

  @override
  State<MyNotifications> createState() => _MyNotificationsState();
}

class _MyNotificationsState extends State<MyNotifications> {
  @override


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          
          children: [
          MyCard(team1: 'Manchester United', team2: 'Chelsea', score1: '4', score2: '1', minute: '10', seconds: '0')
        ]),
      ),
    );
  }
}
