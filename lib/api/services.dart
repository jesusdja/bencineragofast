import 'package:bencineragofast/api/protos/brand.pb.dart';
import 'package:bencineragofast/api/protos/brand.pbenum.dart';
import 'package:bencineragofast/api/protos/brand.pbjson.dart';
import 'package:bencineragofast/api/protos/fuel_station.pb.dart';
import 'package:bencineragofast/api/protos/fuel_station.pbgrpc.dart';
import 'package:bencineragofast/api/protos/fuel_station.pbenum.dart';
import 'package:bencineragofast/api/protos/fuel_station.pbjson.dart';
import 'package:bencineragofast/api/protos/fuel_type.pb.dart';
import 'package:bencineragofast/api/protos/fuel_type.pbenum.dart';
import 'package:bencineragofast/api/protos/fuel_type.pbjson.dart';
import 'package:bencineragofast/api/protos/maker.pb.dart';
import 'package:bencineragofast/api/protos/maker.pbenum.dart';
import 'package:bencineragofast/api/protos/maker.pbjson.dart';
import 'package:bencineragofast/api/protos/vehicles.pb.dart';
import 'package:bencineragofast/api/protos/vehicles.pbgrpc.dart';
import 'package:bencineragofast/api/protos/vehicles.pbenum.dart';
import 'package:bencineragofast/api/protos/vehicles.pbjson.dart';

import 'package:bencineragofast/pages/Home/place.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:grpc/grpc.dart';

//'192.168.1.7'
//3001

var FuelStationStub;
var channel;
Map<String,Place> markerMap;

class services{

  Future<Null> ConnectionTest(String ip, int port) {

    channel = new ClientChannel(ip,
        port: port,
        options: const ChannelOptions(
            credentials: const ChannelCredentials.insecure()));
    FuelStationStub = new FuelStationServiceClient(channel);
    print('Conexión exitosa con el servidor');
  }

  Future<List<Place>> CloseTest() async{ await channel.shutdown();  }

  Future<List<Place>> TrarBencineras (double lat, double lg, double radio) async{

    List<Place> lista_places = new List<Place>();

    var request = new ListFSReq()
      ..coordinates.add(lat)
      ..coordinates.add(lg)
      ..radius = radio;

    try {
      var response = await FuelStationStub.listFS(request);

      for(var value in response.fuelStationsList){

        //TRAER PRECIOS
        List<String> list_string_prices = new List<String>();
        Map<int, String> list_preces = value.prices;
        List<String> list_list_preces = list_preces.values.toList();
        for(var v in list_list_preces){
          list_string_prices.add(v);
        }

        //TRAER PRECIOS
        List<String> list_string_tipo = new List<String>();
        Map<int, String> list_tipos = value.prices;
        List<int> list_list_tipos = list_tipos.keys.toList();
        for(var v in list_list_tipos){
          list_string_tipo.add(GetTipos(int.parse(v.toString())));
        }

        //TRAER SERVICIOS
        List<String> list_string_servicio = new List<String>();
        List<FuelStation_Service> l = value.services;
        for(var vl in l){
          if(value.services.length != 0){
            list_string_servicio.add(GetServicios(vl.name.toString()));
          }
        }
        //CREAR BENCINERA
        Place place = Place(
            id: int.parse(value.fuelStationId),
            address: value.address,
            latLng: LatLng(value.coord[0],value.coord[1]),
            brand: GetBrand(value.brand.toString()),
            prices: list_string_prices,
            tiposgas: list_string_tipo,
            last_price_update: value.lastPriceUpdated.toString(),
            services: list_string_servicio,
            marca: GetBrand(value.brand.toString()),
            favorito: false);
        lista_places.add(place);
      }
    } catch (e) {
      print('Caught ERROR: $e');
    }

    return lista_places;
  }

}

String GetTipos(getTipo){ // Recibe de tipo FuelType
  String tipo = FuelType.valueOf(getTipo).toString();
  tipo = tipo.replaceRange(0, 10, '');
  tipo =  tipo.toLowerCase();
  return tipo;
}


String GetServicios(getServicio){ // Recibe de tipo FuelType
  String servicioFS = getServicio.toString().replaceRange(0, 21, '');
  servicioFS =  servicioFS.toLowerCase();
  return servicioFS;

  //Obtiene solo la cadena no traduce el substring
}

String GetBrand(getBran){ // Recibe de tipo FuelType
  String brand = getBran;
  brand = brand.replaceRange(0, 6, '');
  brand =  brand.toLowerCase();
  return brand;
}