import 'dart:convert';

import 'package:http/http.dart' as http;

class PostResult {
  String id;
  String name;
  String job;
  String created; //its okay to have the name diffrent with the database

  PostResult({this.id, this.name, this.job, this.created});

  //factory method creating object from mapping the json object
  factory PostResult.createPostResult(
      Map<String, dynamic>
          object) //we put dynamic so we can take even the key map wasn't a string (e.g id = int)
  {
    return PostResult(
        id: object[
            'id'], //we put our String from class PostResult and inside ('') is a key from the web database
        name: object['name'], //we put our String from class PostResult and inside ('') is a key from the web database
        job: object['job'], //we put our String from class PostResult and inside ('') is a key from the web database
        created: object['createdAt'] //createdAt is the key in the db
        );
  }
  static Future<PostResult> connecToAPI(String name, String job) async {
    String apiURL = "https://reqres.in/api/users"; //this is the apiURL that we are gonna requested

    var apiResult = await http //we use await because async
        .post(apiURL, body: {"name": name, "job": job}); //havent taken the JSON
    var jsonObject = json.decode(apiResult.body); //this is for mapping it JSON

    return PostResult.createPostResult(jsonObject); //we would return the jsonObject after its done mapping it JSON
  }
}
