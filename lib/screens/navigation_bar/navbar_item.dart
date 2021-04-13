import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/providers/navbar_active_page.dart';
import 'package:provider/provider.dart';

class NavBarItem extends StatelessWidget {
  final String pageName;
  final IconData icon;
  const NavBarItem(this.icon, this.pageName);

  @override
  Widget build(BuildContext context) {
    return Consumer<NavBarActivePage>(
      builder: (context, pageActive, child) {
        return Row(
          children: [
            AnimatedContainer(
              duration: Duration(milliseconds: 475),
              height: 35.0,
              width: 5.0,
              decoration: BoxDecoration(
                color: pageActive.pageName == pageName
                    ? Colors.white
                    : Colors.transparent,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10.0),
                  bottomRight: Radius.circular(10.0),
                ),
              ),
            ),
            FlatButton(
              hoverColor: Colors.white12,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Icon(
                  icon,
                  color: pageActive.pageName == pageName
                      ? Colors.white
                      : Colors.white54,
                  size: 25.0,
                ),
              ),
              onPressed: () {
                Navigator.pushNamed(context, pageName);
                pageActive.changePageName(pageName);
              },
            ),
          ],
        );
      },
    );
  }
}
