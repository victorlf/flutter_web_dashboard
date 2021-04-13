import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/providers/navbar_active_page.dart';
import 'package:flutter_web_dashboard/providers/select_local.dart';
import 'package:flutter_web_dashboard/screens/home/home.dart';
import 'package:flutter_web_dashboard/screens/nodes_configuration/nodes_configuration.dart';
import 'package:flutter_web_dashboard/screens/sensor_stats/sensor_stats.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => NavBarActivePage(Home.id),
        ),
      ],
      child: DashboardWebApp(),
    ),
  );
}

class DashboardWebApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.grey[300],
        scaffoldBackgroundColor: Colors.grey[300],
      ),
      //home: Home(),
      initialRoute: Home.id,
      routes: {
        Home.id: (context) => Home(),
        //NodesConfiguration.id: (context) => NodesConfiguration(),
        SensorStats.id: (context) => SensorStats(),
      },
    );
  }
}
