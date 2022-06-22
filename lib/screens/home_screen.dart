import 'package:flutter/material.dart';
import 'package:txl_task/model/user_model.dart';
import 'package:txl_task/screens/detail_page.dart';
import 'package:txl_task/services/web_services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: FutureBuilder(
            future: WebService().getUsersData(),
            builder: (ctx, AsyncSnapshot<List<UsersModel>> snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    physics: const ScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: snapshot.data?.length,
                    itemBuilder: (ctx, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailScreen(
                                        emp: snapshot.data,
                                        index: index,
                                      )));
                        },
                        child: ListTile(
                          leading: const FlutterLogo(),
                          title: Text(snapshot.data![index].name.toString()),
                        ),
                      );
                    });
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            }));
  }
}
