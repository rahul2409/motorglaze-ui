import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:memberships_ui/models/drawer_model.dart';

class DrawerItems {
  static const transactions =
      DrawerItem(title: 'Payments', icon: FontAwesomeIcons.moneyBill);
  static const store = DrawerItem(title: 'Store', icon: FontAwesomeIcons.store);
  static const profile =
      DrawerItem(title: 'Profile', icon: FontAwesomeIcons.user);
  static const membership =
      DrawerItem(title: 'Memberships', icon: FontAwesomeIcons.handshake);
  static const settings = DrawerItem(title: "Settings", icon: Icons.settings);
  static const logout = DrawerItem(title: 'Logout', icon: Icons.logout);
  static final List<DrawerItem> all = [
    profile,
    membership,
    store,
    transactions,
    settings,
    logout
  ];
}
