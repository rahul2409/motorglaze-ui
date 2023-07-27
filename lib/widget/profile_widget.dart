import 'package:flutter/material.dart';

class ProfileWidget extends StatelessWidget {
  final VoidCallback onClick;
  final String imagePath;
  const ProfileWidget(
      {required this.onClick, required this.imagePath, super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          buildImage(),
          Positioned(
            bottom: 0,
            right: 4,
            child: buildEditButton(Colors.blue),
          ),
        ],
      ),
    );
  }

  Widget buildImage() {
    final image = NetworkImage(imagePath);
    return ClipOval(
      child: Material(
        color: Colors.transparent,
        child: Ink.image(
          image: image,
          fit: BoxFit.cover,
          width: 128,
          height: 128,
          child: InkWell(
            onTap: onClick,
          ),
        ),
      ),
    );
  }

  Widget buildEditButton(Color color) => buildCircle(
        color: Colors.white,
        all: 3,
        child: buildCircle(
          color: color,
          all: 8,
          child: const Icon(
            Icons.edit,
            color: Colors.white,
            size: 20,
          ),
        ),
      );
  Widget buildCircle(
          {required Color color, required double all, required Widget child}) =>
      ClipOval(
        child: Container(
          color: color,
          child: child,
          padding: EdgeInsets.all(all),
        ),
      );
}
