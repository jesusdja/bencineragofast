///
//  Generated code. Do not modify.
//  source: api/protos/vehicles.proto
///
// ignore_for_file: non_constant_identifier_names,library_prefixes,unused_import

import 'dart:async' as $async;

import 'package:grpc/service_api.dart' as $grpc;
import 'vehicles.pb.dart';
export 'vehicles.pb.dart';

class VehicleServiceClient extends $grpc.Client {
  static final _$getModels = new $grpc.ClientMethod<GetModelsReq, GetModelsRes>(
      '/api.gen.VehicleService/GetModels',
      (GetModelsReq value) => value.writeToBuffer(),
      (List<int> value) => new GetModelsRes.fromBuffer(value));
  static final _$getVehicles =
      new $grpc.ClientMethod<GetVehiclesReq, GetVehiclesRes>(
          '/api.gen.VehicleService/GetVehicles',
          (GetVehiclesReq value) => value.writeToBuffer(),
          (List<int> value) => new GetVehiclesRes.fromBuffer(value));

  VehicleServiceClient($grpc.ClientChannel channel, {$grpc.CallOptions options})
      : super(channel, options: options);

  $grpc.ResponseFuture<GetModelsRes> getModels(GetModelsReq request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$getModels, new $async.Stream.fromIterable([request]),
        options: options);
    return new $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<GetVehiclesRes> getVehicles(GetVehiclesReq request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$getVehicles, new $async.Stream.fromIterable([request]),
        options: options);
    return new $grpc.ResponseFuture(call);
  }
}

abstract class VehicleServiceBase extends $grpc.Service {
  String get $name => 'api.gen.VehicleService';

  VehicleServiceBase() {
    $addMethod(new $grpc.ServiceMethod<GetModelsReq, GetModelsRes>(
        'GetModels',
        getModels_Pre,
        false,
        false,
        (List<int> value) => new GetModelsReq.fromBuffer(value),
        (GetModelsRes value) => value.writeToBuffer()));
    $addMethod(new $grpc.ServiceMethod<GetVehiclesReq, GetVehiclesRes>(
        'GetVehicles',
        getVehicles_Pre,
        false,
        false,
        (List<int> value) => new GetVehiclesReq.fromBuffer(value),
        (GetVehiclesRes value) => value.writeToBuffer()));
  }

  $async.Future<GetModelsRes> getModels_Pre(
      $grpc.ServiceCall call, $async.Future request) async {
    return getModels(call, await request);
  }

  $async.Future<GetVehiclesRes> getVehicles_Pre(
      $grpc.ServiceCall call, $async.Future request) async {
    return getVehicles(call, await request);
  }

  $async.Future<GetModelsRes> getModels(
      $grpc.ServiceCall call, GetModelsReq request);
  $async.Future<GetVehiclesRes> getVehicles(
      $grpc.ServiceCall call, GetVehiclesReq request);
}
