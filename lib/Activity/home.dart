// ignore_for_file: unused_field

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:muasume_app/Activity/loading.dart';

// ignore: must_be_immutable
class Home extends StatefulWidget {
  var city, decs, weathericon;
  var temp, speed;
  var humidity;
  var City;

  Home(this.city, this.decs, this.temp, this.speed, this.humidity,
      this.weathericon,
      {super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var city_name = ["Mumbai", "Delhi", "Chennai", "Indore", "Bhopal"];
    final _random = new Random();
    var city = city_name[_random.nextInt(city_name.length)];
    print(widget.temp);
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(0),
            child: AppBar(
              backgroundColor: Colors.blue,
            )),
        body: SafeArea(
          child: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.blue, Color.fromARGB(255, 21, 0, 255)])),
            child: Column(
              children: [
                Container(
                  // search container
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 21),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25)),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) =>
                                      Loading(searchController.text)));
                        },
                        child: Container(
                          margin: const EdgeInsets.fromLTRB(4, 0, 9, 0),
                          child: const Icon(
                            Icons.search,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                      Expanded(
                          child: TextField(
                        controller: searchController,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Search $city",
                            hintStyle: const TextStyle(fontSize: 20)),
                      ))
                    ],
                  ),
                ),
                Row(
                  // Second container
                  children: [
                    Expanded(
                      child: Container(
                        height: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white.withOpacity(0.5),
                        ),
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        padding: const EdgeInsets.all(20),
                        child: Row(
                          children: [
                            Image.network(
                                'https://openweathermap.org/img/wn/${widget.weathericon}@2x.png'),
                            const SizedBox(width: 20),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.decs,
                                  style: const TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                                Text(
                                  "In ${widget.city}",
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blueGrey),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  //thard container
                  children: [
                    Expanded(
                      child: Container(
                          height: 225,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white.withOpacity(0.6),
                          ),
                          margin: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Icon(
                                Icons.thermostat_auto_sharp,
                                size: 40,
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    widget.temp.toString(),
                                    style: const TextStyle(
                                        fontSize: 80, color: Colors.white),
                                  ),
                                  const Text(
                                    'C',
                                    style: TextStyle(fontSize: 50),
                                  )
                                ],
                              )
                            ],
                          )),
                    ),
                  ],
                ),
                Expanded(
                  //forth container
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                          height: 220,
                          width: 172,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white.withOpacity(0.7),
                          ),
                          margin: const EdgeInsets.only(
                              left: 13, top: 15, right: 0),
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            children: [
                              const Row(
                                children: [
                                  Icon(
                                    Icons.wind_power_sharp,
                                    size: 30,
                                    color: Color.fromARGB(255, 255, 64, 0),
                                  )
                                ],
                              ),
                              //const SizedBox(height: 7),
                              Text(
                                widget.speed.toString().substring(0, 4),
                                style: const TextStyle(
                                    fontSize: 32.5,
                                    fontWeight: FontWeight.bold),
                              ),
                              const Text(
                                "km/hr",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.blueGrey,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          )),
                      Container(
                          height: 220,
                          width: 172,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white.withOpacity(0.7),
                          ),
                          margin: const EdgeInsets.only(
                              left: 0, top: 15, right: 12),
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            children: [
                              const Row(
                                children: [
                                  Icon(
                                    Icons.water_drop_sharp,
                                    size: 30,
                                    color: Color.fromARGB(255, 8, 0, 255),
                                  )
                                ],
                              ),
                              const SizedBox(height: 1),
                              Text(
                                widget.humidity.toString(),
                                style: const TextStyle(
                                    fontSize: 32.5,
                                    fontWeight: FontWeight.bold),
                              ),
                              const Text(
                                "Temp. %",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.blueGrey,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          )),
                    ],
                  ),
                ),
                Expanded(
                  //fiveth container
                  child: Container(
                    margin: const EdgeInsets.only(top: 10, bottom: 20),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Made By Roshan',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                        SizedBox(height: 2),
                        Text(
                          'Data Provided By Openweather.org',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
