
import 'package:http/http.dart' as http;

import '../models/single_profile_model.dart';
import '../models/user_model.dart';
class ApiService{


  //User List
  Future<List<UserModel>> getUserList() async {
    var response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));

    if (response.statusCode == 200) {
      var jsondata = response.body;
      // print(jsondata);
      // getProfile();
      return userModelFromJson(jsondata);
    } else {
      throw Exception("Something Went Wrong");
    }
  }

  //Single Profile
  Future<ProfileModel> getSingleProfile() async {
    var response = await http.get(Uri.parse("https://reqres.in/api/users?page=2"));

    if (response.statusCode == 200) {
      var jsondata = response.body;
      print("ProfileModel ----$jsondata");
      // getProfile();
      return profileModelFromJson(jsondata);
    } else {
      throw Exception("Something Went Wrong");
    }
  }
}