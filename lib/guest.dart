
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class guest extends StatefulWidget {
  const guest({super.key});

  @override
  State<guest> createState() => _guestState();
}

class _guestState extends State<guest> {
  String fullname = "Yosia Obeid Fabian";
  String phonenumber = "0779663381";
  String guesttype = "family";
  String guestID = "012";
  String seats = "3";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
            flex: 6,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "images/user.png",
                    width: 128,
                    height: 128,
                  ),
                  Divider(color: Colors.transparent,),
                  Divider(color: Colors.transparent,),
                  Divider(color: Colors.transparent,),
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Guest Name : ",
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            Text(
                                "Guest Phone : ",
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            Text(
                                "Guest Type : ",
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            Text(
                                "Guest ID : ",
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                "$fullname",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                                "$phonenumber ",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                                "$guesttype",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.teal
                              ),
                            ),
                            Text(
                                "$guestID",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.deepOrangeAccent
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              width: double.infinity,
              decoration: new BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(22), topRight: Radius.circular(22)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "ameruhusiwa wageni :",
                    style: TextStyle(
                      color: Colors.white
                    ),
                  ),
                  Text(
                    "$seats",
                    style: TextStyle(
                      fontSize: 80,
                        color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "tu!!",
                    style: TextStyle(
                        color: Colors.white
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      )
    );
  }
}
