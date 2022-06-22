import 'package:flutter/material.dart';
import 'package:txl_task/model/user_model.dart';
import 'package:txl_task/services/web_services.dart';

class UserDataProvider extends ChangeNotifier {
  List<UsersModel> userModel = [];
  WebService webService = WebService();

  getUserProviderData() async {
    userModel = await webService.getUsersData();
    notifyListeners();
  }
}
