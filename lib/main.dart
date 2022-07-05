import 'dart:ui';
import 'package:blur/blur.dart';
import 'package:crudoperation/booktable.dart';
import 'package:flutter/material.dart';
import 'booktable.dart';
import 'owner.dart';

void main() {
  runApp(MaterialApp(routes: {
    'owner': (context) => owner(),
    'booktable': (context) => booktable(),
  }, home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 18, top: 2, right: 18),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                /*     Icon(
                    Icons.local_drink,
                    color: Colors.white,
                    size: 30,
                  ),
                  */
                Container(
                  child: Text(
                    "CluTab",
                    style: TextStyle(
                        fontFamily: 'Shandora',
                        color: Color(0xf3ffffff),
                        fontSize: 35),
                  ),
                ),
                SizedBox(
                  width: 176,
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const owner()),
                      );
                    },
                    child: Text(
                      "Owner",
                      textAlign: TextAlign.end,
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'good',
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ))
              ],
            ),
          ), //topcontainer
          Container(
            padding: EdgeInsets.only(left: 16, right: 16, top: 12, bottom: 12),
            child: Image.asset('Images/playboy.jpg').blurred(
              colorOpacity: 0.3,
              blurColor: Colors.black,
              borderRadius: BorderRadius.horizontal(
                  right: Radius.circular(20), left: Radius.circular(20)),
              blur: 3,
              overlay: Align(
                alignment: Alignment.center,
                child: Text(
                  '  Play Boy Club\n'
                  'Opening Soon !!',
                  style: TextStyle(
                      fontSize: 29,
                      color: Colors.white70,
                      fontFamily: 'Playclub'),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 18, top: 20),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Popular",
                style: TextStyle(
                    fontSize: 22,
                    color: Color(0xf4ffffff),
                    fontFamily: 'Playclub'),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16, top: 15),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                'Images/street club.jpg',
                fit: BoxFit.fill,
                alignment: Alignment.center,
                height: 180,
                width: 141,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16, top: 15),
            child: FlatButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const booktable()),
                  );
                },
                color: Color(0xff19A02E),
                minWidth: 142,
                height: 40,
                child: Text(
                  'Book Table',
                  style:
                      TextStyle(color: Colors.white70, fontFamily: 'Playclub'),
                )),
          )
        ],
      )),
    );
  }
}
