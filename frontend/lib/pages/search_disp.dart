import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uhear/bloc/search_bloc.dart';
import 'package:uhear/bloc/search_event.dart';
import 'package:uhear/bloc/search_state.dart';
import 'package:uhear/global.dart';
import 'package:uhear/pages/search_page.dart';
import 'package:uhear/api.dart';
import 'package:uhear/event_util.dart';
import 'package:uhear/socket_util.dart';

class SearchDisp extends StatefulWidget {
  final SearchPageDelegate delegate;
  final String query;
  SearchDisp({this.delegate, this.query});

  @override
  _SearchDispState createState() => _SearchDispState();
}

class _SearchDispState extends State<SearchDisp> {
  final SearchBloc _search = SearchBloc();
  String old;
  @override
  void dispose() {
    _search.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (old != widget.query) {
      _search.add(SearchFetch(query: widget.query));
      old = widget.query;
    }
    return BlocBuilder(
      bloc: _search,
      builder: (BuildContext context, SearchState state) {
        if (state is SearchUninitialized || state is SearchLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } 
        else if (state is SearchError) {
          return Center(
            child: Text('获取失败'),
          );
        }
        else if (state is SearchLoaded) {
          return ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                dense: true,
                leading: Icon(
                  Icons.music_note,
                  size: 30,
                ),
                title: Text(
                  state.res[index].name,
                  overflow: TextOverflow.ellipsis,
                ),
                // TODO: display all artists
                subtitle: Text(state.res[index].artists[0].name),
                onTap: () async {
                  // TODO: assign id and url
                  socketUtil.stop();

                  eventBus.fire(new Events('stop'));
                  String _id = state.res[index].id.toString();
                  String _albumid = state.res[index].album.id.toString();
                  String _songName = state.res[index].name;
                  String _artistName = state.res[index].artists[0].name;
                  Global.songId = _id;
                  Global.songUrl = await api.songUrl(_id);
                  Global.songName = _songName;
                  Global.artistName = _artistName;
                  var album = await api.albumDetails(_albumid);
                  Global.artWork = album.album.picUrl;

                  socketUtil.changeSong();
                  
                  print(state.res[index].name);
                  Navigator.of(context).pop();
                  eventBus.fire(new Events('play'));
                  eventBus.fire(new Events('changePic'));

                  socketUtil.play();
                },
              );
            },
          );
        }
        return Center(
          child: Text('Error'),
        );
      }
    );
  }
}