import 'search_result.dart';

class AlbumDetails {
  List<Songs> _songs;
  int _code;
  Album _album;

  AlbumDetails({List<Songs> songs, int code, Album album}) {
    this._songs = songs;
    this._code = code;
    this._album = album;
  }

  List<Songs> get songs => _songs;
  set songs(List<Songs> songs) => _songs = songs;
  int get code => _code;
  set code(int code) => _code = code;
  Album get album => _album;
  set album(Album album) => _album = album;

  AlbumDetails.fromJson(Map<String, dynamic> json) {
    if (json['songs'] != null) {
      _songs = new List<Songs>();
      json['songs'].forEach((v) {
        _songs.add(new Songs.fromJson(v));
      });
    }
    _code = json['code'];
    _album = json['album'] != null ? new Album.fromJson(json['album']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._songs != null) {
      data['songs'] = this._songs.map((v) => v.toJson()).toList();
    }
    data['code'] = this._code;
    if (this._album != null) {
      data['album'] = this._album.toJson();
    }
    return data;
  }
}

class Ar {
  int _id;
  String _name;
  List<String> _alia;

  Ar({int id, String name, List<String> alia}) {
    this._id = id;
    this._name = name;
    this._alia = alia;
  }

  int get id => _id;
  set id(int id) => _id = id;
  String get name => _name;
  set name(String name) => _name = name;
  List<String> get alia => _alia;
  set alia(List<String> alia) => _alia = alia;

  Ar.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _alia = json['alia'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['name'] = this._name;
    data['alia'] = this._alia;
    return data;
  }
}

class Al {
  int _id;
  String _name;
  String _picUrl;
  String _picStr;
  int _pic;
  List<String> _alia;

  Al(
      {int id,
      String name,
      String picUrl,
      String picStr,
      int pic,
      List<String> alia}) {
    this._id = id;
    this._name = name;
    this._picUrl = picUrl;
    this._picStr = picStr;
    this._pic = pic;
    this._alia = alia;
  }

  int get id => _id;
  set id(int id) => _id = id;
  String get name => _name;
  set name(String name) => _name = name;
  String get picUrl => _picUrl;
  set picUrl(String picUrl) => _picUrl = picUrl;
  String get picStr => _picStr;
  set picStr(String picStr) => _picStr = picStr;
  int get pic => _pic;
  set pic(int pic) => _pic = pic;
  List<String> get alia => _alia;
  set alia(List<String> alia) => _alia = alia;

  Al.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _picUrl = json['picUrl'];
    _picStr = json['pic_str'];
    _pic = json['pic'];
    _alia = json['alia'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['name'] = this._name;
    data['picUrl'] = this._picUrl;
    data['pic_str'] = this._picStr;
    data['pic'] = this._pic;
    data['alia'] = this._alia;
    return data;
  }
}

class M {
  int _br;
  int _fid;
  int _size;
  int _vd;

  M({int br, int fid, int size, int vd}) {
    this._br = br;
    this._fid = fid;
    this._size = size;
    this._vd = vd;
  }

  int get br => _br;
  set br(int br) => _br = br;
  int get fid => _fid;
  set fid(int fid) => _fid = fid;
  int get size => _size;
  set size(int size) => _size = size;
  int get vd => _vd;
  set vd(int vd) => _vd = vd;

  M.fromJson(Map<String, dynamic> json) {
    _br = json['br'];
    _fid = json['fid'];
    _size = json['size'];
    _vd = json['vd'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['br'] = this._br;
    data['fid'] = this._fid;
    data['size'] = this._size;
    data['vd'] = this._vd;
    return data;
  }
}

class Privilege {
  int _id;
  int _fee;
  int _payed;
  int _st;
  int _pl;
  int _dl;
  int _sp;
  int _cp;
  int _subp;
  bool _cs;
  int _maxbr;
  int _fl;
  bool _toast;
  int _flag;
  bool _preSell;

