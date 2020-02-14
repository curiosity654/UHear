import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Future<String> aboutDialog(BuildContext context) async {
  return showDialog<String>(
    context: context,
    barrierDismissible: false, // dialog is dismissible with a tap on the barrier
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('About'),
        content: new Row(
          children: <Widget>[
            Text('Email: wyc654@gmail.com'),
          ],
        ),
        actions: <Widget>[
          FlatButton(
            child: Text('Repository'),
            onPressed: () async {
              String url = 'https://github.com/curiosity654/UHear';
              if (await canLaunch(url)) {
                await launch(url);
              } else {
                throw 'Could not launch $url';
              }
            },
          ),
          FlatButton(
            child: Text('Ok'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}