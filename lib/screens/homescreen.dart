import 'package:flutter/material.dart';
import 'package:memberships_ui/utils/customisations.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
              xOffset = 200;
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
            child: Column(
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
                                    xOffset = 200;
                                    yOffset = 20;
                                    isDrawerOpen = true;
                                  });
                                },
                              ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 30,
                        ),
                        child: Center(
                          child: Text(
                            "Memberships",
                            style: customTextStyle(fontSize: 24.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // Now add the memberships screen here.
                Padding(
                  padding: EdgeInsets.only(
                    left: 30,
                    top: 40,
                    right: 30,
                  ),
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.blue[400]!,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      height: height / 3,
                      padding: EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          // Make the first row
                          Container(
                            height: height / 9,
                            child: Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: 10,
                                  ),
                                  child: Container(
                                    height: height / 9,
                                    width: width / 4.5,
                                    decoration: BoxDecoration(
                                      color: Color.fromRGBO(219, 172, 52, 1),
                                      borderRadius:
                                          BorderRadius.circular(height / 9),
                                    ),
                                    child: Icon(
                                      Icons.beenhere_outlined,
                                      size: height / 12,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 20),
                                  child: Container(
                                    height: height / 9,
                                    width: width / 2.5,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Annual \nMembership",
                                          style: customTextStyle(
                                            fontSize: 18,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          height: 20,
                                          width: 100,
                                          decoration: BoxDecoration(
                                            color:
                                                Color.fromRGBO(219, 172, 52, 1),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Center(
                                            child: Text(
                                              "Best Seller",
                                              style: customTextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/* 
Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.blue[700]!,
              leading: 
              title: Text(
                "Home",
                style: customTextStyle(fontSize: 20),
              ),
            ),
            body: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: customBackgroundGradient(),
              ),
            ),
          ),
*/
