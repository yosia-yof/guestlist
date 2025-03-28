
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:karibucheck/connection.dart';

class editGuest extends StatefulWidget {
  const editGuest({super.key});

  @override
  State<editGuest> createState() => _editGuestState();
}

class _editGuestState extends State<editGuest> {


  String fullname = "Yosia Obeid Fabian";
  String phonenumber = "0779663381";
  String guesttype = "family";
  String guestID = "012";
  String seats = "3";
  Future<Map<String, dynamic>?> fetchGuestById(int guestID) async {
    final url = Uri.parse("$link"); // Replace with actual GitHub raw URL

    try {
      final response = await http.get(url);
      if (response.statusCode != 200) throw Exception("Failed to load JSON");

      final data = json.decode(response.body);
      final guests = data["guests"] as List<dynamic>;

      // Analyze: Count guests by type
      final guestTypeCount = <String, int>{};
      for (var guest in guests) {
        guestTypeCount[guest["type"]] = (guestTypeCount[guest["type"]] ?? 0) + 1;
      }
      print("Total Guests: ${guests.length}");
      guestTypeCount.forEach((type, count) => print("$type: $count guests"));

      // Search for the guest by ID
      return guests.firstWhere((guest) => guest["guestID"] == guestID, orElse: () => null);
    } catch (e) {
      print("Error: $e");
      return null;
    }
  }







  @override
  Widget build(BuildContext context) {
    String arg = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
        appBar: AppBar(),
        body : FutureBuilder(
            future: fetchGuestById(int.parse(arg)),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator()); // Loader
            } else if (snapshot.hasError) {
              return Center(child: Text("Error: ${snapshot.error}"));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(child: Text("No data available"));
            } else {
              try{
                Map data = snapshot.data as Map;
                print(data['guests']);
                return Column(
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
                                        "${data['name']}",
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "${data['phone']}",
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "${data['type']}",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.teal
                                        ),
                                      ),
                                      Text(
                                        "${data['guestID']}",
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
                );
              }catch(e){
                return Center(
                  child: Text(e.toString()),
                );
              }

            }
          },
        ),

    );
  }
}
