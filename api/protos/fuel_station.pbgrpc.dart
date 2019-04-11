///
//  Generated code. Do not modify.
//  source: api/protos/fuel_station.proto
///
// ignore_for_file: non_constant_identifier_names,library_prefixes,unused_import

import 'dart:async' as $async;

import 'package:grpc/service_api.dart' as $grpc;
import 'fuel_station.pb.dart';
export 'fuel_station.pb.dart';

class FuelStationServiceClient extends $grpc.Client {
  static final _$listFS = new $grpc.ClientMethod<ListFSReq, ListFSRes>(
      '/api.gen.FuelStationService/ListFS',
      (ListFSReq value) => value.writeToBuffer(),
      (List<int> value) => new ListFSRes.fromBuffer(value));
  static final _$getBestFS = new $grpc.ClientMethod<GetBestFSReq, GetBestFSRes>(
      '/api.gen.FuelStationService/GetBestFS',
      (GetBestFSReq value) => value.writeToBuffer(),
      (List<int> value) => new GetBestFSRes.fromBuffer(value));

  FuelStationServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions options})
      : super(channel, options: options);

  $grpc.ResponseFuture<ListFSRes> listFS(ListFSReq request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$listFS, new $async.Stream.fromIterable([request]),
        options: options);
    return new $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<GetBestFSRes> getBestFS(GetBestFSReq request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$getBestFS, new $async.Stream.fromIterable([request]),
        options: options);
    return new $grpc.ResponseFuture(call);
  }
}

abstract class FuelStationServiceBase extends $grpc.Service {
  String get $name => 'api.gen.FuelStationService';

  FuelStationServiceBase() {
    $addMethod(new $grpc.ServiceMethod<ListFSReq, ListFSRes>(
        'ListFS',
        listFS_Pre,
        false,
        false,
        (List<int> value) => new ListFSReq.fromBuffer(value),
        (ListFSRes value) => value.writeToBuffer()));
    $addMethod(new $grpc.ServiceMethod<GetBestFSReq, GetBestFSRes>(
        'GetBestFS',
        getBestFS_Pre,
        false,
        false,
        (List<int> value) => new GetBestFSReq.fromBuffer(value),
        (GetBestFSRes value) => value.writeToBuffer()));
  }

  $async.Future<ListFSRes> listFS_Pre(
      $grpc.ServiceCall call, $async.Future request) async {
    return listFS(call, await request);
  }

  $async.Future<GetBestFSRes> getBestFS_Pre(
      $grpc.ServiceCall call, $async.Future request) async {
    return getBestFS(call, await request);
  }

  $async.Future<ListFSRes> listFS($grpc.ServiceCall call, ListFSReq request);
  $async.Future<GetBestFSRes> getBestFS(
      $grpc.ServiceCall call, GetBestFSReq request);
}
