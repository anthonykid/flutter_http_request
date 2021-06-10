import 'dart:convert';
import 'package:http/http.dart' as http;

class User {
  String id;
  String name;

  User({this.id, this.name});

  factory User.createUser(Map<String, dynamic> object) {
    return User(
        id: object['id'].toString(),
        name: object['first_name'] + " " + object['last_name']);
  }

  static Future<List<User>> getUsers(String page) async { //using future because we need to take the data from future,
    String apiURL = "https://reqres.in/api/users?page=" + page;

    var apiResult = await http.get(apiURL);
    var jsonObject = json.decode(apiResult.body); //decode to json
    List<dynamic> listUser = (jsonObject as Map<String, dynamic>)['data']; //turning the String, Dynamic

    List<User> users = [];
    for (int i = 0; i < listUser.length; i++) //for what we want to have which users we want the data
      users.add(User.createUser(listUser[i])); //Adds [value] to the end of this list, extending the length by one

    return users;
  }
}
