import 'package:betting_app/tabs/home.dart';
import 'package:betting_app/tabs/myNotifications.dart';
import 'package:betting_app/tabs/wallet.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int currentIndex = 0;

  final screens = [const Home(), const MyNotifications(), const Wallet()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 41, 41, 41),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 41, 41, 41),
        title: const Text(
          "Get Money!!!",
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.white,
          unselectedItemColor: const Color.fromARGB(255, 151, 151, 151),
          currentIndex: currentIndex,
          onTap: (index) => setState(() => currentIndex = index),
          backgroundColor: const Color.fromARGB(255, 41, 41, 41),
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Iconsax.home,
                  color: Color.fromARGB(255, 151, 151, 151),
                ),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(
                  Iconsax.notification,
                  color: Color.fromARGB(255, 151, 151, 151),
                ),
                label: 'Notifications'),
            BottomNavigationBarItem(
                icon: Icon(
                  Iconsax.wallet,
                  color: Color.fromARGB(255, 151, 151, 151),
                ),
                label: 'Wallet')
          ]),
    );
  }
}

class Slip {
  final String team1, team2, title;
  final int score1, score2, minute, seconds /*type*/;
  // final Map markets, over, under, totals;

  Slip(
      this.team1,
      this.team2,
      this.title,
      this.score1,
      this.score2,
      this.minute,
      this.seconds,
      // this.markets,
      // this.totals,
      // this.over,
      // this.under,
      // this.v,
      );
}
