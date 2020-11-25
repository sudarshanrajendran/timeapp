import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime(url: 'Asia/Kolkata'     , location: 'Kolkata' , flag: 'india.jpg'     ),
    WorldTime(url: 'Europe/Paris'     , location: 'Paris'   , flag: 'france.jpg'    ),
    WorldTime(url: 'America/New_York' , location: 'New York', flag: 'america.jpg'   ),
    WorldTime(url: 'Asia/Tokyo'       , location: 'Tokyo'   , flag: 'japan.jpg'     ),
    WorldTime(url: 'Australia/Sydney' , location: 'Sydney'  , flag: 'australia.jpg' ),
    WorldTime(url: 'Africa/Cairo'     , location: 'Cairo'   , flag: 'egypt.jpg'     ),
    WorldTime(url: 'Europe/London'    , location: 'London'  , flag: 'uk.jpg'        ),
    WorldTime(url: 'Asia/Seoul'       , location: 'Seoul'   , flag: 'southkorea.jpg'),
  ];

  void upadateTime(index) async{
    WorldTime instance = locations[index];
    await instance.getTime();
    //navigate to homescreen
    Navigator.pop(context, {
      'location': instance.location,
      'flag'    : instance.flag,
      'time'    : instance.time,
      'isDaytime': instance.isDaytime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount : locations.length,
        itemBuilder: (context, index){
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 5.0),
            child: Card(
              child: ListTile(
                onTap: () {
                  upadateTime(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/${locations[index].flag}'),
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}
