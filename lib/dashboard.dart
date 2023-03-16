import 'package:betting_app/tabs/home.dart';
import 'package:betting_app/tabs/myNotifications.dart';
import 'package:betting_app/tabs/wallet.dart';
import 'package:flutter/cupertino.dart';
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
          selectedFontSize: 14,
          unselectedFontSize: 12,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey.shade500,
          selectedIconTheme: const CupertinoIconThemeData(color: Colors.white, fill: 1),
          unselectedIconTheme: const CupertinoIconThemeData(color: Colors.grey),
          currentIndex: currentIndex,
          onTap: (index) => setState(() => currentIndex = index),
          backgroundColor: const Color.fromARGB(255, 41, 41, 41),
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  CupertinoIcons.home,
                ),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(
                  CupertinoIcons.bell,
                ),
                label: 'Notifications'),
            BottomNavigationBarItem(
                icon: Icon(
                  CupertinoIcons.money_dollar,
                ),
                label: 'Wallet')
          ]),
    );
  }
}
