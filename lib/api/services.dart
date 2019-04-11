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

  Future<Null> TrarBencineras (double lat, double lg, double radio) async{

    List<Place> lista_places = new List<Place>();

    var request = new ListFSReq()
      ..coordinates.add(-30)
      ..coordinates.add(-70)
      ..radius = 100.0;

    try {
      var response = await FuelStationStub.listFS(request);

      for(var value in response.fuelStationsList){

        //TRAER PRECIOS
        List<String> list_string_prices = new List<String>();
        Map<int, String> list_preces = value.prices;
        List<int> list_list_preces = list_preces.keys.toList();
        for(var v in list_list_preces){
          list_string_prices.add(v.toString());
        }

        //TRAER SERVICIOS
        List<String> list_string_servicio = new List<String>();
        List<FuelStation_Service> l = value.services;
        for(var vl in l){
          if(value.services.length != 0){
            list_string_servicio.add(vl.name.toString());
          }
        }

        //CREAR BENCINERA
        Place place = Place(
            id: int.parse(value.fuelStationId),
            address: value.address,
            latLng: LatLng(value.coord[0],value.coord[1]),
            brand: value.brand.toString(),
            prices: list_string_prices,
            tiposgas: list_string_prices,
            last_price_update: value.lastPriceUpdated.toString(),
            services: list_string_servicio,
            marca: value.brand.toString(),
            favorito: false);
        lista_places.add(place);
      }
    } catch (e) {
      print('Caught ERROR: $e');
    }

    return lista_places;
  }

}

