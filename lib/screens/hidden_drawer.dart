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
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Column(
          children: [
            buildDrawerItems(context),
          ],
        ),
      );
  Widget buildDrawerItems(BuildContext context) => Container();
}


/**
 * 
 * if (session["privilege"] == "StoreOwner") {
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
 */