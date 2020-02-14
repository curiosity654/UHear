import 'package:adhara_socket_io/adhara_socket_io.dart';
import 'global.dart';
import 'event_util.dart';

const String socketUrl = 'http://localhost:5000';

const String socketId = 'init';

class SocketUtil {
  SocketIOManager manager;
  Map<String, SocketIO> sockets = {};

  SocketUtil() {
    manager = SocketIOManager();
  }

  Future<int> initSocket() async {
    if (sockets[socketId] != null) {
      print('socket exist');
      return -1;
    }
    SocketOptions socketOptions = new SocketOptions(
      socketUrl,
      // transports: [Transports.POLLING],
      transports: [Transports.WEB_SOCKET],
    );
    SocketIO socket = await manager.createInstance(socketOptions);
    socket.onConnect((data) {
      print("connected");
    });
    socket.onConnectError((err) {
      print('connect error');
    });
    socket.onConnectTimeout((_) => print('------------connect timeout------------'));
    socket.onError((_) => print('socket error'));
    socket.onDisconnect((_) => print('disconnected'));
    socket.on("play", (data) {
      if (data['userId'] != Global.userId) {
        eventBus.fire(new Events('play'));
        print('------------user ' + data['userId'] + ' started playing------------');
      }
    });
    socket.on("pause", (data) {
      if (data['userId'] != Global.userId) {
        eventBus.fire(new Events('pause'));
        print('------------user ' + data['userId'] + ' paused playing------------');
      }
    });
    socket.on("stop", (data) {
      if (data['userId'] != Global.userId) {
        eventBus.fire(new Events('stop'));
        print('------------user ' + data['userId'] + ' stoped playing------------');
      }
    });
    socket.on("changeSong", (data) async {
      if (data['userId'] != Global.userId) {
        Global.songId = data['songId'];
        Global.songUrl = data['songUrl'];
        Global.songName = data['songName'];
        Global.artistName = data['artistName'];
        Global.artWork = data['artWork'];
        eventBus.fire(new Events('changePic'));
        print('------------change song------------');
      }
    });
    socket.connect();
    sockets[socketId] = socket;
    return socket.id;
  }

  void createRoom() {
    // Use present time as id
    String roomId = DateTime.now().toIso8601String().substring(20);
    Global.roomId = roomId;
    String userId = DateTime.now().toIso8601String().substring(20);
    Global.userId = userId;
    sockets[socketId].emit('join', [{'roomId': roomId, 'userId': userId}]);
  }

  void joinRoom(String roomId) {
    Global.roomId = roomId;
    String userId = DateTime.now().toIso8601String().substring(20);
    Global.userId = userId;
    sockets[socketId].emit('join', [{'roomId': roomId, 'userId': userId}]);
  }

  void leaveRoom() {
    sockets[socketId].emit('leave', [{'roomId': Global.roomId, 'userId': Global.userId}]);
    manager.clearInstance(sockets[socketId]);
    sockets.remove(socketId);
    print('------------socket closed------------');
  }

  void play() {
    if (Global.userId == '') {print('no user id'); return;}
    sockets[socketId].emit('play', [{'roomId': Global.roomId, 'userId': Global.userId}]);
  }

  void pause() {
    if (Global.userId == 'null') {print('no user id'); return;}
    sockets[socketId].emit('pause', [{'roomId': Global.roomId, 'userId': Global.userId}]);
  }

  void stop() {
    if (Global.userId == 'null') {print('no user id'); return;}
    sockets[socketId].emit('stop', [{'roomId': Global.roomId, 'userId': Global.userId}]);
  }

  void changeSong() {
    sockets[socketId].emit('changeSong', [{'songId': Global.songId, 'songName': Global.songName, 'artistName': Global.artistName, 'songUrl': Global.songUrl, 'artWork': Global.artWork, 'roomId': Global.roomId}]);
  }
}

SocketUtil socketUtil = SocketUtil();
