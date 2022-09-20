import 'package:betting_app/widgets/myCard.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade800,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(FontAwesomeIcons.bars),
          color: Colors.white,
        ),
        backgroundColor: Colors.grey.shade800,
        title: const Text(
          "Betting App",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          SizedBox(height: 20),
          MyCard(),
          MyCard(),
          MyCard(),
          MyCard(),
          MyCard(),
          MyCard(),
          MyCard()
        ],
      ),
    );
  }
}
