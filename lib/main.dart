import 'package:flutter/material.dart';
import 'package:world_time/pages/alarm.dart';
import 'package:world_time/pages/choose_loaction.dart';
import 'package:world_time/pages/clock_home.dart';
import 'package:world_time/pages/home.dart';
import 'package:world_time/pages/loading.dart';
import 'package:world_time/pages/stop_watch.dart';
import 'package:world_time/pages/timer.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/' : (context) => Loading(),
    '/home' : (context) => Home(),
    '/location' : (context) => ChooseLocation(),
    '/clockhome' : (context) => ClockHome(),
    '/stopwatch' : (context) => StopWatchFunc(),
    '/timer' : (context) => TimerFunc(),
    '/alarm' : (context) => AlarmFunc(),
  },
));