  Privilege(
      {int id,
      int fee,
      int payed,
      int st,
      int pl,
      int dl,
      int sp,
      int cp,
      int subp,
      bool cs,
      int maxbr,
      int fl,
      bool toast,
      int flag,
      bool preSell}) {
    this._id = id;
    this._fee = fee;
    this._payed = payed;
    this._st = st;
    this._pl = pl;
    this._dl = dl;
    this._sp = sp;
    this._cp = cp;
    this._subp = subp;
    this._cs = cs;
    this._maxbr = maxbr;
    this._fl = fl;
    this._toast = toast;
    this._flag = flag;
    this._preSell = preSell;
  }

  int get id => _id;
  set id(int id) => _id = id;
  int get fee => _fee;
  set fee(int fee) => _fee = fee;
  int get payed => _payed;
  set payed(int payed) => _payed = payed;
  int get st => _st;
  set st(int st) => _st = st;
  int get pl => _pl;
  set pl(int pl) => _pl = pl;
  int get dl => _dl;
  set dl(int dl) => _dl = dl;
  int get sp => _sp;
  set sp(int sp) => _sp = sp;
  int get cp => _cp;
  set cp(int cp) => _cp = cp;
  int get subp => _subp;
  set subp(int subp) => _subp = subp;
  bool get cs => _cs;
  set cs(bool cs) => _cs = cs;
  int get maxbr => _maxbr;
  set maxbr(int maxbr) => _maxbr = maxbr;
  int get fl => _fl;
  set fl(int fl) => _fl = fl;
  bool get toast => _toast;
  set toast(bool toast) => _toast = toast;
  int get flag => _flag;
  set flag(int flag) => _flag = flag;
  bool get preSell => _preSell;
  set preSell(bool preSell) => _preSell = preSell;

  Privilege.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _fee = json['fee'];
    _payed = json['payed'];
    _st = json['st'];
    _pl = json['pl'];
    _dl = json['dl'];
    _sp = json['sp'];
    _cp = json['cp'];
    _subp = json['subp'];
    _cs = json['cs'];
    _maxbr = json['maxbr'];
    _fl = json['fl'];
    _toast = json['toast'];
    _flag = json['flag'];
    _preSell = json['preSell'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['fee'] = this._fee;
    data['payed'] = this._payed;
    data['st'] = this._st;
    data['pl'] = this._pl;
    data['dl'] = this._dl;
    data['sp'] = this._sp;
    data['cp'] = this._cp;
    data['subp'] = this._subp;
    data['cs'] = this._cs;
    data['maxbr'] = this._maxbr;
    data['fl'] = this._fl;
    data['toast'] = this._toast;
    data['flag'] = this._flag;
    data['preSell'] = this._preSell;
    return data;
  }
}

class Album {
  List<Null> _songs;
  bool _paid;
  bool _onSale;
  int _mark;
  int _copyrightId;
  int _picId;
  Artist _artist;
  List<String> _alias;
  List<Artists> _artists;
  String _picUrl;
  String _briefDesc;
  String _blurPicUrl;
  int _companyId;
  int _pic;
  int _publishTime;
  String _company;
  String _commentThreadId;
  int _status;
  String _subType;
  String _description;
  String _tags;
  String _name;
  int _id;
  String _type;
  int _size;
  String _picIdStr;
  Info _info;

  Album(
      {List<Null> songs,
      bool paid,
      bool onSale,
      int mark,
      int copyrightId,
      int picId,
      Artist artist,
      List<String> alias,
      List<Artists> artists,
      String picUrl,
      String briefDesc,
      String blurPicUrl,
      int companyId,
      int pic,
      int publishTime,
      String company,
      String commentThreadId,
      int status,
      String subType,
      String description,
      String tags,
      String name,
      int id,
      String type,
      int size,
      String picIdStr,
      Info info}) {
    this._songs = songs;
    this._paid = paid;
    this._onSale = onSale;
    this._mark = mark;
    this._copyrightId = copyrightId;
    this._picId = picId;
    this._artist = artist;
    this._alias = alias;
    this._artists = artists;
    this._picUrl = picUrl;
    this._briefDesc = briefDesc;
    this._blurPicUrl = blurPicUrl;
    this._companyId = companyId;
    this._pic = pic;
    this._publishTime = publishTime;
    this._company = company;
    this._commentThreadId = commentThreadId;
    this._status = status;
    this._subType = subType;
    this._description = description;
    this._tags = tags;
    this._name = name;
    this._id = id;
    this._type = type;
    this._size = size;
    this._picIdStr = picIdStr;
    this._info = info;
  }

