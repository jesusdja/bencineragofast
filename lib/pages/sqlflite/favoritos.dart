class Favoritos {

  int _idGasolinera;


  Favoritos(this._idGasolinera);

  Favoritos.map(dynamic obj) {
    this._idGasolinera = obj["idGasolinera"];

  }

  int get idGasolinera => _idGasolinera;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["idGasolinera"] = _idGasolinera;

    return map;
  }

  Favoritos.fromMap(Map<String, dynamic> map) {

    this._idGasolinera = map["idGasolinera"];
  }

}
