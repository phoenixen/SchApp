import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/appBar.dart';
import 'package:flutter_application_1/widgets/navPop.dart';
import 'package:intl/intl.dart';

class Pomodoro extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Pomodoro> {
  int _seconds = 00;
  int _minutes = 25;
  Timer _timer;
  var f = NumberFormat("00");

   void _resetTimer() {
    if (_timer != null) {
      _timer.cancel();
      _seconds = 0;
      _minutes = 25;
    }
  }

  void _stopTimer() {
    if (_timer != null) {
      _timer.cancel();
      _seconds = _seconds;
      _minutes = _minutes;
    }
  }

  void _startTimer() {
    if (_timer != null) {
      _stopTimer();
    }
    if (_minutes > 0) {
      _seconds = _minutes * 60;
    }
    if (_seconds > 60) {
      _minutes = (_seconds / 60).floor();
      _seconds -= (_minutes * 60);
    }
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_seconds > 0) {
          _seconds--;
        } else {
          if (_minutes > 0) {
            _seconds = 59;
            _minutes--;
          } else {
            _timer.cancel();
            print("Timer Complete");
          }
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(navPop(context)),
      backgroundColor: Colors.grey.shade900,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${f.format(_minutes)} : ${f.format(_seconds)}",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 48,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 275,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RaisedButton(
                onPressed: () {
                  setState(() {
                    _stopTimer();
                  });
                },
                color: Colors.grey.shade900,
                shape: CircleBorder(
                    side: BorderSide(color: Colors.white)),
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Text(
                    "Dur",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ),
              ),
              RaisedButton(
                onPressed: () {
                  _startTimer();
                },
                color: Colors.grey.shade900,
                shape: CircleBorder(
                    side: BorderSide(color: Colors.white)),
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Text(
                    "Başla",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ),
              ),

              RaisedButton(
                onPressed: () {
                  _resetTimer();
                },
                color: Colors.grey.shade900,
                shape: CircleBorder(
                    side: BorderSide(color: Colors.white)),
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Text(
                    "Sıfırla",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ),
              ),
            ],
          ),
          
        ],
      ),
    );
  }
}
