import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stone Paper Sizer',
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.yellow,
            title: Text(
              'Stone Paper Sizer',
              style:
                  TextStyle(fontFamily: 'ShareTechMono', color: Colors.black),
            ),
          ),
          body: GamePage(),
        ),
      ),
    );
  }
}

class GamePage extends StatefulWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  var pl = 0;
  var comp = 0;
  var res = '';
  var pimg = 1;
  var uimg = 4;

  void myGame(int x, int y) {
    if (pl == 0 && comp == 0) res = '';
    int z = -1;
    int c = uimg - 3;
    if (pimg == 1 && c == 2 || pimg == 2 && c == 3 || pimg == 3 && c == 1) {
      z = 1;
    } else if (pimg == 1 && c == 3 ||
        pimg == 2 && c == 1 ||
        pimg == 3 && c == 2) {
      z = 0;
    }
    if (z == 0) {
      pl++;
    } else if (z == 1) {
      comp++;
    }
    if (pl == 10 || comp == 10) {
      if (pl == 10) res = 'You Won! 😃';
      if (comp == 10) res = 'You Lose 😔';
      pl = 0;
      comp = 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/bg4.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              //Player vs Computer
              padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    child: Text(
                      'Player',
                      style: TextStyle(
                        color: Colors.yellow,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'ShareTechMono',
                      ),
                    ),
                  ),
                  Container(
                    child: Text(
                      'Computer',
                      style: TextStyle(
                        color: Colors.yellow,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'ShareTechMono',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              //Score
              padding: EdgeInsets.fromLTRB(22.0, 10.0, 22.0, 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    child: Text(
                      '$pl',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Audiowide',
                      ),
                    ),
                  ),
                  Container(
                    child: Text(
                      '$comp',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Audiowide',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 100.0,
            ),
            Container(
              // Display Images
              padding: EdgeInsets.fromLTRB(22.0, 10.0, 22.0, 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: Image.asset('images/ig$pimg.png'),
                  ),
                  SizedBox(
                    width: 70.0,
                  ),
                  Expanded(
                    child: Image.asset('images/ig$uimg.png'),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 120.0,
            ),
            Container(
              // Input Images
              padding: EdgeInsets.fromLTRB(22.0, 10.0, 22.0, 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    // ignore: deprecated_member_use
                    child: FlatButton(
                      onPressed: () {
                        setState(() {
                          pimg = 1;
                          uimg = Random().nextInt(3) + 4;
                          myGame(pimg, uimg);
                        });
                      },
                      child: Image.asset('images/ig1.png'),
                    ),
                  ),
                  Expanded(
                    // ignore: deprecated_member_use
                    child: FlatButton(
                      onPressed: () {
                        setState(() {
                          pimg = 2;
                          uimg = Random().nextInt(3) + 4;
                          myGame(pimg, uimg);
                        });
                      },
                      child: Image.asset('images/ig2.png'),
                    ),
                  ),
                  Expanded(
                    // ignore: deprecated_member_use
                    child: FlatButton(
                      onPressed: () {
                        setState(() {
                          pimg = 3;
                          uimg = Random().nextInt(3) + 4;
                          myGame(pimg, uimg);
                        });
                      },
                      child: Image.asset('images/ig3.png'),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50.0,
            ),
            Container(
              // Result
              padding: EdgeInsets.all(25.0),
              child: Center(
                child: Text(
                  res,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'VT323',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
