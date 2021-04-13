import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProjectProgressCard extends StatefulWidget {
  final Color color;
  final Color progressIndicatorColor;
  final String projectName;
  final String percentComplete;
  final IconData icon;
  final String name;
  final String date;
  ProjectProgressCard({
    this.color,
    this.progressIndicatorColor,
    this.percentComplete,
    this.projectName,
    this.icon,
    this.name,
    this.date,
  });
  @override
  _ProjectProgressCardState createState() => _ProjectProgressCardState();
}

class _ProjectProgressCardState extends State<ProjectProgressCard> {
  bool hovered = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (value) {
        setState(() {
          hovered = true;
        });
      },
      onExit: (value) {
        setState(() {
          hovered = false;
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 275),
        height: hovered ? 130.0 : 125.0,
        width: hovered ? 180.0 : 175.0,
        decoration: BoxDecoration(
            color: hovered ? widget.color : Colors.white,
            borderRadius: BorderRadius.circular(15.0),
            border: Border.all(color: Colors.black, width: 1.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                //blurRadius: 2.0,
                spreadRadius: 2.0,
              ),
            ]),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 20.0,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 18.0,
                  ),
                  Container(
                    height: 30.0,
                    width: 30.0,
                    child: Icon(
                      widget.icon,
                      color: !hovered ? Colors.white : Colors.black,
                      size: 16.0,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      color: hovered ? Colors.white : Colors.black,
                    ),
                  ),
                  SizedBox(
                    width: 13.0,
                  ),
                  Container(
                    child: Text(
                      widget.projectName,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14.0,
                        color: hovered ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15.0,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 18.0,
                  ),
                  Container(
                    height: 13.0,
                    width: 13.0,
                    child: Icon(
                      FontAwesomeIcons.bluetooth,
                      size: 15.0,
                      color: hovered ? Colors.white : Colors.black,
                    ),
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  Container(
                    child: Text(
                      widget.name,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 10.0,
                        color: hovered ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5.0,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 18.0,
                  ),
                  Container(
                    height: 13.0,
                    width: 13.0,
                    child: Icon(
                      FontAwesomeIcons.clock,
                      size: 13.0,
                      color: hovered ? Colors.white : Colors.black,
                    ),
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  Container(
                    child: Text(
                      widget.date,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 10.0,
                        color: hovered ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              // Container(
              //   margin: EdgeInsets.only(top: 8.0, left: 135.0),
              //   child: Text(
              //     widget.percentComplete,
              //     style: TextStyle(
              //       fontWeight: FontWeight.w500,
              //       fontSize: 12.5,
              //       color: hovered ? Colors.white : Colors.black,
              //     ),
              //   ),
              // ),
              // AnimatedContainer(
              //   duration: Duration(milliseconds: 275),
              //   margin: EdgeInsets.only(top: 5.0),
              //   height: 6.0,
              //   width: 160.0,
              //   decoration: BoxDecoration(
              //     color: hovered
              //         ? widget.progressIndicatorColor
              //         : Color(0xffF5F6FA),
              //     borderRadius: BorderRadius.circular(20.0),
              //   ),
              //   child: Align(
              //     alignment: Alignment.centerLeft,
              //     child: AnimatedContainer(
              //       duration: Duration(milliseconds: 275),
              //       height: 6.0,
              //       width:
              //           (double.parse(widget.percentComplete.substring(0, 1)) /
              //                   10) *
              //               160.0,
              //       decoration: BoxDecoration(
              //         color: hovered ? Colors.white : widget.color,
              //         borderRadius: BorderRadius.circular(20.0),
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
