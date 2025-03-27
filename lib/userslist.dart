
import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class userslist extends StatefulWidget {
  const userslist({super.key});

  @override
  State<userslist> createState() => _userslistState();
}

class _userslistState extends State<userslist> {
  
  Widget guest(String fullname, String phonenumber, int guestID,){
    return Padding(
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Icon(
              Icons.account_circle_outlined,
              size: 50,
              color: Colors.blue,
            ),
          ),
          Expanded(
            flex: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "$fullname",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                    "$phonenumber",
                  style: TextStyle(
                    //fontSize: 10,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed("/guest");
              },
              //elevation: 0,
              // style: RoundedRectangleBorder(
              //     borderRadius: BorderRadius.circular(25),
              // ),
              //color: Colors.indigo,
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.deepOrangeAccent)
              ),
              child: Text(
                'Edit',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,),
              ),
            ),
          ),
        ],
      ),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text(
          "Guest List"
        ),
      ),
      body: ListView(
        children: [
          guest("Yosia Obeid Fabian", "079663381", 12),
          guest("Robert De Niro", "07876265345", 13),
        ],
      ),
    );
  }
}
