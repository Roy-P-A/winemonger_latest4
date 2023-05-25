import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

// import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;



class LoginController extends GetxController {
  final _message = "".obs;
  String get message => _message.value;
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void onClose() {
    usernameController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  loginWithEmail() async {
    final http.Response response;

    try {
      response = await http
          .post(Uri.parse('http://winemonger.nintriva.com/api/login'), body: {
        'username': usernameController.text,
        'password': passwordController.text
      });
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        var cookies = response.headers['set-cookie'];
        // var box = await Hive.openBox('myBox');
        // await box.clear();
        // await box.put('apiKey', '${data['api_Key']}');
        // await box.put('firstname', '${data['firstname']}');
        // await box.put('lastname', '${data['lastname']}');
        // await box.put('userlevel', '${data['userlevel']}');
        // await box.put('cookie', '$cookies');
        // print(box.get('apikey'));
        // print(box.get('firstname'));
        // print(box.get('lastname'));
        // print(box.get('userlevel'));
        // print(box.get('cookie'));
          _message.value = 'Login successfully';
      } else{
        var data= jsonDecode(response.body.toString());

_message.value = data['message'].toString();

      }
    } on SocketException{
          _message.value = "Cannot login. No Internet Connection";

    }
    
    catch (e) {
       _message.value="Cannot login";
    }
  }
}
