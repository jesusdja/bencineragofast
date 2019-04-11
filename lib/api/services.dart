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
import 'package:grpc/grpc.dart';


class services {


  Future<Null> ConnectionTest() async {
    final channel = new ClientChannel('192.168.1.7',
        port: 3001,
        options: const ChannelOptions(
            credentials: const ChannelCredentials.insecure()));
    final FuelStationStub = new FuelStationServiceClient(channel);

    var request = new ListFSReq()
      ..coordinates.add(-30)
      ..coordinates.add(-70)
      ..radius = 100.0;

    try {
      var response = await FuelStationStub.listFS(request);
      print('Greeter client received: $response');
    } catch (e) {
      print('Caught error: $e');
    }
    await channel.shutdown();



  }

   String GetTipos(getTipo){ // Recibe de tipo FuelType
     String tipo = getTipo.toString().replaceRange(0, 10, '');
     tipo =  tipo.toLowerCase();
    return tipo;
  }


  String GetServicios(getServicio){ // Recibe de tipo FuelType
    String servicioFS = getServicio.toString().replaceRange(0, 21, '');
    servicioFS =  servicioFS.toLowerCase();
    return servicioFS;

    //Obtiene solo la cadena no traduce el substring
  }

}