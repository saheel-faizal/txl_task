import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:txl_task/model/user_model.dart';
import 'package:txl_task/provider/usersDataProvider.dart';
import 'package:txl_task/screens/detail_page.dart';
import 'package:txl_task/services/web_services.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "/home";
  HomeScreen({Key? key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<UserDataProvider>(context, listen: false).getUserProviderData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Consumer<UserDataProvider>(builder: (ctx, userProvider, child) {
          if (userProvider.userModel.isNotEmpty) {
            List<UsersModel> users = userProvider.userModel;
            return ListView.builder(
                physics: const ScrollPhysics(),
                shrinkWrap: true,
                itemCount: users.length,
                itemBuilder: (ctx, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        '/details',
                        arguments: {'emp': users, 'index': index},
                      );
                    },
                    child: ListTile(
                      leading: const FlutterLogo(),
                      title: Text(users[index].name.toString()),
                    ),
                  );
                });
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        }));
  }
}
