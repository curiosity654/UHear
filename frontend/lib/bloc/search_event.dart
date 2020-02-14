abstract class SearchEvent {}

class SearchFetch extends SearchEvent {
  final String query;
  SearchFetch({this.query});
  @override
  String toString() => 'SearchFetch: 获取搜索结果事件';
}