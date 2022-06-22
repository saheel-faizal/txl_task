import 'package:flutter/material.dart';
import 'package:txl_task/model/user_model.dart';

class DetailScreen extends StatelessWidget {
  static const String routeName = "/details";

  DetailScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    List<UsersModel>? emp = arguments['emp'];
    int index = arguments['index'];

    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  emp![index].name.toString(),
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text("Username : " + emp[index].username.toString()),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 30),
                child: Text("Email : " + emp[index].email.toString()),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 30),
                child: Text("Phone : " + emp[index].phone.toString()),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 30),
                child: Text(
                    "Address :  ${emp[index].address.street} , ${emp[index].address.suite} , ${emp[index].address.city} , zipcode - ${emp[index].address.zipcode}"),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 30),
                child: Text(
                    "Company : ${emp[index].company.name} , ${emp[index].company.catchPhrase} , ${emp[index].company.bs}"),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 30),
                child: Text("Website : " + emp[index].website.toString()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