  List<Null> get songs => _songs;
  set songs(List<Null> songs) => _songs = songs;
  bool get paid => _paid;
  set paid(bool paid) => _paid = paid;
  bool get onSale => _onSale;
  set onSale(bool onSale) => _onSale = onSale;
  int get mark => _mark;
  set mark(int mark) => _mark = mark;
  int get copyrightId => _copyrightId;
  set copyrightId(int copyrightId) => _copyrightId = copyrightId;
  int get picId => _picId;
  set picId(int picId) => _picId = picId;
  Artist get artist => _artist;
  set artist(Artist artist) => _artist = artist;
  List<String> get alias => _alias;
  set alias(List<String> alias) => _alias = alias;
  List<Artists> get artists => _artists;
  set artists(List<Artists> artists) => _artists = artists;
  String get picUrl => _picUrl;
  set picUrl(String picUrl) => _picUrl = picUrl;
  String get briefDesc => _briefDesc;
  set briefDesc(String briefDesc) => _briefDesc = briefDesc;
  String get blurPicUrl => _blurPicUrl;
  set blurPicUrl(String blurPicUrl) => _blurPicUrl = blurPicUrl;
  int get companyId => _companyId;
  set companyId(int companyId) => _companyId = companyId;
  int get pic => _pic;
  set pic(int pic) => _pic = pic;
  int get publishTime => _publishTime;
  set publishTime(int publishTime) => _publishTime = publishTime;
  String get company => _company;
  set company(String company) => _company = company;
  String get commentThreadId => _commentThreadId;
  set commentThreadId(String commentThreadId) =>
      _commentThreadId = commentThreadId;
  int get status => _status;
  set status(int status) => _status = status;
  String get subType => _subType;
  set subType(String subType) => _subType = subType;
  String get description => _description;
  set description(String description) => _description = description;
  String get tags => _tags;
  set tags(String tags) => _tags = tags;
  String get name => _name;
  set name(String name) => _name = name;
  int get id => _id;
  set id(int id) => _id = id;
  String get type => _type;
  set type(String type) => _type = type;
  int get size => _size;
  set size(int size) => _size = size;
  String get picIdStr => _picIdStr;
  set picIdStr(String picIdStr) => _picIdStr = picIdStr;
  Info get info => _info;
  set info(Info info) => _info = info;

  Album.fromJson(Map<String, dynamic> json) {
    // TODO: note that songs has been removed
    _paid = json['paid'];
    _onSale = json['onSale'];
    _mark = json['mark'];
    _copyrightId = json['copyrightId'];
    _picId = json['picId'];
    _artist =
        json['artist'] != null ? new Artist.fromJson(json['artist']) : null;
    _alias = json['alias'].cast<String>();
    if (json['artists'] != null) {
      _artists = new List<Artists>();
      json['artists'].forEach((v) {
        _artists.add(new Artists.fromJson(v));
      });
    }
    _picUrl = json['picUrl'];
    _briefDesc = json['briefDesc'];
    _blurPicUrl = json['blurPicUrl'];
    _companyId = json['companyId'];
    _pic = json['pic'];
    _publishTime = json['publishTime'];
    _company = json['company'];
    _commentThreadId = json['commentThreadId'];
    _status = json['status'];
    _subType = json['subType'];
    _description = json['description'];
    _tags = json['tags'];
    _name = json['name'];
    _id = json['id'];
    _type = json['type'];
    _size = json['size'];
    _picIdStr = json['picId_str'];
    _info = json['info'] != null ? new Info.fromJson(json['info']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['paid'] = this._paid;
    data['onSale'] = this._onSale;
    data['mark'] = this._mark;
    data['copyrightId'] = this._copyrightId;
    data['picId'] = this._picId;
    if (this._artist != null) {
      data['artist'] = this._artist.toJson();
    }
    data['alias'] = this._alias;
    if (this._artists != null) {
      data['artists'] = this._artists.map((v) => v.toJson()).toList();
    }
    data['picUrl'] = this._picUrl;
    data['briefDesc'] = this._briefDesc;
    data['blurPicUrl'] = this._blurPicUrl;
    data['companyId'] = this._companyId;
    data['pic'] = this._pic;
    data['publishTime'] = this._publishTime;
    data['company'] = this._company;
    data['commentThreadId'] = this._commentThreadId;
    data['status'] = this._status;
    data['subType'] = this._subType;
    data['description'] = this._description;
    data['tags'] = this._tags;
    data['name'] = this._name;
    data['id'] = this._id;
    data['type'] = this._type;
    data['size'] = this._size;
    data['picId_str'] = this._picIdStr;
    if (this._info != null) {
      data['info'] = this._info.toJson();
    }
    return data;
  }
}

class Artist {
  int _img1v1Id;
  int _topicPerson;
  String _trans;
  int _picId;
  List<String> _alias;
  String _picUrl;
  bool _followed;
  int _musicSize;
  int _albumSize;
  String _briefDesc;
  String _img1v1Url;
  String _name;
  int _id;
  String _picIdStr;
  String _img1v1IdStr;

