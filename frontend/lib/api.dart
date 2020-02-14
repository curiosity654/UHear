import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:uhear/models/album_details.dart';
import 'package:uhear/models/song_url.dart';
import 'models/search_result.dart';

const String apiUrl = 'http://localhost:3000';

class Api {
  Future<List<Songs>> search(keyword) async {
    http.Response response =
        await http.get(apiUrl + '/search?keywords=' + keyword);
    var data = SearchResult.fromJson(json.decode(response.body));
    return data.result.songs;
  }

  Future<String> songUrl(id) async {
    http.Response response = await http.get(apiUrl + '/song/url?id=' + id);
    var res = SongUrl.fromJson(json.decode(response.body));
    //TODO: Handle Exception
    return res.data[0].url;
  }

  Future<AlbumDetails> albumDetails(id) async {
    http.Response response = await http.get(apiUrl + '/album?id=' + id);
    var res = AlbumDetails.fromJson(json.decode(response.body));
    //TODO: Handle Exception
    return res;
  }
}

Api api = Api();