import 'package:flutter/material.dart';
import 'package:quiz/buttun.dart';
import 'package:quiz/pixel.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int numberOfSquares = 130;
  int playerPosition = 0;
  List<int> barriers = [
    11,
    13,
    15,
    17,
    18,
    31,
    33,
    35,
    37,
    38,
    51,
    53,
    55,
    57,
    58,
    71,
    73,
    75,
    77,
    78,
    91,
    93,
    95,
    97,
    98,
    111,
    113,
    115,
    117,
    118,
  ];

  void moveUp() {
    setState(() {
      if (playerPosition - 10 >= 0) {
        playerPosition -= 10;
      }
    });
  }

  void moveLeft() {
    setState(() {
      if (!(playerPosition % 10 == 0)) {
        playerPosition -= 1;
      }
    });
  }

  void moveRight() {
    setState(() {
      if (!(playerPosition % 10 == 9)) {
        playerPosition += 1;
      }
    });
  }

  void moveDown() {
    setState(() {
      if (playerPosition + 10 < numberOfSquares) {
        playerPosition += 10;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: Column(children: [
        Expanded(
            flex: 2,
            child: Container(
              child: GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: numberOfSquares,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 10),
                  itemBuilder: (BuildContext context, int index) {
                    if (playerPosition == index) {
                      return MyPixel(
                        color: Colors.white,
                        child: Text(index.toString()),
                      );
                    } else if (barriers.contains(index)) {
                      return MyPixel(
                        color: Colors.black,
                      );
                    } else {
                      return MyPixel(
                        color: Colors.grey,
                      );
                    }
                  }),
            )),
        Expanded(
            child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyButtun(),
                  MyButtun(
                    function: moveUp,
                    color: Colors.grey,
                    child: Icon(
                      Icons.arrow_drop_up,
                      size: 70,
                    ),
                  ),
                  MyButtun(),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyButtun(
                    function: moveLeft,
                    color: Colors.grey,
                    child: Icon(
                      Icons.arrow_left,
                      size: 70,
                    ),
                  ),
                  MyButtun(),
                  MyButtun(
                    function: moveRight,
                    color: Colors.grey,
                    child: Icon(
                      Icons.arrow_right,
                      size: 70,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyButtun(),
                  MyButtun(
                    function: moveDown,
                    color: Colors.grey,
                    child: Icon(
                      Icons.arrow_drop_down,
                      size: 70,
                    ),
                  ),
                  MyButtun(),
                ],
              ),
            ],
          ),
        ))
      ]),
    );
  }
}
