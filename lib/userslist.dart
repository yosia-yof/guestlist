
import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:karibucheck/connection.dart';

class userslist extends StatefulWidget {
  const userslist({super.key});

  @override
  State<userslist> createState() => _userslistState();
}

class _userslistState extends State<userslist> {

  Future<Map<String, dynamic>> fetchJsonData() async {
    final url = Uri.parse(link);
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception("Failed to load JSON");
    }
  }


  
  Widget guest(String fullname, String phonenumber, String guestID,){
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
                Navigator.pushNamed(context, '/editGuest', arguments: guestID);
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
      // body: ListView(
      //   children: [
      //     guest("Yosia Obeid Fabian", "079663381", 12),
      //     guest("Robert De Niro", "07876265345", 13),
      //   ],
      // ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: fetchJsonData(),
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
              List guests = data["guests"];
              return ListView.builder(
                itemCount: guests.length,
                itemBuilder: (context, index) {
                  final item = guests[index];
                  return guest("${item['name']}", "${item['phone']}", "${item['guestID']}");
                },
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