  Artist(
      {int img1v1Id,
      int topicPerson,
      String trans,
      int picId,
      List<String> alias,
      String picUrl,
      bool followed,
      int musicSize,
      int albumSize,
      String briefDesc,
      String img1v1Url,
      String name,
      int id,
      String picIdStr,
      String img1v1IdStr}) {
    this._img1v1Id = img1v1Id;
    this._topicPerson = topicPerson;
    this._trans = trans;
    this._picId = picId;
    this._alias = alias;
    this._picUrl = picUrl;
    this._followed = followed;
    this._musicSize = musicSize;
    this._albumSize = albumSize;
    this._briefDesc = briefDesc;
    this._img1v1Url = img1v1Url;
    this._name = name;
    this._id = id;
    this._picIdStr = picIdStr;
    this._img1v1IdStr = img1v1IdStr;
  }

  int get img1v1Id => _img1v1Id;
  set img1v1Id(int img1v1Id) => _img1v1Id = img1v1Id;
  int get topicPerson => _topicPerson;
  set topicPerson(int topicPerson) => _topicPerson = topicPerson;
  String get trans => _trans;
  set trans(String trans) => _trans = trans;
  int get picId => _picId;
  set picId(int picId) => _picId = picId;
  List<String> get alias => _alias;
  set alias(List<String> alias) => _alias = alias;
  String get picUrl => _picUrl;
  set picUrl(String picUrl) => _picUrl = picUrl;
  bool get followed => _followed;
  set followed(bool followed) => _followed = followed;
  int get musicSize => _musicSize;
  set musicSize(int musicSize) => _musicSize = musicSize;
  int get albumSize => _albumSize;
  set albumSize(int albumSize) => _albumSize = albumSize;
  String get briefDesc => _briefDesc;
  set briefDesc(String briefDesc) => _briefDesc = briefDesc;
  String get img1v1Url => _img1v1Url;
  set img1v1Url(String img1v1Url) => _img1v1Url = img1v1Url;
  String get name => _name;
  set name(String name) => _name = name;
  int get id => _id;
  set id(int id) => _id = id;
  String get picIdStr => _picIdStr;
  set picIdStr(String picIdStr) => _picIdStr = picIdStr;
  String get img1v1IdStr => _img1v1IdStr;
  set img1v1IdStr(String img1v1IdStr) => _img1v1IdStr = img1v1IdStr;

