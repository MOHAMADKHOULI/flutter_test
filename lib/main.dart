import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/page_email.dart';
import 'package:flutter_application_1/page_geo.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: main_page(),
      theme: ThemeData(
        useMaterial3: true,
      ),
    );
  }
}

class main_page extends StatefulWidget {
  const main_page({super.key});

  @override
  State<main_page> createState() => _main_page();
}

class _main_page extends State<main_page> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Center(child: Text("Dio")),
          bottom: TabBar(tabs: [
            Tab(
              text: 'Email',
              icon: Icon(Icons.email),
            ),
            Tab(
              text: 'GeoLat',
              icon: Icon(Icons.map),
            )
          ]),
        ),
        body: TabBarView(children: [email(), geo_lat()]),
      ),
    );
  }
}

get_data() async {
  Dio restfull = Dio();
  Response response =
      await restfull.get('https://jsonplaceholder.typicode.com/users');
  return response.data;
}
