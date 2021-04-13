import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/screens/home/home.dart';
import 'package:flutter_web_dashboard/screens/navigation_bar/navbar_bottom.dart';
import 'package:flutter_web_dashboard/screens/navigation_bar/navbar_item.dart';
import 'package:flutter_web_dashboard/screens/navigation_bar/navbar_logo.dart';
import 'package:flutter_web_dashboard/screens/nodes_configuration/nodes_configuration.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF333951),
      width: 100.0,
      child: Column(
        //mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          NavBarLogo(),
          Column(
            children: [
              NavBarItem(FontAwesomeIcons.home, Home.id),
              //NavBarItem(FontAwesomeIcons.bluetooth, NodesConfiguration.id),
            ],
          ),
          NavBarBottom(),
        ],
      ),
    );
  }
}
