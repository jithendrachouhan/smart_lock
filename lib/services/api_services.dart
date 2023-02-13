import 'package:http/http.dart' as http;

import '../models/user_model.dart';
import '../consts/secrets.dart';

class ApiServices{

  Future<bool> registerUser(UserModel userModel) async{
    bool isRegistered = false;
    var headers = {
      'Content-Type': 'application/x-www-form-urlencoded',
    };
    var request = http.Request('POST', Uri.parse('https://euapi.ttlock.com/oauth2/token'));
    request.bodyFields = {
      'clientId': clientId,
      'clientSecret': clientSecret,
      'username': 'c042f4db68f23406c6cecf84a7ebb0fe',
      'password': 'e4b6f10a0d3c623204538a0480ff187a',
      'date': DateTime.now().millisecondsSinceEpoch.toString()
    };
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
      isRegistered = true;
    }
    else {
      print(response.reasonPhrase);
    }
    return isRegistered;
  }

/*  Future<void> getAccessToken() async{

  }

  Future<void> getRefreshToken() async{
    var header = {
      'Content-Type': 'application/x-www-form-urlencoded',
    };
    var request = http.Request()
  }*/



}