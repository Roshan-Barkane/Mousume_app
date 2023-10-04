import 'package:http/http.dart';
import 'dart:convert';

class find_Values {
  //Future<void> getData() async {
  var Location;
  var temp;
  var humidity;
  var speed;
  var decs;
  var maain;
  var iCon;

  find_Values(String location) {
    Location = location;
    print("Location Name : $Location");
  }
  Future<void> getData() async {
    try {
      var url = Uri.parse(
          'https://api.openweathermap.org/data/2.5/weather?q=$Location&appid=f0440aae2436bd0d48182d48e5618545');
      var response = await get(url);
      Map data = jsonDecode(response.body);
      Map main = data['main'];
      //Get data temp and humidity
      double gettemp = main['temp'];
      int gethumidity = main['humidity'];
      //Get data main and decription
      List weather = data['weather'];
      Map weather_Data = weather[0];
      String getcity = data["name"];
      String getdecs = weather_Data["description"];
      String icons = weather_Data["icon"].toString();
      // Get data air_speed
      Map wind = data['wind'];
      double getspeed = wind['speed'] / 0.27777777777778;
      // initialization value
      temp = gettemp;
      humidity = gethumidity;
      speed = getspeed;
      decs = getdecs;
      maain = getcity;
      iCon = icons;
    } catch (e) {
      // Set the default value all the globle variable
      temp = 23.4;
      humidity = 40;
      speed = 0.25;
      decs = 'scattered clouds';
      maain = 'Clauds';
      iCon = '10d';
    }
  }
}