  Artist.fromJson(Map<String, dynamic> json) {
    _img1v1Id = json['img1v1Id'];
    _topicPerson = json['topicPerson'];
    _trans = json['trans'];
    _picId = json['picId'];
    _alias = json['alias'].cast<String>();
    _picUrl = json['picUrl'];
    _followed = json['followed'];
    _musicSize = json['musicSize'];
    _albumSize = json['albumSize'];
    _briefDesc = json['briefDesc'];
    _img1v1Url = json['img1v1Url'];
    _name = json['name'];
    _id = json['id'];
    _picIdStr = json['picId_str'];
    _img1v1IdStr = json['img1v1Id_str'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['img1v1Id'] = this._img1v1Id;
    data['topicPerson'] = this._topicPerson;
    data['trans'] = this._trans;
    data['picId'] = this._picId;
    data['alias'] = this._alias;
    data['picUrl'] = this._picUrl;
    data['followed'] = this._followed;
    data['musicSize'] = this._musicSize;
    data['albumSize'] = this._albumSize;
    data['briefDesc'] = this._briefDesc;
    data['img1v1Url'] = this._img1v1Url;
    data['name'] = this._name;
    data['id'] = this._id;
    data['picId_str'] = this._picIdStr;
    data['img1v1Id_str'] = this._img1v1IdStr;
    return data;
  }
}

class Artists {
  int _img1v1Id;
  int _topicPerson;
  String _trans;
  int _picId;
  List<Null> _alias;
  String _picUrl;
  bool _followed;
  int _musicSize;
  int _albumSize;
  String _briefDesc;
  String _img1v1Url;
  String _name;
  int _id;
  String _img1v1IdStr;

  Artists(
      {int img1v1Id,
      int topicPerson,
      String trans,
      int picId,
      List<Null> alias,
      String picUrl,
      bool followed,
      int musicSize,
      int albumSize,
      String briefDesc,
      String img1v1Url,
      String name,
      int id,
      String img1v1IdStr}) {
    this._img1v1Id = img1v1Id;
    this._topicPerson = topicPerson;
    this._trans = trans;
    this._picId = picId;
    this._alias = alias;
    this._picUrl = picUrl;
    this._followed = followed;
    this._musicSize = musicSize;
    this._albumSize = albumSize;
    this._briefDesc = briefDesc;
    this._img1v1Url = img1v1Url;
    this._name = name;
    this._id = id;
    this._img1v1IdStr = img1v1IdStr;
  }

  int get img1v1Id => _img1v1Id;
  set img1v1Id(int img1v1Id) => _img1v1Id = img1v1Id;
  int get topicPerson => _topicPerson;
  set topicPerson(int topicPerson) => _topicPerson = topicPerson;
  String get trans => _trans;
  set trans(String trans) => _trans = trans;
  int get picId => _picId;
  set picId(int picId) => _picId = picId;
  List<Null> get alias => _alias;
  set alias(List<Null> alias) => _alias = alias;
  String get picUrl => _picUrl;
  set picUrl(String picUrl) => _picUrl = picUrl;
  bool get followed => _followed;
  set followed(bool followed) => _followed = followed;
  int get musicSize => _musicSize;
  set musicSize(int musicSize) => _musicSize = musicSize;
  int get albumSize => _albumSize;
  set albumSize(int albumSize) => _albumSize = albumSize;
  String get briefDesc => _briefDesc;
  set briefDesc(String briefDesc) => _briefDesc = briefDesc;
  String get img1v1Url => _img1v1Url;
  set img1v1Url(String img1v1Url) => _img1v1Url = img1v1Url;
  String get name => _name;
  set name(String name) => _name = name;
  int get id => _id;
  set id(int id) => _id = id;
  String get img1v1IdStr => _img1v1IdStr;
  set img1v1IdStr(String img1v1IdStr) => _img1v1IdStr = img1v1IdStr;

