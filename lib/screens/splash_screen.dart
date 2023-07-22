import 'package:flutter/material.dart';
import 'package:memberships_ui/models/drawer_model.dart';
import 'package:memberships_ui/data/drawer_data.dart';
import 'package:memberships_ui/screens/login_screen.dart';
import 'package:memberships_ui/screens/membership_screen.dart';
import 'package:memberships_ui/screens/payment_screen.dart';
import 'package:memberships_ui/screens/profile.dart';
import 'package:memberships_ui/screens/settings.dart';
import 'package:memberships_ui/screens/store_screen.dart';
import 'package:memberships_ui/widget/drawer_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late double xOffset;
  late double yOffset;
  late double scaleFactor;
  late bool isDrawerOpen;
  late bool notLoggedIn = false;
  DrawerItem item = DrawerItems.membership;
  bool isDragging = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    closeDrawer();
  }

  void openDrawer() => setState(() {
        xOffset = 230;
        yOffset = 150;
        scaleFactor = 0.6;
        isDrawerOpen = true;
      });

  void closeDrawer() => setState(() {
        xOffset = 0;
        yOffset = 0;
        scaleFactor = 1;
        isDrawerOpen = false;
      });
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: notLoggedIn
            ? LoginScreen()
            : Stack(
                children: [
                  buildDrawer(),
                  buildPage(),
                ],
              ),
      );
  Widget buildDrawer() => SafeArea(
        child: Container(
          width: xOffset,
          child: DrawerWidget(
            onSelectedItem: (item) {
              switch (item) {
                case DrawerItems.logout:
                  closeDrawer();
                  setState(() {
                    notLoggedIn = true;
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Logging out!"),
                    ),
                  );
                  break;
                default:
                  setState(() => this.item = item);
                  closeDrawer();
              }
            },
          ),
        ),
      );
  Widget buildPage() {
    return WillPopScope(
      onWillPop: () async {
        if (isDrawerOpen) {
          closeDrawer();
          return false;
        } else {
          return true;
        }
      },
      child: GestureDetector(
        onTap: closeDrawer,
        onHorizontalDragStart: (details) => isDragging = true,
        onHorizontalDragUpdate: (details) {
          if (!isDragging) return;
          const delta = 1;
          if (details.delta.dx > delta) {
            openDrawer();
          } else if (details.delta.dx < -delta) {
            closeDrawer();
          }
          isDragging = false;
        },
        child: AnimatedContainer(
          duration: Duration(
            milliseconds: 250,
          ),
          transform: Matrix4.translationValues(xOffset, yOffset, 0)
            ..scale(scaleFactor),
          child: AbsorbPointer(
            absorbing: isDrawerOpen,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(isDrawerOpen ? 20 : 0),
              child: Container(
                color: isDrawerOpen
                    ? Colors.white12
                    : Theme.of(context).primaryColor,
                child: getDrawerPage(),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget getDrawerPage() {
    switch (item) {
      case DrawerItems.transactions:
        return PaymentScreen(openDrawer: openDrawer);
      case DrawerItems.profile:
        return ProfileScreen(openDrawer: openDrawer);
      case DrawerItems.settings:
        return SettingsScreen(openDrawer: openDrawer);
      case DrawerItems.store:
        return StoreScreen(openDrawer: openDrawer);
      case DrawerItems.membership:
      default:
        return MembershipScreen(
          openDrawer: openDrawer,
        );
    }
  }
}
