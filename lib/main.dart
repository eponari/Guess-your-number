import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math';

void main() {
  runApp(
    MaterialApp(home: MyApp()), // use MaterialApp
  );
}


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static int userNumber = 50;
  static Random generator = Random();
  static int computerNumber = generator.nextInt(100);
  static int guesses = 0;
  static String showUser = "";
  static String currentMessage = "";
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff303F9F),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "I am thinking about a number from 1 to 100.",
                  style: GoogleFonts.alatsi(
                    fontSize: 18,
                    color: Color(0xffFFFFFF),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "What's your guess?",
                  style: GoogleFonts.alatsi(
                      fontSize: 18, color: Color(0xffFFFFFF)),
                )
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  userNumber.toString(),
                  style: GoogleFonts.aBeeZee(
                    fontSize: 19,
                    color: Color(0xffFFFFFF),
                  ),
                ),
                Column(
                  children: <Widget>[
                    buildFlatButton(Icons.arrow_upward, () {
                      if (userNumber != 100) {
                        userNumber++;
                      }
                    }, () {
                      userNumber = 100;
                    }),
                    buildFlatButton(Icons.arrow_downward, () {
                      if (userNumber != 0) {
                        userNumber--;
                      }
                    }, () {
                      userNumber = 0;
                    }),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                color: Color(0xff3F51B5),
              ),
              child: FlatButton(
                onPressed: () {
                  setState(() {
                    showUser = compareGuess(computerNumber, userNumber);
                    if(userNumber==computerNumber){
                      computerNumber=generator.nextInt(100);
                    }
                  });
                },
                child: Text("Guess",
                  style: GoogleFonts.aBeeZee(
                    fontSize: 19,
                    color: Color(0xffFFFFFF),
                  ),),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              showUser,
              textAlign: TextAlign.center,
              style: GoogleFonts.aBeeZee(
                fontSize: 19,
                color: Color(0xffFFFFFF),
              ),
            ),
          ],
        ),
      ),
    );
  }

  FlatButton buildFlatButton(
      IconData mainIcon, Function onPressedValue, Function onLongPressValue) {
    return FlatButton(
      child: Icon(
        mainIcon,
        size: 20,
        color: Color(0xffFFFFFF),
      ),
      onPressed: () {
        setState(() {
          onPressedValue();
        });
      },
      onLongPress: () {
        setState(() {
          onLongPressValue();
        });
      },
    );
  }
}

String compareGuess(int computerNumber, userNumber) {
  if (computerNumber == userNumber) {
    return "Good job! You found it!\nThe number has been randomized again!";
  }
  return (computerNumber > userNumber)
      ? "The number is greater."
      : "The number is smaller.";
}
