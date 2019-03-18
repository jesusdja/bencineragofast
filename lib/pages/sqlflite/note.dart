class User {

  String id;
  String _modelUser;


  User(this._modelUser, this.id);

  User.map(dynamic obj) {
    this._modelUser = obj["modelUser"];
    this.id = obj["id"];

  }

  String get modelUser => _modelUser;


  String get iD => id;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();

    map["modelUser"] = _modelUser;
    map["id"] = iD;

    return map;
  }

  void setUserId(String id) {
    this.id = id;
  }
}
