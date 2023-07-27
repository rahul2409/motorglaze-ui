import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:memberships_ui/data/user_data.dart';
import 'package:memberships_ui/models/user_model.dart';
import 'package:memberships_ui/utils/customisations.dart';
import 'package:memberships_ui/widget/button_widget.dart';
import 'package:memberships_ui/widget/drawer_menu_widget.dart';
// import 'package:memberships_ui/widget/profile_widget.dart';

class ProfileScreen extends StatefulWidget {
  final VoidCallback openDrawer;
  const ProfileScreen({required this.openDrawer, super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final icon = CupertinoIcons.moon_stars;
  @override
  Widget build(BuildContext context) {
    final User user = UserPreferences.user;
    print(user.emailAddress);
    VoidCallback openDrawer = widget.openDrawer;
    return Scaffold(
      appBar: AppBar(
        leading: DrawerMenuWidget(
          onClick: openDrawer,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(icon),
            color: Colors.white,
          )
        ],
      ),
      backgroundColor: Theme.of(context).primaryColor,
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          // ProfileWidget(
          //   imagePath:
          //       "https://images.unsplash.com/photo-1554151228-14d9def656e4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=333&q=80",
          //   onClick: () async {},
          // ),
          const SizedBox(height: 25),
          buildName(user),
          const SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildEditProfileButton(),
              buildViewStoreButton(),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildName(User user) {
    // print(user.userId);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              user.firstName,
              style: customTextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(5),
            ),
            Text(
              user.lastName,
              style: customTextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Text(
          user.emailAddress,
          style: customTextStyle(
            color: Colors.white,
          ),
        ),
        Text(
          user.phoneNumber,
          style: customTextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ],
    );
  }

  Widget buildEditProfileButton() => ButtonWidget(
        text: 'Edit Profile',
        onClicked: () {},
      );

  Widget buildViewStoreButton() => ButtonWidget(
        text: 'View Store',
        onClicked: () {},
      );
}
