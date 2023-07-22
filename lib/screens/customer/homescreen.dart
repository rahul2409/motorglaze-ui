import 'package:flutter/material.dart';
import 'package:memberships_ui/utils/gesturedetector.dart';

import '../../utils/customisations.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return ScreenGestureDetector(
      titleWidgets: [
        Padding(
          padding: const EdgeInsets.only(
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
      children: [],
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





// Padding(
//                   padding: EdgeInsets.only(
//                     left: 30,
//                     top: 40,
//                     right: 30,
//                   ),
//                   child: GestureDetector(
//                     onTap: () {},
//                     child: Container(
//                       decoration: BoxDecoration(
//                         color: Colors.blue[400]!,
//                         borderRadius: BorderRadius.circular(20),
//                       ),
//                       height: height / 3,
//                       padding: EdgeInsets.all(20.0),
//                       child: Column(
//                         children: [
//                           // Make the first row
//                           Container(
//                             height: height / 9,
//                             child: Row(
//                               children: [
//                                 Padding(
//                                   padding: EdgeInsets.only(
//                                     left: 10,
//                                   ),
//                                   child: Container(
//                                     height: height / 9,
//                                     width: width / 4.5,
//                                     decoration: BoxDecoration(
//                                       color: Color.fromRGBO(219, 172, 52, 1),
//                                       borderRadius:
//                                           BorderRadius.circular(height / 9),
//                                     ),
//                                     child: Icon(
//                                       Icons.beenhere_outlined,
//                                       size: height / 12,
//                                       color: Colors.white,
//                                     ),
//                                   ),
//                                 ),
//                                 Padding(
//                                   padding: EdgeInsets.only(left: 20),
//                                   child: Container(
//                                     height: height / 9,
//                                     width: width / 2.5,
//                                     child: Column(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.start,
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         Text(
//                                           "Annual \nMembership",
//                                           style: customTextStyle(
//                                             fontSize: 18,
//                                           ),
//                                         ),
//                                         SizedBox(
//                                           height: 10,
//                                         ),
//                                         Container(
//                                           height: 20,
//                                           width: 100,
//                                           decoration: BoxDecoration(
//                                             color:
//                                                 Color.fromRGBO(219, 172, 52, 1),
//                                             borderRadius:
//                                                 BorderRadius.circular(10),
//                                           ),
//                                           child: Center(
//                                             child: Text(
//                                               "Best Seller",
//                                               style: customTextStyle(
//                                                 fontSize: 15,
//                                                 fontWeight: FontWeight.bold,
//                                               ),
//                                             ),
//                                           ),
//                                         )
//                                       ],
//                                     ),
//                                   ),
//                                 )
//                               ],
//                             ),
//                           ),
//                           // Make the second Row
//                         ],
//                       ),
//                     ),
//                   ),
//                 )