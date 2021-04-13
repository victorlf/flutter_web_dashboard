import 'package:flutter/material.dart';

class NavBarBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.0,
      child: Center(
        child: Text(
          'v 0.0.1',
          style: TextStyle(
            fontWeight: FontWeight.w300,
            color: Colors.white,
            fontSize: 10.0,
          ),
        ),
      ),
    );
  }
}
