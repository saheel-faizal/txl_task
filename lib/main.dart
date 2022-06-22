import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:txl_task/provider/usersDataProvider.dart';
import 'package:txl_task/screens/detail_page.dart';
import 'package:txl_task/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=> UserDataProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'txl test',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          HomeScreen.routeName:(context) => HomeScreen(),
          DetailScreen.routeName:(context) => DetailScreen()
        },
        initialRoute: HomeScreen.routeName,
        
      ),
    );
  }
}
