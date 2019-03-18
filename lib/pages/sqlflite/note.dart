class User {

  String id;
  String _modelUser;


  User(this._modelUser, this.id);

  User.map(dynamic obj) {
    this._modelUser = obj["modelUser"];
  //  this._dob = obj["dob"];
  }

  String get modelUser => _modelUser;

 // String get dob => _dob;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();

    map["modelUser"] = _modelUser;
   // map["dob"] = _dob;

    return map;
  }

  void setUserId(String id) {
    this.id = id;
  }
}
