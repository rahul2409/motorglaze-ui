import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DrawerMenuWidget extends StatelessWidget {
  final VoidCallback onClick;
  const DrawerMenuWidget({required this.onClick, super.key});

  @override
  Widget build(BuildContext context) => IconButton(
        onPressed: onClick,
        color: Colors.white,
        icon: FaIcon(FontAwesomeIcons.alignLeft),
      );
}
