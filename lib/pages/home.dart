import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context)!.settings.arguments as Map;
    print(data);
    String bdImage = data['isDayTime'] ? 'day.png' : 'night.png';
    var bgColor = data['isDayTime'] ? Colors.blue : Colors.indigo[800];
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assests/${bdImage}'),
              fit: BoxFit.cover
            )
          ),
          child: Padding(
            padding:  EdgeInsets.fromLTRB(0,120,0,0),
            child: SafeArea(
              child: Column(
                children: [
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black
                    ),
                    onPressed: () async{
                      dynamic result = await Navigator.pushNamed(context, '/location');
                      setState(() {
                        data = {
                          "time": result['time'],
                          'location': result['location'],
                          'isDayTime': result['isDayTime'],
                          'flag': result['flag']
                        };
                      });
                    },
                    icon: Icon(Icons.edit_location,
                    color: Colors.grey[500],),
                    label: Text('Edit Location',
                    style: TextStyle(color:Colors.grey[500],fontSize: 15)),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(child: Image.asset("assests/${data["flag"]}")),
                      SizedBox(width: 15,),
                      Text(
                        data['location'],
                        style: TextStyle(
                          fontSize: 30,
                          letterSpacing: 2,
                          fontWeight: FontWeight.w400,
                          color: Colors.white
                        ),
                      )
                    ],
                  ),
                  // SizedBox(height: 20),
                  // Text(
                  //   " DATE - ${data['date']}",
                  //   style: TextStyle(
                  //     fontSize: 18,
                  //     fontWeight: FontWeight.w700,
                  //   ),
                  // ),
                  SizedBox(height: 20),
                  Text(
                    data['time'],
                    style: TextStyle(
                      fontSize: 66,
                      color: Colors.white
                    ),
                  ),

                ],

              ) ,
            ),
          ),
        ),
      ),
    );
  }
}
