class SongUrl {
  List<Data> _data;
  int _code;

  SongUrl({List<Data> data, int code}) {
    this._data = data;
    this._code = code;
  }

  List<Data> get data => _data;
  set data(List<Data> data) => _data = data;
  int get code => _code;
  set code(int code) => _code = code;

  SongUrl.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      _data = new List<Data>();
      json['data'].forEach((v) {
        _data.add(new Data.fromJson(v));
      });
    }
    _code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._data != null) {
      data['data'] = this._data.map((v) => v.toJson()).toList();
    }
    data['code'] = this._code;
    return data;
  }
}

class Data {
  int _id;
  String _url;
  int _br;
  int _size;
  String _md5;
  int _code;
  int _expi;
  String _type;
  int _gain;
  int _fee;
  Null _uf;
  int _payed;
  int _flag;
  bool _canExtend;
  Null _freeTrialInfo;
  String _level;
  String _encodeType;

  Data(
      {int id,
      String url,
      int br,
      int size,
      String md5,
      int code,
      int expi,
      String type,
      int gain,
      int fee,
      Null uf,
      int payed,
      int flag,
      bool canExtend,
      Null freeTrialInfo,
      String level,
      String encodeType}) {
    this._id = id;
    this._url = url;
    this._br = br;
    this._size = size;
    this._md5 = md5;
    this._code = code;
    this._expi = expi;
    this._type = type;
    this._gain = gain;
    this._fee = fee;
    this._uf = uf;
    this._payed = payed;
    this._flag = flag;
    this._canExtend = canExtend;
    this._freeTrialInfo = freeTrialInfo;
    this._level = level;
    this._encodeType = encodeType;
  }

  int get id => _id;
  set id(int id) => _id = id;
  String get url => _url;
  set url(String url) => _url = url;
  int get br => _br;
  set br(int br) => _br = br;
  int get size => _size;
  set size(int size) => _size = size;
  String get md5 => _md5;
  set md5(String md5) => _md5 = md5;
  int get code => _code;
  set code(int code) => _code = code;
  int get expi => _expi;
  set expi(int expi) => _expi = expi;
  String get type => _type;
  set type(String type) => _type = type;
  int get gain => _gain;
  set gain(int gain) => _gain = gain;
  int get fee => _fee;
  set fee(int fee) => _fee = fee;
  Null get uf => _uf;
  set uf(Null uf) => _uf = uf;
  int get payed => _payed;
  set payed(int payed) => _payed = payed;
  int get flag => _flag;
  set flag(int flag) => _flag = flag;
  bool get canExtend => _canExtend;
  set canExtend(bool canExtend) => _canExtend = canExtend;
  Null get freeTrialInfo => _freeTrialInfo;
  set freeTrialInfo(Null freeTrialInfo) => _freeTrialInfo = freeTrialInfo;
  String get level => _level;
  set level(String level) => _level = level;
  String get encodeType => _encodeType;
  set encodeType(String encodeType) => _encodeType = encodeType;

  Data.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _url = json['url'];
    _br = json['br'];
    _size = json['size'];
    _md5 = json['md5'];
    _code = json['code'];
    _expi = json['expi'];
    _type = json['type'];
    _gain = json['gain'];
    _fee = json['fee'];
    _uf = json['uf'];
    _payed = json['payed'];
    _flag = json['flag'];
    _canExtend = json['canExtend'];
    _freeTrialInfo = json['freeTrialInfo'];
    _level = json['level'];
    _encodeType = json['encodeType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['url'] = this._url;
    data['br'] = this._br;
    data['size'] = this._size;
    data['md5'] = this._md5;
    data['code'] = this._code;
    data['expi'] = this._expi;
    data['type'] = this._type;
    data['gain'] = this._gain;
    data['fee'] = this._fee;
    data['uf'] = this._uf;
    data['payed'] = this._payed;
    data['flag'] = this._flag;
    data['canExtend'] = this._canExtend;
    data['freeTrialInfo'] = this._freeTrialInfo;
    data['level'] = this._level;
    data['encodeType'] = this._encodeType;
    return data;
  }
}
