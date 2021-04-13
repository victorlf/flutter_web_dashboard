import 'package:flutter/material.dart';

class TopTitle extends StatelessWidget {
  final String title;

  TopTitle(this.title);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30.0, bottom: 20.0),
      child: Text(
        title,
        style: TextStyle(
          color: Colors.grey,
          fontSize: 50.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
