import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  final String team1;
  final String team2;

  const MyCard({required this.team1, required this.team2});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      decoration: const BoxDecoration(
          color: Color.fromARGB(255, 61, 61, 61),
          borderRadius: BorderRadius.all(Radius.circular(25))),
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      child: Center(
        child: SizedBox(
          height: 100,
          child: Column(
            children: [
              SizedBox(
                height: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Flexible(
                      child: Text(
                        team1,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 14),
                            textAlign: TextAlign.center,
                      ),
                    ),
                    const Text(
                      "vs",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Flexible(
                      child: Text(
                        team2,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 14),
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    SizedBox(
                      child: Center(
                          child: Text(
                        "1",
                        style: TextStyle(color: Colors.white, fontSize: 17),
                      )),
                    ),
                    SizedBox(
                      child: Center(
                          child: Text(
                        "Draw",
                        style: TextStyle(color: Colors.white, fontSize: 17),
                      )),
                    ),
                    SizedBox(
                      child: Center(
                          child: Text(
                        "2",
                        style: TextStyle(color: Colors.white, fontSize: 17),
                      )),
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