  Artists.fromJson(Map<String, dynamic> json) {
    _img1v1Id = json['img1v1Id'];
    _topicPerson = json['topicPerson'];
    _trans = json['trans'];
    _picId = json['picId'];
    _picUrl = json['picUrl'];
    _followed = json['followed'];
    _musicSize = json['musicSize'];
    _albumSize = json['albumSize'];
    _briefDesc = json['briefDesc'];
    _img1v1Url = json['img1v1Url'];
    _name = json['name'];
    _id = json['id'];
    _img1v1IdStr = json['img1v1Id_str'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['img1v1Id'] = this._img1v1Id;
    data['topicPerson'] = this._topicPerson;
    data['trans'] = this._trans;
    data['picId'] = this._picId;
    data['picUrl'] = this._picUrl;
    data['followed'] = this._followed;
    data['musicSize'] = this._musicSize;
    data['albumSize'] = this._albumSize;
    data['briefDesc'] = this._briefDesc;
    data['img1v1Url'] = this._img1v1Url;
    data['name'] = this._name;
    data['id'] = this._id;
    data['img1v1Id_str'] = this._img1v1IdStr;
    return data;
  }
}

class Info {
  CommentThread _commentThread;
  Null _latestLikedUsers;
  bool _liked;
  Null _comments;
  int _resourceType;
  int _resourceId;
  int _commentCount;
  int _likedCount;
  int _shareCount;
  String _threadId;

  Info(
      {CommentThread commentThread,
      Null latestLikedUsers,
      bool liked,
      Null comments,
      int resourceType,
      int resourceId,
      int commentCount,
      int likedCount,
      int shareCount,
      String threadId}) {
    this._commentThread = commentThread;
    this._latestLikedUsers = latestLikedUsers;
    this._liked = liked;
    this._comments = comments;
    this._resourceType = resourceType;
    this._resourceId = resourceId;
    this._commentCount = commentCount;
    this._likedCount = likedCount;
    this._shareCount = shareCount;
    this._threadId = threadId;
  }

  CommentThread get commentThread => _commentThread;
  set commentThread(CommentThread commentThread) =>
      _commentThread = commentThread;
  Null get latestLikedUsers => _latestLikedUsers;
  set latestLikedUsers(Null latestLikedUsers) =>
      _latestLikedUsers = latestLikedUsers;
  bool get liked => _liked;
  set liked(bool liked) => _liked = liked;
  Null get comments => _comments;
  set comments(Null comments) => _comments = comments;
  int get resourceType => _resourceType;
  set resourceType(int resourceType) => _resourceType = resourceType;
  int get resourceId => _resourceId;
  set resourceId(int resourceId) => _resourceId = resourceId;
  int get commentCount => _commentCount;
  set commentCount(int commentCount) => _commentCount = commentCount;
  int get likedCount => _likedCount;
  set likedCount(int likedCount) => _likedCount = likedCount;
  int get shareCount => _shareCount;
  set shareCount(int shareCount) => _shareCount = shareCount;
  String get threadId => _threadId;
  set threadId(String threadId) => _threadId = threadId;

  Info.fromJson(Map<String, dynamic> json) {
    _commentThread = json['commentThread'] != null
        ? new CommentThread.fromJson(json['commentThread'])
        : null;
    _latestLikedUsers = json['latestLikedUsers'];
    _liked = json['liked'];
    _comments = json['comments'];
    _resourceType = json['resourceType'];
    _resourceId = json['resourceId'];
    _commentCount = json['commentCount'];
    _likedCount = json['likedCount'];
    _shareCount = json['shareCount'];
    _threadId = json['threadId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._commentThread != null) {
      data['commentThread'] = this._commentThread.toJson();
    }
    data['latestLikedUsers'] = this._latestLikedUsers;
    data['liked'] = this._liked;
    data['comments'] = this._comments;
    data['resourceType'] = this._resourceType;
    data['resourceId'] = this._resourceId;
    data['commentCount'] = this._commentCount;
    data['likedCount'] = this._likedCount;
    data['shareCount'] = this._shareCount;
    data['threadId'] = this._threadId;
    return data;
  }
}

class CommentThread {
  String _id;
  ResourceInfo _resourceInfo;
  int _resourceType;
  int _commentCount;
  int _likedCount;
  int _shareCount;
  int _hotCount;
  Null _latestLikedUsers;
  int _resourceId;
  int _resourceOwnerId;
  String _resourceTitle;

