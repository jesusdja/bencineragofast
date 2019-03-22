class User {

  int idTable;
  String _idDevice;
  String _botonDisGas;
  String _botonTipGas;




  User(this.idTable, this._idDevice, this._botonDisGas,this._botonTipGas);

  User.map(dynamic obj) {
    this.idTable = obj["IdTable"];
    this._idDevice = obj["deviceId"];
    this._botonDisGas = obj["botonDisGas"];
    this._botonTipGas = obj["botonTipoGas"];

  }
  int get idtable => idTable;
  String get device_id => _idDevice;
  String get botonDisGas => _botonDisGas;
  String get botonTipoGas => _botonTipGas;


  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();

    map["idTable"] = idtable;
    map["deviceId"] = device_id;
    map["botonDisGas"] = _botonDisGas;
    map["botonTipoGas"] = _botonTipGas;

    return map;
  }

  User.fromMap(Map<String, dynamic> map) {
    this.idTable = map["idTable"];
    this._idDevice = map["deviceId"];
    this._botonDisGas = map["botonDisGas"];
    this._botonTipGas = map["botonTipoGas"];

  }

}
