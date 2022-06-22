import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:txl_task/model/user_model.dart';

class WebService {
  Future<List<UsersModel>> getUsersData() async {
    var response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));

    if (response.statusCode == 200) {
      List<UsersModel> jsonResponse = jsonDecode(response.body)
          .map((e) => UsersModel.fromJson(e))
          .toList()
          .cast<UsersModel>();
          return jsonResponse;
    } else {
      throw Exception("Error Occured");
    }
  }
}
