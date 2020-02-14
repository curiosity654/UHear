import 'package:uhear/models/search_result.dart';

abstract class SearchState {}

class SearchError extends SearchState {
  @override
  String toString() => 'SearchError：获取失败';
}

class SearchUninitialized extends SearchState {
  @override
  String toString() => 'SearchUninitialized：未初始化';
}

class SearchLoading extends SearchState {
  @override
  String toString() => 'SearchLoading ：正在加载';
}

class SearchLoaded extends SearchState {
  final List<Songs> res;

  SearchLoaded({
    this.res,
  });

  @override
  String toString() => 'SearchLoaded：加载完毕';
}