  CommentThread(
      {String id,
      ResourceInfo resourceInfo,
      int resourceType,
      int commentCount,
      int likedCount,
      int shareCount,
      int hotCount,
      Null latestLikedUsers,
      int resourceId,
      int resourceOwnerId,
      String resourceTitle}) {
    this._id = id;
    this._resourceInfo = resourceInfo;
    this._resourceType = resourceType;
    this._commentCount = commentCount;
    this._likedCount = likedCount;
    this._shareCount = shareCount;
    this._hotCount = hotCount;
    this._latestLikedUsers = latestLikedUsers;
    this._resourceId = resourceId;
    this._resourceOwnerId = resourceOwnerId;
    this._resourceTitle = resourceTitle;
  }

  String get id => _id;
  set id(String id) => _id = id;
  ResourceInfo get resourceInfo => _resourceInfo;
  set resourceInfo(ResourceInfo resourceInfo) => _resourceInfo = resourceInfo;
  int get resourceType => _resourceType;
  set resourceType(int resourceType) => _resourceType = resourceType;
  int get commentCount => _commentCount;
  set commentCount(int commentCount) => _commentCount = commentCount;
  int get likedCount => _likedCount;
  set likedCount(int likedCount) => _likedCount = likedCount;
  int get shareCount => _shareCount;
  set shareCount(int shareCount) => _shareCount = shareCount;
  int get hotCount => _hotCount;
  set hotCount(int hotCount) => _hotCount = hotCount;
  Null get latestLikedUsers => _latestLikedUsers;
  set latestLikedUsers(Null latestLikedUsers) =>
      _latestLikedUsers = latestLikedUsers;
  int get resourceId => _resourceId;
  set resourceId(int resourceId) => _resourceId = resourceId;
  int get resourceOwnerId => _resourceOwnerId;
  set resourceOwnerId(int resourceOwnerId) =>
      _resourceOwnerId = resourceOwnerId;
  String get resourceTitle => _resourceTitle;
  set resourceTitle(String resourceTitle) => _resourceTitle = resourceTitle;

  CommentThread.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _resourceInfo = json['resourceInfo'] != null
        ? new ResourceInfo.fromJson(json['resourceInfo'])
        : null;
    _resourceType = json['resourceType'];
    _commentCount = json['commentCount'];
    _likedCount = json['likedCount'];
    _shareCount = json['shareCount'];
    _hotCount = json['hotCount'];
    _latestLikedUsers = json['latestLikedUsers'];
    _resourceId = json['resourceId'];
    _resourceOwnerId = json['resourceOwnerId'];
    _resourceTitle = json['resourceTitle'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    if (this._resourceInfo != null) {
      data['resourceInfo'] = this._resourceInfo.toJson();
    }
    data['resourceType'] = this._resourceType;
    data['commentCount'] = this._commentCount;
    data['likedCount'] = this._likedCount;
    data['shareCount'] = this._shareCount;
    data['hotCount'] = this._hotCount;
    data['latestLikedUsers'] = this._latestLikedUsers;
    data['resourceId'] = this._resourceId;
    data['resourceOwnerId'] = this._resourceOwnerId;
    data['resourceTitle'] = this._resourceTitle;
    return data;
  }
}

class ResourceInfo {
  int _id;
  int _userId;
  String _name;
  String _imgUrl;
  Null _creator;

  ResourceInfo({int id, int userId, String name, String imgUrl, Null creator}) {
    this._id = id;
    this._userId = userId;
    this._name = name;
    this._imgUrl = imgUrl;
    this._creator = creator;
  }

  int get id => _id;
  set id(int id) => _id = id;
  int get userId => _userId;
  set userId(int userId) => _userId = userId;
  String get name => _name;
  set name(String name) => _name = name;
  String get imgUrl => _imgUrl;
  set imgUrl(String imgUrl) => _imgUrl = imgUrl;
  Null get creator => _creator;
  set creator(Null creator) => _creator = creator;

  ResourceInfo.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _userId = json['userId'];
    _name = json['name'];
    _imgUrl = json['imgUrl'];
    _creator = json['creator'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['userId'] = this._userId;
    data['name'] = this._name;
    data['imgUrl'] = this._imgUrl;
    data['creator'] = this._creator;
    return data;
  }
}
