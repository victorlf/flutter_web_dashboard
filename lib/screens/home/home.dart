import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/components/status_card.dart';
import 'package:flutter_web_dashboard/components/top_bar.dart';
import 'package:flutter_web_dashboard/components/top_title.dart';
import 'package:flutter_web_dashboard/models/graph.dart';
import 'package:flutter_web_dashboard/screens/sensor_stats/args.dart';
import 'package:flutter_web_dashboard/screens/centered_view/centered_view.dart';
import 'package:flutter_web_dashboard/screens/home/nodes_list.dart';
import 'package:flutter_web_dashboard/screens/home/status_graph.dart';
import 'package:flutter_web_dashboard/screens/navigation_bar/navigation_bar.dart';
import 'package:flutter_web_dashboard/screens/sensor_stats/sensor_stats.dart';
import 'package:flutter_web_dashboard/utilities/constants.dart';
import 'package:flutter_web_scrollbar/flutter_web_scrollbar.dart';
import 'package:http/http.dart' as http;
import 'package:percent_indicator/circular_percent_indicator.dart';

class Home extends StatefulWidget {
  static const String id = 'home';

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<Album> fetchAlbum(String url, String param) async {
    final response = await http.get(Uri.http(url, param));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return Album.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  Future<Album> futureAlbum1;
  Future<Album> futureAlbum2;

  @override
  Widget build(BuildContext context) {
    futureAlbum1 = fetchAlbum('0.0.0.0:5000', 'get_one_value_each/1');
    futureAlbum2 = fetchAlbum('0.0.0.0:5000', 'get_one_value_each/2');

    return Scaffold(
      body: Center(
        child: Row(
          children: [
            //NavigationBar(),
            Expanded(
              child: Column(
                children: [
                  TopBar('Dashboard'),
                  SizedBox(
                    height: 10.0,
                  ),
                  Expanded(
                    child: CenteredView(
                      child: ListView(
                        //mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            // height: 50.0,
                            // width: 100.0,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              // border: Border.all(
                              //   color: Color(0xFF1C1F32),
                              //   width: 5.0,
                              // ),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, SensorStats.id,
                                    arguments: ArgsSensorStats('1'));
                              },
                              style: ButtonStyle(
                                overlayColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                        (Set<MaterialState> states) {
                                  if (states.contains(MaterialState.hovered))
                                    return Colors.purple[100];

                                  return null; // Defer to the widget's default.
                                }),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Sensor 1',
                                      style: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                    SizedBox(
                                      width: 20.0,
                                    ),
                                    FutureBuilder<Album>(
                                      future: futureAlbum1,
                                      builder: (context, snapshot) {
                                        if (snapshot.hasData) {
                                          return CircularPercentIndicator(
                                            radius: 120.0,
                                            lineWidth: 13.0,
                                            animation: true,
                                            percent:
                                                (snapshot.data.battery) / 100,
                                            center: new Text(
                                              "${snapshot.data.battery}%",
                                              style: new TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20.0),
                                            ),
                                            footer: new Text(
                                              "Battery Level",
                                              style: new TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 17.0),
                                            ),
                                            circularStrokeCap:
                                                CircularStrokeCap.round,
                                            progressColor: Colors.green,
                                          );
                                        } else if (snapshot.hasError) {
                                          return Text("${snapshot.error}");
                                        }
                                        // By default, show a loading spinner.
                                        return CircularProgressIndicator();
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Container(
                            // height: 50.0,
                            // width: 100.0,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              // border: Border.all(
                              //   color: Color(0xFF14193B),
                              //   width: 5.0,
                              // ),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, SensorStats.id,
                                    arguments: ArgsSensorStats('2'));
                              },
                              style: ButtonStyle(
                                overlayColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                        (Set<MaterialState> states) {
                                  if (states.contains(MaterialState.hovered))
                                    return Colors.purple[100];

                                  return null; // Defer to the widget's default.
                                }),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Sensor 2',
                                      style: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                    SizedBox(
                                      width: 20.0,
                                    ),
                                    FutureBuilder<Album>(
                                      future: futureAlbum2,
                                      builder: (context, snapshot) {
                                        if (snapshot.hasData) {
                                          return CircularPercentIndicator(
                                            radius: 120.0,
                                            lineWidth: 13.0,
                                            animation: true,
                                            percent:
                                                (snapshot.data.battery) / 100,
                                            center: new Text(
                                              "${snapshot.data.battery}%",
                                              style: new TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20.0),
                                            ),
                                            footer: new Text(
                                              "Battery Level",
                                              style: new TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 17.0),
                                            ),
                                            circularStrokeCap:
                                                CircularStrokeCap.round,
                                            progressColor: Colors.green,
                                          );
                                        } else if (snapshot.hasError) {
                                          return Text("${snapshot.error}");
                                        }
                                        // By default, show a loading spinner.
                                        return CircularProgressIndicator();
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      // child: StreamBuilder(
                      //     stream: FirebaseFirestore.instance
                      //         .collection('nodes_status')
                      //         .snapshots(),
                      //     builder: (context, snapshot) {
                      //       if (!snapshot.hasData)
                      //         return Center(child: kProgressCircle);
                      //       //var docs = snapshot.data.docs;
                      //       return Column(
                      //         //crossAxisAlignment: CrossAxisAlignment.start,
                      //         children: [
                      //           //TopTitle('Dashboard'),
                      //           Padding(
                      //             padding: const EdgeInsets.all(8.0),
                      //             child: Row(
                      //               mainAxisAlignment:
                      //                   MainAxisAlignment.spaceEvenly,
                      //               children: [
                      //                 StatusCard(
                      //                     'Beacons em Uso',
                      //                     (snapshot.data.docs[1]['number'] -
                      //                             snapshot.data.docs[0]
                      //                                 ['number'])
                      //                         .toString(),
                      //                     Colors.red),
                      //                 StatusCard(
                      //                     'Beacons Disponíveis',
                      //                     (snapshot.data.docs[0]['number'])
                      //                         .toString(),
                      //                     Colors.green),
                      //               ],
                      //             ),
                      //           ),
                      //           SizedBox(
                      //             height: 20.0,
                      //           ),
                      //           Center(
                      //             child: Container(
                      //               height: 500.0,
                      //               width: 800.0,
                      //               //child: Image.asset('images/graph_example.jpg')),
                      //               // child: SimpleLineChart(
                      //               //   SimpleLineChart.createSampleData(),
                      //               //   animate: false,
                      //               // ),
                      //               child: StatusGraph(),
                      //             ),
                      //           ),
                      //           SizedBox(
                      //             height: 40.0,
                      //           ),
                      //           NodesList(),
                      //         ],
                      //       );
                      //     }),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Album {
  final double temp;
  final double pres;
  final double battery;
  final String time;

  Album(
      {@required this.temp,
      @required this.pres,
      @required this.battery,
      @required this.time});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      temp: json['temp'],
      pres: json['pres'],
      battery: json['battery'],
      time: json['time'],
    );
  }
}
