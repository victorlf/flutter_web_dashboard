import 'dart:convert';
import 'dart:html';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/components/battery.dart';
import 'package:flutter_web_dashboard/components/top_bar.dart';
import 'package:flutter_web_dashboard/screens/sensor_stats/args.dart';
import 'package:flutter_web_dashboard/screens/sensor_stats/measure.dart';
import 'package:flutter_web_dashboard/screens/sensor_stats/selection_callback_state.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import '../centered_view/centered_view.dart';
import 'package:flutter_gauge/flutter_gauge.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:http/http.dart' as http;
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:customgauge/customgauge.dart';
import 'package:url_launcher/url_launcher.dart';

class SensorStats extends StatefulWidget {
  static const String id = 'sensor_stats';

  @override
  _SensorStatsState createState() => _SensorStatsState();
}

class _SensorStatsState extends State<SensorStats> {
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

  Future<AlbumArray> fetchAlbumArray(String url, String param) async {
    final response = await http.get(Uri.http(url, param));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return AlbumArray.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  Future<Album> futureAlbum;
  Future<AlbumArray> futureAlbum2;
  Future<AlbumArray> futureAlbum3;

  // @override
  // void initState() {
  //   super.initState();

  //   final ArgsSensorStats args =
  //       ModalRoute.of(context).settings.arguments as ArgsSensorStats;

  //   futureAlbum =
  //       fetchAlbum('0.0.0.0:5000', 'get_one_value_each/${args.sensor}');
  //   futureAlbum2 =
  //       fetchAlbumArray('0.0.0.0:5000', 'get_array_values/temp/${args.sensor}');
  //   futureAlbum3 =
  //       fetchAlbumArray('0.0.0.0:5000', 'get_array_values/pres/${args.sensor}');
  // }

  //DateTime _time;
  int _number;
  //Map<String, num> _measures;
  double _temp;

  _onSelectionChanged(charts.SelectionModel model) {
    final selectedDatum = model.selectedDatum;

    int number;
    double temp;

    if (selectedDatum.isNotEmpty) {
      number = selectedDatum.first.datum.number;
      temp = selectedDatum.first.datum.temp;
    }

    // Request a build.
    setState(() {
      //_time = time;
      _number = number;
      //_measures = measures;
      _temp = temp;
    });
  }

  @override
  Widget build(BuildContext context) {
    final ArgsSensorStats args =
        ModalRoute.of(context).settings.arguments as ArgsSensorStats;

    futureAlbum =
        fetchAlbum('0.0.0.0:5000', 'get_one_value_each/${args.sensor}');
    futureAlbum2 =
        fetchAlbumArray('0.0.0.0:5000', 'get_array_values/temp/${args.sensor}');
    futureAlbum3 =
        fetchAlbumArray('0.0.0.0:5000', 'get_array_values/pres/${args.sensor}');

    // final children = <Widget>[];
    // _measures?.forEach((String series, num value) {
    //   children.add(new Text('${series}: ${value}'));
    // });

    return Scaffold(
      body: Center(
        child: Row(
          children: [
            //NavigationBar(),
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: CenteredView(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // ElevatedButton(
                                //   onPressed: () {
                                //     Navigator.pop(context);
                                //   },
                                //   child: Row(
                                //     children: [
                                //       Icon(Icons.arrow_back_ios),
                                //       Text(
                                //         "Voltar",
                                //         style: TextStyle(
                                //           //color: Colors.yellow,
                                //           fontWeight: FontWeight.bold,
                                //           fontSize: 16.0,
                                //         ),
                                //       ),
                                //     ],
                                //   ),
                                //   style: ElevatedButton.styleFrom(
                                //     primary: Colors.grey[400],
                                //     shape: RoundedRectangleBorder(
                                //         borderRadius:
                                //             BorderRadius.circular(30.0)),
                                //     // padding: EdgeInsets.symmetric(
                                //     //     horizontal: 70.0, vertical: 10.0),
                                //   ),
                                // ),
                                TopBar('Sensor 1'),
                                // Container(
                                //   width: 100.0,
                                // ),
                              ],
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Center(
                              child: Container(
                                width: 300.0,
                                padding: EdgeInsets.all(10.0),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: FutureBuilder<Album>(
                                  future: futureAlbum,
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                      return Text(
                                        'Última medida feita: ${snapshot.data.time}',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      );
                                    } else if (snapshot.hasError) {
                                      return Text("${snapshot.error}");
                                    }
                                    // By default, show a loading spinner.
                                    return CircularProgressIndicator();
                                  },
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              'Temperatura',
                              style: TextStyle(
                                fontSize: 30.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FutureBuilder<Album>(
                                    future: futureAlbum,
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData) {
                                        return CustomGauge(
                                          gaugeSize: 200,
                                          minValue: -40,
                                          maxValue: 85,
                                          segments: [
                                            GaugeSegment(
                                                'Low', 40, Colors.blue),
                                            GaugeSegment(
                                                'Medium', 30, Colors.yellow),
                                            GaugeSegment(
                                                'Medium-2', 30, Colors.orange),
                                            GaugeSegment(
                                                'High', 25, Colors.red),
                                          ],
                                          currentValue: snapshot.data.temp,
                                          displayWidget: Text('Temperatura',
                                              style: TextStyle(fontSize: 12)),
                                        );
                                      } else if (snapshot.hasError) {
                                        return Text("${snapshot.error}");
                                      }

                                      // By default, show a loading spinner.
                                      return CircularProgressIndicator();
                                    },
                                  ),
                                  SizedBox(
                                    width: 20.0,
                                  ),
                                  FutureBuilder<AlbumArray>(
                                    future: futureAlbum2,
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData) {
                                        return Container(
                                          width: 600,
                                          height: 300,
                                          padding: EdgeInsets.all(8.0),
                                          child: SelectionCallbackExample(
                                            seriesList: getMeasureData([
                                              for (int i = 0;
                                                  i <
                                                      snapshot.data.numSamples
                                                          .length;
                                                  i++)
                                                Measure(
                                                    snapshot.data.numSamples[i],
                                                    snapshot.data.temps[i])
                                            ]),
                                            animate: false,
                                            leftTitle: 'Temperatura (ºC)',
                                            bottomTitle: 'Número da Medida',
                                          ),
                                        );
                                      } else if (snapshot.hasError) {
                                        return Text("${snapshot.error}");
                                      }
                                      // By default, show a loading spinner.
                                      return CircularProgressIndicator();
                                    },
                                  ),
                                  (_number != null)
                                      ? Padding(
                                          padding: EdgeInsets.only(top: 5.0),
                                          child:
                                              Text('Measure Number: $_number'))
                                      : Container(),
                                  (_temp != null)
                                      ? Padding(
                                          padding: EdgeInsets.only(top: 5.0),
                                          child: Text('Temperature: $_temp'))
                                      : Container(),
                                  // Row(children: children),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Center(
                              child: Container(
                                width: 200.0,
                                child: ElevatedButton(
                                  onPressed: () {
                                    launch(
                                        'http://0.0.0.0:5000/plot/temp/${args.sensor}');
                                  },
                                  child: Row(
                                    children: [
                                      Icon(Icons.file_download),
                                      Text(
                                        "Download Gráfico",
                                        style: TextStyle(
                                          //color: Colors.yellow,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.purple[300],
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30.0)),
                                    // padding: EdgeInsets.symmetric(
                                    //     horizontal: 70.0, vertical: 10.0),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 30.0),
                            Text(
                              'Pressão',
                              style: TextStyle(
                                fontSize: 30.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FutureBuilder<Album>(
                                    future: futureAlbum,
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData) {
                                        return CustomGauge(
                                          gaugeSize: 200,
                                          minValue: 300,
                                          maxValue: 1100,
                                          segments: [
                                            GaugeSegment(
                                                'Low', 200, Colors.red),
                                            GaugeSegment(
                                                'Medium', 200, Colors.orange),
                                            GaugeSegment(
                                                'Medium-2', 200, Colors.yellow),
                                            GaugeSegment(
                                                'High', 200, Colors.blue),
                                          ],
                                          currentValue: snapshot.data.pres,
                                          displayWidget: Text('Pressão',
                                              style: TextStyle(fontSize: 12)),
                                        );
                                      } else if (snapshot.hasError) {
                                        return Text("${snapshot.error}");
                                      }

                                      // By default, show a loading spinner.
                                      return CircularProgressIndicator();
                                    },
                                  ),
                                  SizedBox(
                                    width: 20.0,
                                  ),
                                  FutureBuilder<AlbumArray>(
                                    future: futureAlbum3,
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData) {
                                        return Container(
                                          width: 600,
                                          height: 300,
                                          padding: EdgeInsets.all(8.0),
                                          child: SelectionCallbackExample(
                                            seriesList: getMeasureData([
                                              for (int i = 0;
                                                  i <
                                                      snapshot.data.numSamples
                                                          .length;
                                                  i++)
                                                Measure(
                                                    snapshot.data.numSamples[i],
                                                    snapshot.data.temps[i])
                                            ]),
                                            animate: false,
                                            leftTitle: 'Pressão (hPa)',
                                            bottomTitle: 'Número da Medida',
                                          ),
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
                            SizedBox(
                              height: 10.0,
                            ),
                            Center(
                              child: Container(
                                width: 200.0,
                                child: ElevatedButton(
                                  onPressed: () {
                                    launch(
                                        'http://0.0.0.0:5000/plot/pres/${args.sensor}');
                                  },
                                  child: Row(
                                    children: [
                                      Icon(Icons.file_download),
                                      Text(
                                        "Download Gráfico",
                                        style: TextStyle(
                                          //color: Colors.yellow,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.purple[300],
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30.0)),
                                    // padding: EdgeInsets.symmetric(
                                    //     horizontal: 70.0, vertical: 10.0),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 30.0),
                            FutureBuilder<Album>(
                              future: futureAlbum,
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return Center(
                                    child: Container(
                                      // width: 200.0,
                                      // height: 100.0,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      child: CircularPercentIndicator(
                                        radius: 120.0,
                                        lineWidth: 13.0,
                                        animation: true,
                                        percent: (snapshot.data.battery) / 100,
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
                                      ),
                                    ),
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

class AlbumArray {
  final List numSamples;
  final List temps;

  AlbumArray({@required this.numSamples, @required this.temps});

  factory AlbumArray.fromJson(Map<String, dynamic> json) {
    return AlbumArray(
      numSamples: json['numSamples'],
      temps: json['temps'],
    );
  }
}

class TemperatureData {
  final int number;
  final double temp;

  TemperatureData(this.number, this.temp);
}
