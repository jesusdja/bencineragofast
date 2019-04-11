///
//  Generated code. Do not modify.
//  source: api/protos/vehicles.proto
///
// ignore_for_file: non_constant_identifier_names,library_prefixes,unused_import

// ignore: UNUSED_SHOWN_NAME
import 'dart:core' show int, bool, double, String, List, Map, override;

import 'package:fixnum/fixnum.dart';
import 'package:protobuf/protobuf.dart' as $pb;

import 'maker.pbenum.dart' as $2;
import 'fuel_type.pbenum.dart' as $1;
import 'vehicles.pbenum.dart';

export 'vehicles.pbenum.dart';

class Vehicle extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = new $pb.BuilderInfo('Vehicle', package: const $pb.PackageName('api.gen'))
    ..aInt64(1, 'id')
    ..e<$2.Maker>(2, 'maker', $pb.PbFieldType.OE, $2.Maker.MAKER_INVALID, $2.Maker.valueOf, $2.Maker.values)
    ..aOS(3, 'model')
    ..a<int>(4, 'year', $pb.PbFieldType.O3)
    ..a<double>(5, 'engineLts', $pb.PbFieldType.OF)
    ..aOS(6, 'version')
    ..a<double>(7, 'cityMpg', $pb.PbFieldType.OF)
    ..a<double>(8, 'highwayMpg', $pb.PbFieldType.OF)
    ..pc<$1.FuelType>(9, 'fuelTypes', $pb.PbFieldType.PE, null, $1.FuelType.valueOf, $1.FuelType.values)
    ..e<DriveType>(10, 'drive', $pb.PbFieldType.OE, DriveType.DRIVE_TYPE_INVALID, DriveType.valueOf, DriveType.values)
    ..e<VehicleClass>(11, 'vehicleType', $pb.PbFieldType.OE, VehicleClass.VEHICLE_CLASS_INVALID, VehicleClass.valueOf, VehicleClass.values)
    ..e<Transmission>(12, 'transmission', $pb.PbFieldType.OE, Transmission.TRANSMISSION_INVALID, Transmission.valueOf, Transmission.values)
    ..hasRequiredFields = false
  ;

  Vehicle() : super();
  Vehicle.fromBuffer(List<int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  Vehicle.fromJson(String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  Vehicle clone() => new Vehicle()..mergeFromMessage(this);
  Vehicle copyWith(void Function(Vehicle) updates) => super.copyWith((message) => updates(message as Vehicle));
  $pb.BuilderInfo get info_ => _i;
  static Vehicle create() => new Vehicle();
  Vehicle createEmptyInstance() => create();
  static $pb.PbList<Vehicle> createRepeated() => new $pb.PbList<Vehicle>();
  static Vehicle getDefault() => _defaultInstance ??= create()..freeze();
  static Vehicle _defaultInstance;

  Int64 get id => $_getI64(0);
  set id(Int64 v) { $_setInt64(0, v); }
  bool hasId() => $_has(0);
  void clearId() => clearField(1);

  $2.Maker get maker => $_getN(1);
  set maker($2.Maker v) { setField(2, v); }
  bool hasMaker() => $_has(1);
  void clearMaker() => clearField(2);

  String get model => $_getS(2, '');
  set model(String v) { $_setString(2, v); }
  bool hasModel() => $_has(2);
  void clearModel() => clearField(3);

  int get year => $_get(3, 0);
  set year(int v) { $_setSignedInt32(3, v); }
  bool hasYear() => $_has(3);
  void clearYear() => clearField(4);

  double get engineLts => $_getN(4);
  set engineLts(double v) { $_setFloat(4, v); }
  bool hasEngineLts() => $_has(4);
  void clearEngineLts() => clearField(5);

  String get version => $_getS(5, '');
  set version(String v) { $_setString(5, v); }
  bool hasVersion() => $_has(5);
  void clearVersion() => clearField(6);

  double get cityMpg => $_getN(6);
  set cityMpg(double v) { $_setFloat(6, v); }
  bool hasCityMpg() => $_has(6);
  void clearCityMpg() => clearField(7);

  double get highwayMpg => $_getN(7);
  set highwayMpg(double v) { $_setFloat(7, v); }
  bool hasHighwayMpg() => $_has(7);
  void clearHighwayMpg() => clearField(8);

  List<$1.FuelType> get fuelTypes => $_getList(8);

  DriveType get drive => $_getN(9);
  set drive(DriveType v) { setField(10, v); }
  bool hasDrive() => $_has(9);
  void clearDrive() => clearField(10);

  VehicleClass get vehicleType => $_getN(10);
  set vehicleType(VehicleClass v) { setField(11, v); }
  bool hasVehicleType() => $_has(10);
  void clearVehicleType() => clearField(11);

  Transmission get transmission => $_getN(11);
  set transmission(Transmission v) { setField(12, v); }
  bool hasTransmission() => $_has(11);
  void clearTransmission() => clearField(12);
}

class EngineSizes extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = new $pb.BuilderInfo('EngineSizes', package: const $pb.PackageName('api.gen'))
    ..p<double>(1, 'availableEngineSizes', $pb.PbFieldType.PF)
    ..hasRequiredFields = false
  ;

  EngineSizes() : super();
  EngineSizes.fromBuffer(List<int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  EngineSizes.fromJson(String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  EngineSizes clone() => new EngineSizes()..mergeFromMessage(this);
  EngineSizes copyWith(void Function(EngineSizes) updates) => super.copyWith((message) => updates(message as EngineSizes));
  $pb.BuilderInfo get info_ => _i;
  static EngineSizes create() => new EngineSizes();
  EngineSizes createEmptyInstance() => create();
  static $pb.PbList<EngineSizes> createRepeated() => new $pb.PbList<EngineSizes>();
  static EngineSizes getDefault() => _defaultInstance ??= create()..freeze();
  static EngineSizes _defaultInstance;

  List<double> get availableEngineSizes => $_getList(0);
}

class VehicleFields extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = new $pb.BuilderInfo('VehicleFields', package: const $pb.PackageName('api.gen'))
    ..aInt64(1, 'id')
    ..e<$1.FuelType>(2, 'fuelType', $pb.PbFieldType.OE, $1.FuelType.FUEL_TYPE_INVALID, $1.FuelType.valueOf, $1.FuelType.values)
    ..e<Transmission>(3, 'transmission', $pb.PbFieldType.OE, Transmission.TRANSMISSION_INVALID, Transmission.valueOf, Transmission.values)
    ..aInt64(4, 'milesPerGallon')
    ..a<double>(5, 'engineSize', $pb.PbFieldType.OF)
    ..hasRequiredFields = false
  ;

  VehicleFields() : super();
  VehicleFields.fromBuffer(List<int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  VehicleFields.fromJson(String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  VehicleFields clone() => new VehicleFields()..mergeFromMessage(this);
  VehicleFields copyWith(void Function(VehicleFields) updates) => super.copyWith((message) => updates(message as VehicleFields));
  $pb.BuilderInfo get info_ => _i;
  static VehicleFields create() => new VehicleFields();
  VehicleFields createEmptyInstance() => create();
  static $pb.PbList<VehicleFields> createRepeated() => new $pb.PbList<VehicleFields>();
  static VehicleFields getDefault() => _defaultInstance ??= create()..freeze();
  static VehicleFields _defaultInstance;

  Int64 get id => $_getI64(0);
  set id(Int64 v) { $_setInt64(0, v); }
  bool hasId() => $_has(0);
  void clearId() => clearField(1);

  $1.FuelType get fuelType => $_getN(1);
  set fuelType($1.FuelType v) { setField(2, v); }
  bool hasFuelType() => $_has(1);
  void clearFuelType() => clearField(2);

  Transmission get transmission => $_getN(2);
  set transmission(Transmission v) { setField(3, v); }
  bool hasTransmission() => $_has(2);
  void clearTransmission() => clearField(3);

  Int64 get milesPerGallon => $_getI64(3);
  set milesPerGallon(Int64 v) { $_setInt64(3, v); }
  bool hasMilesPerGallon() => $_has(3);
  void clearMilesPerGallon() => clearField(4);

  double get engineSize => $_getN(4);
  set engineSize(double v) { $_setFloat(4, v); }
  bool hasEngineSize() => $_has(4);
  void clearEngineSize() => clearField(5);
}

class GetModelsReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = new $pb.BuilderInfo('GetModelsReq', package: const $pb.PackageName('api.gen'))
    ..e<$2.Maker>(1, 'maker', $pb.PbFieldType.OE, $2.Maker.MAKER_INVALID, $2.Maker.valueOf, $2.Maker.values)
    ..hasRequiredFields = false
  ;

  GetModelsReq() : super();
  GetModelsReq.fromBuffer(List<int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  GetModelsReq.fromJson(String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  GetModelsReq clone() => new GetModelsReq()..mergeFromMessage(this);
  GetModelsReq copyWith(void Function(GetModelsReq) updates) => super.copyWith((message) => updates(message as GetModelsReq));
  $pb.BuilderInfo get info_ => _i;
  static GetModelsReq create() => new GetModelsReq();
  GetModelsReq createEmptyInstance() => create();
  static $pb.PbList<GetModelsReq> createRepeated() => new $pb.PbList<GetModelsReq>();
  static GetModelsReq getDefault() => _defaultInstance ??= create()..freeze();
  static GetModelsReq _defaultInstance;

  $2.Maker get maker => $_getN(0);
  set maker($2.Maker v) { setField(1, v); }
  bool hasMaker() => $_has(0);
  void clearMaker() => clearField(1);
}

class GetModelsRes extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = new $pb.BuilderInfo('GetModelsRes', package: const $pb.PackageName('api.gen'))
    ..pPS(1, 'models')
    ..hasRequiredFields = false
  ;

  GetModelsRes() : super();
  GetModelsRes.fromBuffer(List<int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  GetModelsRes.fromJson(String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  GetModelsRes clone() => new GetModelsRes()..mergeFromMessage(this);
  GetModelsRes copyWith(void Function(GetModelsRes) updates) => super.copyWith((message) => updates(message as GetModelsRes));
  $pb.BuilderInfo get info_ => _i;
  static GetModelsRes create() => new GetModelsRes();
  GetModelsRes createEmptyInstance() => create();
  static $pb.PbList<GetModelsRes> createRepeated() => new $pb.PbList<GetModelsRes>();
  static GetModelsRes getDefault() => _defaultInstance ??= create()..freeze();
  static GetModelsRes _defaultInstance;

  List<String> get models => $_getList(0);
}

class GetVehiclesReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = new $pb.BuilderInfo('GetVehiclesReq', package: const $pb.PackageName('api.gen'))
    ..e<$2.Maker>(1, 'maker', $pb.PbFieldType.OE, $2.Maker.MAKER_INVALID, $2.Maker.valueOf, $2.Maker.values)
    ..aOS(2, 'model')
    ..hasRequiredFields = false
  ;

  GetVehiclesReq() : super();
  GetVehiclesReq.fromBuffer(List<int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  GetVehiclesReq.fromJson(String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  GetVehiclesReq clone() => new GetVehiclesReq()..mergeFromMessage(this);
  GetVehiclesReq copyWith(void Function(GetVehiclesReq) updates) => super.copyWith((message) => updates(message as GetVehiclesReq));
  $pb.BuilderInfo get info_ => _i;
  static GetVehiclesReq create() => new GetVehiclesReq();
  GetVehiclesReq createEmptyInstance() => create();
  static $pb.PbList<GetVehiclesReq> createRepeated() => new $pb.PbList<GetVehiclesReq>();
  static GetVehiclesReq getDefault() => _defaultInstance ??= create()..freeze();
  static GetVehiclesReq _defaultInstance;

  $2.Maker get maker => $_getN(0);
  set maker($2.Maker v) { setField(1, v); }
  bool hasMaker() => $_has(0);
  void clearMaker() => clearField(1);

  String get model => $_getS(1, '');
  set model(String v) { $_setString(1, v); }
  bool hasModel() => $_has(1);
  void clearModel() => clearField(2);
}

class VehicleArray extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = new $pb.BuilderInfo('VehicleArray', package: const $pb.PackageName('api.gen'))
    ..pc<Vehicle>(1, 'vehicles', $pb.PbFieldType.PM,Vehicle.create)
    ..hasRequiredFields = false
  ;

  VehicleArray() : super();
  VehicleArray.fromBuffer(List<int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  VehicleArray.fromJson(String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  VehicleArray clone() => new VehicleArray()..mergeFromMessage(this);
  VehicleArray copyWith(void Function(VehicleArray) updates) => super.copyWith((message) => updates(message as VehicleArray));
  $pb.BuilderInfo get info_ => _i;
  static VehicleArray create() => new VehicleArray();
  VehicleArray createEmptyInstance() => create();
  static $pb.PbList<VehicleArray> createRepeated() => new $pb.PbList<VehicleArray>();
  static VehicleArray getDefault() => _defaultInstance ??= create()..freeze();
  static VehicleArray _defaultInstance;

  List<Vehicle> get vehicles => $_getList(0);
}

class GetVehiclesRes extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = new $pb.BuilderInfo('GetVehiclesRes', package: const $pb.PackageName('api.gen'))
    ..m<Int64, VehicleArray>(1, 'vehicles', 'GetVehiclesRes.VehiclesEntry',$pb.PbFieldType.O6, $pb.PbFieldType.OM, VehicleArray.create, null, null , const $pb.PackageName('api.gen'))
    ..hasRequiredFields = false
  ;

  GetVehiclesRes() : super();
  GetVehiclesRes.fromBuffer(List<int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  GetVehiclesRes.fromJson(String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  GetVehiclesRes clone() => new GetVehiclesRes()..mergeFromMessage(this);
  GetVehiclesRes copyWith(void Function(GetVehiclesRes) updates) => super.copyWith((message) => updates(message as GetVehiclesRes));
  $pb.BuilderInfo get info_ => _i;
  static GetVehiclesRes create() => new GetVehiclesRes();
  GetVehiclesRes createEmptyInstance() => create();
  static $pb.PbList<GetVehiclesRes> createRepeated() => new $pb.PbList<GetVehiclesRes>();
  static GetVehiclesRes getDefault() => _defaultInstance ??= create()..freeze();
  static GetVehiclesRes _defaultInstance;

  Map<Int64, VehicleArray> get vehicles => $_getMap(0);
}

