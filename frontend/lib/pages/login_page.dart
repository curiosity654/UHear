import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:uhear/dialogs/loading_dialog.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  static String tag = 'login-page';
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  TextEditingController _usernameCtl = new TextEditingController();
  TextEditingController _pswCtl = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    final logo = new Hero(
      tag: 'hero',
      child: new CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 40,
        child: new Image.asset('assets/logo.png'),
      ),
    );

    final username = new TextFormField(
      controller: _usernameCtl,
      keyboardType: TextInputType.text,
      autofocus: false,
      decoration: new InputDecoration(
          hintText: 'Username',
          contentPadding: new EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border: new OutlineInputBorder(
              borderRadius: BorderRadius.circular(32.0))),
    );

    final password = new TextFormField(
      controller: _pswCtl,
      keyboardType: TextInputType.visiblePassword,
      autofocus: false,
      obscureText: true,
      decoration: new InputDecoration(
          hintText: 'Password',
          contentPadding: new EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border: new OutlineInputBorder(
              borderRadius: BorderRadius.circular(32.0))),
    );

Future _login() async {
      Dio dio = Dio();

      dio.options.baseUrl = 'http://localhost:5000/';

      dio.interceptors
        ..add(LogInterceptor(
          requestHeader: true,
          requestBody: true,
          responseHeader: true,
          responseBody: true,
        ));

      // check connectivity
      var connectivityRes = await (Connectivity().checkConnectivity());
      if (connectivityRes == ConnectivityResult.none) {
        print('Network error');
      } else {
        print(ConnectivityResult.values);
      }

      // Add Timeout

      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return new LoadingDialog(text: 'Loading');
        }
      );

      Response response = await dio.post('user/login',
          data: {
            'username': username.controller.text,
            'password': password.controller.text
          });

      Navigator.pop(context);

      if (response.statusCode == 200) {
        // todo complete logic
        if (response.data == '0') {
          Navigator.of(context).pushNamed(HomePage.tag);
          print('Login Success');
        } else if (response.data == '1') {
          print('Wrong Password');
        } else {
          print('Account doesn\'t exist.');
        }
      }
    }

    final loginButton = new Padding(
      padding: new EdgeInsets.symmetric(vertical: 16.0),
      child: new Material(
        borderRadius: BorderRadius.circular(10.0),
        shadowColor: Colors.lightBlueAccent.shade100,
        elevation: 5.0,
        child: new MaterialButton(
          minWidth: 200.0,
          height: 42.0,
          onPressed: () {
            _login();
          },
          color: Colors.lightBlueAccent,
          child: new Text('Log in'),
        ),
      ),
    );

    final forgetPsw = new FlatButton(
      onPressed: () {},
      child: new Text('Forget Password?'),
    );

    return new Scaffold(
        backgroundColor: Colors.white,
        body: new Center(
            child: new Container(
          width: 300,
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              logo,
              SizedBox(height: 48.0),
              username,
              SizedBox(height: 8.0),
              password,
              SizedBox(height: 24.0),
              loginButton,
              forgetPsw
            ],
          ),
        )));
  }
}
