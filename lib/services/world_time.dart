import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {

  String location;//location for UI
  String time;
  String flag;
  String url;// location for api endpoint
  bool isDaytime;// true if daytime else false

  WorldTime({this.location, this.flag, this.url});

  Future<void> getTime() async{

    try{
    //Make request
    Response response = await get('http://worldtimeapi.org/api/timezone/$url');
    Map data = jsonDecode(response.body);
    //print(data);

    //get properties
    String datetime    = data['datetime'];
    String offset      = data['utc_offset'].substring(1,3);
    String offsetmin   = data['utc_offset'].substring(4,6);
    String offsetsign  = data['utc_offset'].substring(0,1);
    //print(offsetsign);
    //print(offset);


    //Creating DateTime class
    DateTime now = DateTime.parse(datetime);

    if(offsetsign == '+')
      {
        now = now.add(Duration(hours: int.parse(offset)));
        now = now.add(Duration(minutes: int.parse(offsetmin)));
      }
    else
      {
        now = now.subtract(Duration(hours: int.parse(offset)));
        now = now.subtract(Duration(minutes: int.parse(offsetmin)));
      }


    //setting time property
    isDaytime = now.hour > 6 && now.hour < 20 ? true : false;
    time=DateFormat.jm().format(now);
    }

    catch(e){
      print('Caught error: $e');
      time='Could not get time!';
    }
  }

}