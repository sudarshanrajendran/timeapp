import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:async';

class StopWatchFunc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "time",
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: StopwatchHomepage(),
    );
  }
}

class StopwatchHomepage extends StatefulWidget {
  @override
  _StopwatchHomepageState createState() => _StopwatchHomepageState();
}
class _StopwatchHomepageState extends State<StopwatchHomepage> {
bool startispressed = true;
bool stopispressed = true;
bool resetispressed = true;
String stoptimetodisplay = "00:00:00";
var swatch = Stopwatch();
final dur = const Duration(seconds: 1);


void starttimer(){
  Timer(dur, keeprunning);
}

void keeprunning(){
  if(swatch.isRunning){
    starttimer();
  }
  setState(() {
    stoptimetodisplay = swatch.elapsed.inHours.toString().padLeft(2, "0") + ":"
                      + (swatch.elapsed.inMinutes%60).toString().padLeft(2, "0") + ":"
                      + (swatch.elapsed.inSeconds%60).toString().padLeft(2, "0");
  });
}


void startstopwatch(){
  setState((){
    stopispressed = false;
    startispressed = false;
  });
  swatch.start();
  starttimer();
}

void stopstopwatch(){
  setState(() {
    stopispressed = true;
    resetispressed = false;
  });
  swatch.stop();
}

void resetstopwatch(){
  setState(() {
    startispressed = true;
    resetispressed = true;
    stoptimetodisplay = "00:00:00";
  });
  swatch.reset();
}

Widget stopwatch(){
  return Container(
    child: Column(
      children: <Widget>[
        Expanded(
          flex: 6,
          child: Container(
            alignment: Alignment.center,
            child: Text(
              stoptimetodisplay,
              style: TextStyle(
                fontSize: 50.0
              ),
            ),
          ),
        ),
        Expanded(
          flex: 4,
            child: Container(
              child: Column(
                  mainAxisAlignment : MainAxisAlignment.spaceAround,
                children:<Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      RaisedButton(
                        onPressed: stopispressed ? null : stopstopwatch,
                        color: Colors.red,
                        padding: EdgeInsets.symmetric(
                          horizontal: 40.0,
                          vertical: 15.0,
                        ),
                        child: Text(
                          "Stop",
                        ),
                      ),
                      RaisedButton(
                        onPressed: resetispressed ? null : resetstopwatch,
                        color: Colors.purple,
                        padding: EdgeInsets.symmetric(
                          horizontal: 40.0,
                          vertical: 15.0,
                        ),
                        child: Text(
                          "Reset",
                        ),
                      ),
                    ],
                  ),
                  RaisedButton(
                    onPressed: startispressed ?  startstopwatch : null,
                    color: Colors.green,
                    padding: EdgeInsets.symmetric(
                      horizontal: 80.0,
                      vertical: 20.0,
                    ),
                    child: Text(
                      "Start",
                      style: TextStyle(
                        fontSize: 24.0,
                        color: Colors.white
                      ),
                    ),
                  ),
                ]
              )
            ),
        ),
      ],
    ),
  );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Stop Watch",
        ),
        centerTitle: true,
      ),
     body: stopwatch(),
    );
  }
}

