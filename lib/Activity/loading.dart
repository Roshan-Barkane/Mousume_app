import 'package:flutter/material.dart';
import 'package:muasume_app/Activity/home.dart';
import 'package:muasume_app/Worker/worker.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

// ignore: must_be_immutable
class Loading extends StatefulWidget {
  //Loading(String text);
  var searchCity;
  Loading(this.searchCity, {super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  var temp;
  var humidity;
  var speed;
  var decs;
  var city;
  var iCon;
  void getValue() async {
    //print(widget.searchCity);
    if ((widget.searchCity).toString().isEmpty) {
      find_Values instance = find_Values("Indore");
      await instance.getData();
      temp = instance.temp;
      humidity = instance.humidity;
      speed = instance.speed;
      decs = instance.decs;
      city = instance.maain;
      iCon = instance.iCon;
      // push the data loading activity to home activity
      // ignore: use_build_context_synchronously
      Future.delayed(const Duration(seconds: 2), () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => Home(
                instance.maain,
                instance.decs,
                instance.temp,
                instance.speed,
                instance.humidity,
                instance.iCon)));
      });
    } else {
      find_Values instance = find_Values(widget.searchCity);
      await instance.getData();
      temp = instance.temp;
      humidity = instance.humidity;
      speed = instance.speed;
      decs = instance.decs;
      city = instance.maain;
      iCon = instance.iCon;
      // push the data loading activity to home activity
      // ignore: use_build_context_synchronously
      Future.delayed(const Duration(seconds: 2), () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => Home(
                instance.maain,
                instance.decs,
                instance.temp,
                instance.speed,
                instance.humidity,
                instance.iCon)));
      });
    }

    /* print("\n Acsess the date from loading activity");
    print(instance.temp);
    print(instance.humidity);
    print(instance.maain);
    print(instance.decs);
    print(instance.speed);*/
  }

  @override
  void initState() {
    getValue();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: Colors.blue,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('images/imga.png'),
                  maxRadius: 110,
                  minRadius: 90,
                ),
                SizedBox(
                  height: 20,
                ),
                Text('Weather App',
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.w600,
                      color: Colors.yellow,
                    )),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Made By Roshan',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w400),
                ),
                // Flutter Spinkit
                Padding(
                  padding: EdgeInsets.only(top: 90),
                  child: SpinKitWave(
                    color: Colors.white,
                    size: 50.0,
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
