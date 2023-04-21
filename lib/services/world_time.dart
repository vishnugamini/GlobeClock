import 'package:http/http.dart';
import 'dart:convert';


class WorldTime{
  late String location;
  String time = "could not load";
  String date = "could not load";
  late String flag; //url to an asset flag icon
  late String url;
  late bool isDayTime;

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {
    try{
      Response response = await get(Uri.parse("http://worldtimeapi.org/api/timezone/$url"));
      Map data = jsonDecode(response.body);
      String datetime = data['datetime'];
      String date = datetime.substring(0,10);
      String time = datetime.substring(11,19);
      var intTime = int.parse(time.substring(0,2));
      isDayTime = isDay(intTime);
      this.date = date;
      this.time = time;
    }
    catch(e){
      print("error $e");
    }
  }

  bool isDay(int num){
    if( num >= 6 && num <= 17){
      return true;
    }
    else{
      return false;
    }

  }
}


