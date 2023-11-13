import 'package:flutter/material.dart';
import 'package:flutter_application_1/config/get_it.dart';
import 'package:flutter_application_1/model.dart/products_model.dart';
import 'package:flutter_application_1/model.dart/user_model.dart';
import 'package:flutter_application_1/servics/get_data.dart';
import 'package:flutter_application_1/servics/post_login.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setup();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: (config.get<SharedPreferences>().getString('token') == null)
          ? LogIn()
          : HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              dynamic temp = snapshot.data;
              ProductModel result = ProductModel.fromMap(temp);
              return ListTile(
                title: Text(result.title),
                subtitle: Text(result.description),
                trailing: Text(result.brand),
              );
            } else {
              return Center(
                child: LinearProgressIndicator(),
              );
            }
          }),
    );
  }
}

class LogIn extends StatelessWidget {
  const LogIn({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Login",
              style: TextStyle(fontSize: 20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40)),
                  labelText: 'UserName'),
              controller: email,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40)),
                  labelText: 'Password'),
              controller: password,
            ),
          ),
          ElevatedButton(
              onPressed: () async {
                await Login(
                    UserModel(username: email.text, password: password.text));
                  await  Navigator.push(context,MaterialPageRoute(builder: (context)=>HomePage()));
              },
              child: Center(
                child: Text('Login'),
              ))
        ]),
      ),
    );
  }
}
