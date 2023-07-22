import 'package:flutter/material.dart';
import 'package:memberships_ui/utils/customisations.dart';

class HiddenDrawer extends StatelessWidget {
  const HiddenDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: customBackgroundGradient(),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 40.0, 0.0, 0.0),
          child: ListView(padding: EdgeInsets.zero, children: [
            ListTile(
              title: Text(
                'User Email',
                style: customTextStyle(),
              ),
            ),
            SizedBox(
              height: 60,
            ),
            Container(
              width: 70,
              height: 1,
              color: Colors.grey[300],
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text(
                "Home",
                style: customTextStyle(),
              ),
            ),
            Container(
              width: 70,
              height: 1,
              color: Colors.grey[300],
            ),
            ListTile(
              leading: Icon(Icons.leaderboard_rounded),
              title: Text(
                "Leaderboard",
                style: customTextStyle(),
              ),
            ),
            Container(
              width: 70,
              height: 1,
              color: Colors.grey[300],
            ),
            ListTile(
              leading: Icon(Icons.comment),
              title: Text(
                "About",
                style: customTextStyle(),
              ),
            ),
            Container(
              width: 70,
              height: 1,
              color: Colors.grey[300],
            ),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text(
                "Contact",
                style: customTextStyle(),
              ),
            ),
            Container(
              width: 70,
              height: 1,
              color: Colors.grey[300],
            ),
            SizedBox(
              height: 100,
            ),
            ListTile(
                leading: CircleAvatar(
              radius: 30,
              backgroundColor: Colors.blue[900]!,
              child: Icon(
                Icons.logout,
                color: Colors.white,
              ),
            )),
          ]),
        ),
      ),
    );
  }
}
