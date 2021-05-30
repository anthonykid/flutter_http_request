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
  PostResult postResult = null;
  User user = null;

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
              Text((user !=
                      null) //if condition for if there is data that we want, then it will show us all that we requested
                  ? user.id + " | " + user.name
                  : "No Data"), //if there is no data then the text would be shown as No Data
              RaisedButton(
                onPressed: () {
                  User.connectToAPI("3").then((value) {
                    user = value;
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
