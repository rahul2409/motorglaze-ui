import 'package:flutter/material.dart';
import 'package:memberships_ui/utils/customisations.dart';

// ignore: must_be_immutable
class HiddenDrawer extends StatelessWidget {
  Map<String, String> session = {};
  HiddenDrawer(this.session, {super.key});
  Map<String, String> drawerNames = {
    "Add Store": "/add_store",
    "Add Membership": "add_membership",
    "Add Services": "add_service",
    "Add Users": "add_user",
    "Payments": "add_transactions",
    "Membership Registrations": "add_membership_registrations"
  };
  @override
  Widget build(BuildContext context) {
    if (session["privilege"] == "StoreOwner") {
      drawerNames.clear();
      drawerNames = {
        "Add Membership": "add_membership",
        "Add Users": "add_user",
        "Payments": "add_transactions",
        "Membership Registrations": "add_membership_registrations"
      };
    } else if (session["privilege"] == "customer") {
      drawerNames.clear();
      drawerNames = {
        "Add Store": "/add_store",
        "Add Membership": "add_membership",
        "Add Services": "add_service",
        "Add Users": "add_user",
        "Payments": "add_transactions",
        "Membership Registrations": "add_membership_registrations"
      };
    }
    List<MapEntry<String, String>> drawerNameEntries =
        drawerNames.entries.toList();
    String? firstName = session["firstName"];
    String? lastName = session["lastName"];
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: customBackgroundGradient(),
        ),
        child: ListView(children: [
          DrawerHeader(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 40,
                top: 25,
              ),
              child: Text(
                '$firstName\n$lastName',
                style: customTextStyle(
                  fontSize: 24.0,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 10, 0.0, 0.0),
              child: ListView.builder(
                itemCount: drawerNames.length,
                itemBuilder: (context, index) {
                  MapEntry<String, String> entry = drawerNameEntries[index];
                  return drawerListTile(
                    session,
                    entry.key,
                    context,
                    entry.value,
                    const Icon(Icons.home),
                  );
                },
              ),
            ),
          ),
        ]),
      ),
    );
  }
}


// ListView(padding: EdgeInsets.zero, children: [
//             ListTile(
//               title: Text(
//                 'User Email',
//                 style: customTextStyle(),
//               ),
//             ),
//             SizedBox(
//               height: 60,
//             ),
//             drawerListTile(
//               'Home',
//               context,
//               '/add_store',
//               const Icon(Icons.home),
//             ),
//             Container(
//               width: 70,
//               height: 1,
//               color: Colors.grey[300],
//             ),
//             ListTile(
//               leading: Icon(Icons.leaderboard_rounded),
//               title: Text(
//                 "Leaderboard",
//                 style: customTextStyle(),
//               ),
//             ),
//             Container(
//               width: 70,
//               height: 1,
//               color: Colors.grey[300],
//             ),
//             ListTile(
//               leading: Icon(Icons.comment),
//               title: Text(
//                 "About",
//                 style: customTextStyle(),
//               ),
//             ),
//             Container(
//               width: 70,
//               height: 1,
//               color: Colors.grey[300],
//             ),
//             ListTile(
//               leading: Icon(Icons.phone),
//               title: Text(
//                 "Contact",
//                 style: customTextStyle(),
//               ),
//             ),
//             Container(
//               width: 70,
//               height: 1,
//               color: Colors.grey[300],
//             ),
//             SizedBox(
//               height: 100,
//             ),
//             ListTile(
//                 leading: CircleAvatar(
//               radius: 30,
//               backgroundColor: Colors.blue[900]!,
//               child: Icon(
//                 Icons.logout,
//                 color: Colors.white,
//               ),
//             )),
//           ]),