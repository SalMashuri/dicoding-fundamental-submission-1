import 'package:flutter/material.dart';
import 'package:submission/models/restaurant.dart';
import 'package:submission/pages/HomePage.dart';
import 'package:submission/pages/PageDetail.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "restaurant app",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      initialRoute: "/home",
      routes: {
        "/home": (context) => HomePage(),
        PageDetail.routeName: (context) => PageDetail(
              restaurant:
                  ModalRoute.of(context)?.settings.arguments as Restaurant,
            )
      },
    );
  }
}
