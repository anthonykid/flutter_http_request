import 'package:flutter/material.dart';
import 'package:flutter_http_request/post_result_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  PostResult postResult = null; 

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("API Demo"),
          backgroundColor: Colors.indigo[800],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly, //Place the free space evenly between the children as well as before and after the first and last child.
            children: <Widget>[
              Text((postResult != null) //if condition for if there is data that we want, then it will show us all that we requested
                  ? postResult.id +
                      " | " +
                      postResult.name +
                      " | " +
                      postResult.job +
                      " | " +
                      postResult.created
                  : "No Data"), //if there is no data then the text would be shown as No Data
              RaisedButton(
                onPressed: () {
                  PostResult.connecToAPI("Anthony", "Doctor").then((value) {
                    //this is what we want to take from the db, we use connecToAPI to connect and request our following data
                    postResult = value;
                    setState(() {}); //Notify the framework that the internal state of this object has changed.
                  });
                },
                child: Text("POST"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
