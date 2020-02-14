import 'package:dio/dio.dart';
import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter/material.dart';
import 'package:adhara_socket_io/adhara_socket_io.dart';
import 'package:oktoast/oktoast.dart';
import 'package:uhear/dialogs/about_dialog.dart';
import 'package:uhear/socket_util.dart';
import 'package:uhear/widgets/player_widget.dart';
import 'package:uhear/global.dart';
import 'search_page.dart';
import 'package:uhear/dialogs/input_dialog.dart';
import 'package:uhear/event_util.dart';
import 'package:flutter/services.dart';

const String socketUrl = 'http://localhost:5000';

class HomePage extends StatefulWidget {
  static String tag = 'home-page';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Dio dio;
  SocketIOManager manager;
  Map<String, SocketIO> sockets = {};
  PlayerWidget _player;

  @override
  void initState() {
    super.initState();
    dio = Dio();
    manager = SocketIOManager();
    _player = new PlayerWidget(url: null);
    eventBus.on<Events>().listen((Events data) {
      handleEvent(data.event);
    });
    //TODO: note this initialzation can be optimized
    socketUtil.initSocket();
  }

  void handleEvent(String event) {
    if (event == 'changePic') {
      setState(() {});
    }
  }

  void play() {
    socketUtil.sockets['init'].emit('play', [
      {'data': 'start'}
    ]);
  }

  void pause() {
    socketUtil.sockets['init'].emit('pause', [
      {'data': 'pause'}
    ]);
  }

  void toClipBoard() {
    Clipboard.setData(new ClipboardData(text: Global.roomId));
    showToast('房间号'+ Global.roomId +'已复制到剪贴板');
  }

  Widget body() {
    return Center(
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Global.roomId == ''
            ? Text('press to create room',)
            : Text(Global.roomId),
          new SizedBox(height: 20.0,),
          new Container(
            child: Global.artWork == ''
                ? Image.asset('assets/default_artwork.jpg')
                : Image.network(Global.artWork),
            width:250,
            height: 250,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                color: Colors.black,
                offset: Offset(3.0, 3.0),
                blurRadius: 4.0
              )
              ]
            ),
          ),
          _player,
          // new MaterialButton(
          //   color: Colors.amber,
          //   minWidth: 200.0,
          //   height: 42.0,
          //   child: Text('Create room'),
          //   onPressed: () {
          //     setState(() {
          //       socketUtil.createRoom();
          //     });
          //   },
          // ),
          // new MaterialButton(
          //   color: Colors.amber,
          //   minWidth: 200.0,
          //   height: 42.0,
          //   child: Text('Leave room'),
          //   onPressed: () {
          //     socketUtil.leaveRoom();
          //   },
          // ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Uhear'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.info),
              onPressed: () {
                aboutDialog(context);
              },
            ),
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                showSearch(context: context, delegate: SearchPageDelegate());
              },
            )
          ],
        ),
        // floatingActionButton: FloatingActionButton(
        //   child: Icon(Icons.add),
        //   onPressed: () async {
        //     String roomId = await inputDialog(context);
        //     if (roomId != '') {
        //       Global.roomId = roomId;
        //       setState(() {
        //         socketUtil.joinRoom(roomId);
        //       });
        //     }
        //   },
        // ),
        resizeToAvoidBottomInset: false,
        body: FabCircularMenu(
          child: body(),
          animationDuration: Duration(milliseconds: 500),
          ringDiameter: 150.0,
          ringWidth: 60.0,
          ringColor: Colors.blueAccent,
          options: <Widget>[
            IconButton(
              icon: Icon(Icons.group_add),
              onPressed: () async {
                String roomId = await inputDialog(context);
                if (roomId != '' && roomId != null) {
                  Global.roomId = roomId;
                  setState(() {
                    socketUtil.joinRoom(roomId);
                  });
                }
              },
              iconSize: 35.0,
              color: Colors.white,
            ),
            IconButton(
              icon: Icon(Icons.add_circle),
              onPressed: () {
                setState(() {
                  socketUtil.createRoom();
                  toClipBoard();
                });
              },
              iconSize: 35.0,
              color: Colors.white,
            ),
            IconButton(
              icon: Icon(Icons.cancel),
              onPressed: () {},
              iconSize: 35.0,
              color: Colors.white,
            ),
            IconButton(
              icon: Icon(Icons.content_paste),
              onPressed: () {
                toClipBoard();
              },
              iconSize: 35.0,
              color: Colors.white,
            )
          ],
        ));
  }
}
