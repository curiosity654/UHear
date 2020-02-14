import 'package:flutter/material.dart';
import 'package:uhear/pages/home_page.dart';
import 'package:uhear/pages/login_page.dart';
import 'package:oktoast/oktoast.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final routes = <String, WidgetBuilder>{
    LoginPage.tag: (context) => LoginPage(),
    HomePage.tag: (context) => HomePage(),
  };

  @override
  Widget build(BuildContext context) {
    return OKToast(
      position: ToastPosition.bottom,
      child: new MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: new HomePage(),
        routes: routes,
      ),
    );
  }
}
