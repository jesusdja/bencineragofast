class Favoritos {

  int idGasolinera;


  Favoritos(this.idGasolinera);

  Favoritos.map(dynamic obj) {
    this.idGasolinera = obj["idGasolinera"];

  }

  int get idGasolineras => idGasolinera;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["idGasolinera"] = idGasolinera;

    return map;
  }

  Favoritos.fromMap(Map<String, dynamic> map) {

    this.idGasolinera = map["idGasolinera"];
  }

}
