import 'package:flutter/material.dart';

class ContentScreen extends StatefulWidget {
  static MaterialPageRoute route(String name) =>
      MaterialPageRoute(builder: (_) => screen(name));

  static Widget screen(String name) => ContentScreen(name);

  final String name;

  ContentScreen(this.name);

  @override
  _ContentScreenState createState() => _ContentScreenState();
}

class _ContentScreenState extends State<ContentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text("Web - Demo"),
      ),
      body: Center(
        child: Text(
          "Salom ${widget.name}",
          style: TextStyle(fontSize: 40),
        ),
      ),
    );
  }
}
