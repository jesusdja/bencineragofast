class Vehiculo {

  int idTable;
  String _marcaVehiculo;
  String _modeloVehiculo;
  String _years_vehiculo;
  String _combustible;
  String _idMarca;
  String _idModelo;
  String _idYears;
  String _idCombustible;




  Vehiculo(this.idTable,this._marcaVehiculo,this._modeloVehiculo, this._years_vehiculo,this._combustible, this._idMarca, this._idModelo,this._idYears,this._idCombustible);

  Vehiculo.map(dynamic obj) {
    this.idTable = obj["IdTable"];
    this._marcaVehiculo = obj["MarcaDeVehiculo"];
    this._modeloVehiculo = obj["ModeloDeVehiculo"];
    this._years_vehiculo = obj["YearsVehiculo"];
    this._combustible = obj["Combustible"];
    this._idMarca = obj["idMarca"];
    this._idModelo = obj["idModelo"];
    this._idYears = obj["idYears"];
    this._idCombustible = obj["idCombustible"];

  }
  int get idtable => idTable;
  String get marcaVehiculo => _marcaVehiculo;
  String get modeloVehiculo => _modeloVehiculo;
  String get yearsVehiculo => _years_vehiculo;
  String get combustible => _combustible;
  String get idMarca => _idMarca;
  String get idModelo => _idModelo;
  String get idYears => _idYears;
  String get idCombustible => _idCombustible;


  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();

    map["idTable"] = idtable;
    map["marcaVehiculo"] = _marcaVehiculo;
    map["modeloVehiculo"] = _modeloVehiculo;
    map["yearsVehiculo"] = _years_vehiculo;
    map["combustible"] = _combustible;
    map["idMarca"] = _idMarca;
    map["idModelo"] = _idModelo;
    map["idYears"] = _idYears;
    map["idCombustible"] = _idCombustible;
    return map;
  }

  Vehiculo.fromMap(Map<String, dynamic> map) {

    this.idTable = map["idTable"];
    this._marcaVehiculo =  map["marcaVehiculo"];
    this._modeloVehiculo =  map["modeloVehiculo"];
    this._years_vehiculo =  map["yearsVehiculo"];
    this._combustible =  map["combustible"];
    this._idMarca = map["idMarca"];
    this._idModelo = map["idModelo"];
    this._idYears = map["idYears"];
    this._idCombustible = map["idCombustible"];

  }

}
