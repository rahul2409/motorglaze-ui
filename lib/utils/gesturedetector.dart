import 'package:flutter/material.dart';
import 'package:memberships_ui/utils/customisations.dart';

// ignore: must_be_immutable
class ScreenGestureDetector extends StatefulWidget {
  List<Widget> children = [], titleWidgets = [];
  ScreenGestureDetector(
      {required this.children, required this.titleWidgets, super.key});

  @override
  State<ScreenGestureDetector> createState() => _ScreenGestureDetectorState();
}

class _ScreenGestureDetectorState extends State<ScreenGestureDetector> {
  double xOffset = 0;
  double yOffset = 0;

  double height = 0.0, width = 0.0;
  bool isDrawerOpen = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> children = widget.children, titleWidgets = widget.titleWidgets;
    print(titleWidgets);
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          setState(() {
            xOffset = 0;
            yOffset = 0;
            isDrawerOpen = false;
          });
        },
        onHorizontalDragUpdate: (DragUpdateDetails details) {
          if (details.delta.dx > 0) {
            setState(() {
              xOffset = 290;
              yOffset = 200;
              isDrawerOpen = true;
            });
          } else {
            setState(() {
              xOffset = 0;
              yOffset = 0;
              isDrawerOpen = false;
            });
          }
        },
        child: AnimatedContainer(
          decoration: BoxDecoration(
            borderRadius: isDrawerOpen
                ? BorderRadius.circular(28.0)
                : BorderRadius.circular(0.0),
            gradient: customBackgroundGradient(),
          ),
          duration: Duration(milliseconds: 200),
          width: width,
          height: height,
          transform: Matrix4.translationValues(xOffset, yOffset, 0)
            ..scale(isDrawerOpen ? 0.85 : 1.00),
          child: Container(
            decoration: BoxDecoration(
              gradient: customBackgroundGradient(),
            ),
            child: ListView(
              children: [
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        child: isDrawerOpen
                            ? GestureDetector(
                                child: Icon(Icons.arrow_back_ios,
                                    color: Colors.blue[400]!),
                                onTap: () {
                                  setState(() {
                                    xOffset = 0;
                                    yOffset = 0;
                                    isDrawerOpen = false;
                                  });
                                },
                              )
                            : GestureDetector(
                                child:
                                    Icon(Icons.menu, color: Colors.blue[400]!),
                                onTap: () {
                                  setState(() {
                                    xOffset = 290;
                                    yOffset = 20;
                                    isDrawerOpen = true;
                                  });
                                },
                              ),
                      ),
                      ...titleWidgets,
                    ],
                  ),
                ),
                ...children,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
