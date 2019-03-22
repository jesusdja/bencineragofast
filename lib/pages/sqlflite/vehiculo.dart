class Vehiculo {

  int idTable;
  String _marcaVehiculo;
  String _modeloVehiculo;
  String _years_vehiculo;
  String _combustible;




  Vehiculo(this.idTable,this._marcaVehiculo,this._modeloVehiculo, this._years_vehiculo,this._combustible);

  Vehiculo.map(dynamic obj) {
    this.idTable = obj["IdTable"];
    this._marcaVehiculo = obj["MarcaDeVehiculo"];
    this._modeloVehiculo = obj["ModeloDeVehiculo"];
    this._years_vehiculo = obj["YearsVehiculo"];
    this._combustible = obj["Combustible"];

  }
  int get idtable => idTable;
  String get marcaVehiculo => _marcaVehiculo;
  String get modeloVehiculo => _modeloVehiculo;
  String get yearsVehiculo => _years_vehiculo;
  String get combustible => _combustible;


  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();

    map["idTable"] = idtable;
    map["marcaVehiculo"] = _marcaVehiculo;
    map["modeloVehiculo"] = _modeloVehiculo;
    map["yearsVehiculo"] = _years_vehiculo;
    map["combustible"] = _combustible;
    return map;
  }

  Vehiculo.fromMap(Map<String, dynamic> map) {

    this.idTable = map["idTable"];
    this._marcaVehiculo =  map["marcaVehiculo"];
    this._modeloVehiculo =  map["modeloVehiculo"];
    this._years_vehiculo =  map["yearsVehiculo"];
    this._combustible =  map["combustible"];
  }

}
