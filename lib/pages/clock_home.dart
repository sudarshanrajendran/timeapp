import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ClockHome extends StatefulWidget {
  @override
  _ClockHomeState createState() => _ClockHomeState();
}

class _ClockHomeState extends State<ClockHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.grey[600],
        title: Text('Clock Home'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 100.0,
                  child: FlatButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/stopwatch');
                    },
                    color: Colors.orange,
                    child: Text(
                      'Stop Watch ⏱️',
                      style: TextStyle(
                        fontSize: 50.0,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 5.0),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 100.0,
                  child: FlatButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/timer');
                    },
                    color: Colors.blue,
                    child: Text(
                      'Timer ⌛',
                      style: TextStyle(
                        fontSize: 50.0,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height : 5.0),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 100.0,
                  child: FlatButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/alarm');
                    },
                    color: Colors.green,
                    child: Text(
                      'Alarm ⏰',
                      style: TextStyle(
                        fontSize: 50.0,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      )
    );
  }
}
