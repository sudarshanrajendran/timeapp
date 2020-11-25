import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'dart:async';


class AlarmFunc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "time",
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Homepage(),
    );;
  }
}



class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> with TickerProviderStateMixin {
  int hour = 0;
  int min = 0;
  int sec = 0;
  int currenthour = 0;
  int currentmin = 0;
  int currentsec = 0;
  int finalhour = 0;
  int finalmin = 0;
  int finalsec = 0;
  bool started = true;
  bool stopped = true;
  int timeForTimer = 0;
  String timetodisplay = "";
  bool checktimer = true;

  @override

  void start() {
    setState(() {
      started = false;
      stopped = false;
    });

    //INSERT CALL FOR THE DIFFERENCE BTWN CURRENT TIME AND NUMBER PICKER TIME
    DateTime now = DateTime.now();
    currenthour = now.hour;
    currentmin  = now.minute;
    currentsec  = now.second;
    //print('The current time is= $currenthour : $currentmin : $currentsec');

    //CALC TIME DIFF
    //hours
    if( (hour==currenthour) && (currentmin>min)){
      finalhour=23;
    }
    else if((hour==currenthour+1) && (currentmin>=0)){
      finalhour=0;
    }
    else if (hour>currenthour){
      finalhour = hour - currenthour;
    }
    else if(hour==currenthour){
      finalhour=0;
    }
    else{
      finalhour = 23 - (currenthour-hour);
    }

    //minutes
    if ( (hour==currenthour) && (min==currentmin) ){
      finalsec=59;
    }
    else if( (min==currentmin+1)&&(currentsec>0) ){
      finalmin=0;
    }
    else if (min>=currentmin){
      finalmin = min - currentmin;
    }
    /*else if( (min==currentmin) && (currentsec>sec)){
      finalmin=59;
    }
    else if(min==currentmin){
      finalmin=0;
    }*/
    else{
      finalmin = 59 - (currentmin-min);
    }

    //seconds
    if (sec>=currentsec){
      finalsec = sec - currentsec;
    }
    else{
      finalsec = 59 - (currentsec-sec);
    }


    timeForTimer = ((finalhour * 60 * 60) + (finalmin * 60) + finalsec);
    //debugPrint(timeForTimer.toString());//TO CHECK IF NUMBER PICKER IS WORKING

    Timer.periodic(
        Duration(
          seconds: 1,
        ), (Timer t) {
      setState(() {
        if (timeForTimer < 1 || checktimer == false) {
          t.cancel();
          timeup(context);
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => Homepage(),
              ));
        } else if (timeForTimer < 60) {
          timetodisplay = timeForTimer.toString();
          timeForTimer = timeForTimer - 1;
        } else if (timeForTimer < 3600) {
          int m = timeForTimer ~/ 60;
          int s = timeForTimer - (60 * m);
          timetodisplay = m.toString() + ":" + s.toString();
          timeForTimer = timeForTimer - 1;
        } else {
          int h = timeForTimer ~/ 3600;
          int t = timeForTimer  -(3600 * h);
          int m = t ~/ 60;
          int s = t - (60 * m);
          timetodisplay =
              h.toString() + ":" + m.toString() + ":" + s.toString();
          timeForTimer = timeForTimer - 1;
        }
      });
    });
  }

  void stop() {
    setState(() {
      started = true;
      stopped = true;
      checktimer = false;
    });
  }

  void timeup (BuildContext context){
    var alertdialogue = AlertDialog(
      title: Text("ALERT!"),
      content: Text("Time's UP!"),
    );

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alertdialogue;
        }
    );
  }

  Widget timer() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 6,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: 10.0,
                      ),
                      child: Text(
                        "Hour",
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ), //Text
                    ),
                    NumberPicker.integer(
                        initialValue: hour,
                        minValue: 0,
                        maxValue: 23,
                        listViewWidth: 60.0,
                        onChanged: (val) {
                          setState(() {
                            hour = val;
                          });
                        }),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: 10.0,
                      ),
                      child: Text(
                        "Min",
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    NumberPicker.integer(
                        initialValue: min,
                        minValue: 0,
                        maxValue: 59,
                        listViewWidth: 60.0,
                        onChanged: (val) {
                          setState(() {
                            min = val;
                          });
                        }),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: 10.0,
                      ),
                      child: Text(
                        "Sec",
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ), //Text
                    ),
                    NumberPicker.integer(
                        initialValue: sec,
                        minValue: 0,
                        maxValue: 59,
                        listViewWidth: 60.0,
                        onChanged: (val) {
                          setState(() {
                            sec = val;
                          });
                        }),
                  ],
                ),
              ],
            ),
          ), //Expanded
          Expanded(
            flex: 1,
            child: Text(
              timetodisplay,
              style: TextStyle(
                fontSize: 35.0,
                fontWeight: FontWeight.w600,
              ),
            ), //Text
          ), //Expanded
          Expanded(
            flex: 3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RaisedButton(
                  onPressed: started ? start : null,
                  padding: EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 10.0,
                  ),
                  color: Colors.green,
                  child: Text(
                    "START",
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
                RaisedButton(
                  onPressed: stopped ? null : stop,
                  padding: EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 10.0,
                  ),
                  color: Colors.red,
                  child: Text(
                    "STOP",
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
              ],
            ),
          ), //Expanded
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Alarm",
        ),
        centerTitle: true,
      ),
      body: timer(),
    );
  }
}