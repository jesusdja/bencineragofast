class User {

  String _id_device;
  String _modelUser;


  User(this._id_device,this._modelUser);

  User.map(dynamic obj) {
    this._id_device = obj["id_device"];
    this._modelUser = obj["modelUser"];

  }

  String get device_id => _id_device;
  String get modelUser => _modelUser;


  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();

    map["deviceId"] = device_id;
    map["modelUser"] = modelUser;

    return map;
  }
  void setUserId(String id) {
    this._id_device = device_id;
  }

}
