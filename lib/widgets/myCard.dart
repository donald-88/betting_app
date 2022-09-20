import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class MyCard extends StatelessWidget {
  const MyCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Card(
      color: Colors.grey,
      child: Center(
        child: Container(
          width: width,
          height: 100,
          child: Column(
            children: [
              Container(
                height: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [Text("Team1"), Text("VS"), Text("Team2")],
                ),
              ),
              Container(
                width: width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      color: Colors.white,
                      child: Center(child: Text("1")),
                      width: (width / 3) - 10,
                    ),
                    Container(
                      color: Colors.white,
                      child: Center(child: Text("Draw")),
                      width: (width / 3) - 10,
                    ),
                    Container(
                      color: Colors.white,
                      child: Center(child: Text("2")),
                      width: (width / 3) - 10,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
