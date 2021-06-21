import 'package:flutter/material.dart';

class IndexScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("Was hat deine Stadt?"),
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset("assets/images/las_vegas.jpg"),
          Text(
            "Unsere Städte",
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 100.0),
            child: Container(
              height: 1,
              color: Colors.blue,
            ),
          )
        ],
      ),

    );
  }
}
