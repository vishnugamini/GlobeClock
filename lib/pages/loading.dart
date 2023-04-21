import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';


class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void setupWorldTime() async{
    WorldTime instance = WorldTime(location: 'Kolkata', flag: 'ind.png', url:'Asia/Kolkata');
    await Future.delayed(Duration(milliseconds: 5000));
    await instance.getTime();
    Navigator.pushReplacementNamed(context,'/home', arguments: {
      "time":instance.time,
      "date": instance.date,
      "location": instance.location,
      "flag": instance.flag,
      "isDayTime": instance.isDayTime
    });

  }

  @override
  void initState(){
    super.initState();
    setupWorldTime();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child: SpinKitWave(
          color: Colors.white,
          size: 100,
        ),

      ),
    );
  }
}
// SpinKitFadingCircle
// SpinKitSpinningLines