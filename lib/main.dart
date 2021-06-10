import 'package:flutter/material.dart';
import 'package:flutter_http_request/post_result_model.dart';
import 'package:flutter_http_request/user_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String output = "no data";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.indigo[100],
        appBar: AppBar(
          title: Text("API Demo"),
          backgroundColor: Colors.indigo[800],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment
                .spaceEvenly, //Place the free space evenly between the children as well as before and after the first and last child.
            children: <Widget>[
              Text(
                  output), //if there is no data then the text would be shown as No Data
              RaisedButton(
                onPressed: () {
                  User.getUsers("2").then((users) { //the page we want to show
                    //whichwe want the users data to request
                    output = "";
                    for (int i = 0; i < users.length; i++)
                      output = output + "[" + users[i].name + "]";
                    setState(() {});
                  });
                },
                child: Text("GET"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
