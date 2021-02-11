import 'dart:math';

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String name = "fdsgd";

  @override
  void initState() {
    name = "${Random().nextInt(10000)}";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("$name")),
      floatingActionButton: FloatingActionButton(onPressed: () async {
        var client = new http.Client();
        try {
          String theUrl = 'https://jsonplaceholder.typicode.com/users';

          // String theUrl = 'http://185.16.40.113:8080/api/slogan/random';
          var res = await client.get(theUrl, headers: {
            "Access-Control-Allow-Origin": "*",
            "Access-Control-Expose-Headers": "*",
            "Access-Control-Max-Age": "*",
            "Access-Control-Allow-Credentials": "*",
            "Access-Control-Allow-Methods": "*",
            "Access-Control-Allow-Headers": "*",
            "Origin": "*",
            "Access-Control-Request-Method": "*"
          });
          var responsBody = json.decode(res.body);
          setState(() => name = responsBody.toString());
          print(responsBody);
        } catch (e) {
          setState(() => name = "$e");
          print(e);
        } finally {
          print("End");
          // client.close();
        }
      }),
    );
  }
}
