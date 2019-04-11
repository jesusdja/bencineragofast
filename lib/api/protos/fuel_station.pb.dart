///
//  Generated code. Do not modify.
//  source: api/protos/fuel_station.proto
///
// ignore_for_file: non_constant_identifier_names,library_prefixes,unused_import

// ignore: UNUSED_SHOWN_NAME
import 'dart:core' show int, bool, double, String, List, Map, override;

import 'package:fixnum/fixnum.dart';
import 'package:protobuf/protobuf.dart' as $pb;

import 'brand.pbenum.dart' as $0;
import 'fuel_station.pbenum.dart';
import 'fuel_type.pbenum.dart' as $1;

export 'fuel_station.pbenum.dart';

class Company extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = new $pb.BuilderInfo('Company', package: const $pb.PackageName('api.gen'))
    ..e<$0.Brand>(1, 'id', $pb.PbFieldType.OE, $0.Brand.BRAND_INVALID, $0.Brand.valueOf, $0.Brand.values)
    ..pc<Highlight>(2, 'highlights', $pb.PbFieldType.PE, null, Highlight.valueOf, Highlight.values)
    ..hasRequiredFields = false
  ;

  Company() : super();
  Company.fromBuffer(List<int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  Company.fromJson(String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  Company clone() => new Company()..mergeFromMessage(this);
  Company copyWith(void Function(Company) updates) => super.copyWith((message) => updates(message as Company));
  $pb.BuilderInfo get info_ => _i;
  static Company create() => new Company();
  Company createEmptyInstance() => create();
  static $pb.PbList<Company> createRepeated() => new $pb.PbList<Company>();
  static Company getDefault() => _defaultInstance ??= create()..freeze();
  static Company _defaultInstance;

  $0.Brand get id => $_getN(0);
  set id($0.Brand v) { setField(1, v); }
  bool hasId() => $_has(0);
  void clearId() => clearField(1);

  List<Highlight> get highlights => $_getList(1);
}

class FuelConsumption extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = new $pb.BuilderInfo('FuelConsumption', package: const $pb.PackageName('api.gen'))
    ..a<double>(1, 'cost', $pb.PbFieldType.OF)
    ..a<double>(2, 'distance', $pb.PbFieldType.OF)
    ..hasRequiredFields = false
  ;

  FuelConsumption() : super();
  FuelConsumption.fromBuffer(List<int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  FuelConsumption.fromJson(String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  FuelConsumption clone() => new FuelConsumption()..mergeFromMessage(this);
  FuelConsumption copyWith(void Function(FuelConsumption) updates) => super.copyWith((message) => updates(message as FuelConsumption));
  $pb.BuilderInfo get info_ => _i;
  static FuelConsumption create() => new FuelConsumption();
  FuelConsumption createEmptyInstance() => create();
  static $pb.PbList<FuelConsumption> createRepeated() => new $pb.PbList<FuelConsumption>();
  static FuelConsumption getDefault() => _defaultInstance ??= create()..freeze();
  static FuelConsumption _defaultInstance;

  double get cost => $_getN(0);
  set cost(double v) { $_setFloat(0, v); }
  bool hasCost() => $_has(0);
  void clearCost() => clearField(1);

  double get distance => $_getN(1);
  set distance(double v) { $_setFloat(1, v); }
  bool hasDistance() => $_has(1);
  void clearDistance() => clearField(2);
}

class GetBestFSReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = new $pb.BuilderInfo('GetBestFSReq', package: const $pb.PackageName('api.gen'))
    ..p<double>(1, 'coordinates', $pb.PbFieldType.PF)
    ..a<double>(2, 'radius', $pb.PbFieldType.OF)
    ..aInt64(3, 'vehicleId')
    ..e<$1.FuelType>(4, 'fuelType', $pb.PbFieldType.OE, $1.FuelType.FUEL_TYPE_INVALID, $1.FuelType.valueOf, $1.FuelType.values)
    ..a<List<int>>(5, 'uuid', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  GetBestFSReq() : super();
  GetBestFSReq.fromBuffer(List<int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  GetBestFSReq.fromJson(String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  GetBestFSReq clone() => new GetBestFSReq()..mergeFromMessage(this);
  GetBestFSReq copyWith(void Function(GetBestFSReq) updates) => super.copyWith((message) => updates(message as GetBestFSReq));
  $pb.BuilderInfo get info_ => _i;
  static GetBestFSReq create() => new GetBestFSReq();
  GetBestFSReq createEmptyInstance() => create();
  static $pb.PbList<GetBestFSReq> createRepeated() => new $pb.PbList<GetBestFSReq>();
  static GetBestFSReq getDefault() => _defaultInstance ??= create()..freeze();
  static GetBestFSReq _defaultInstance;

  List<double> get coordinates => $_getList(0);

  double get radius => $_getN(1);
  set radius(double v) { $_setFloat(1, v); }
  bool hasRadius() => $_has(1);
  void clearRadius() => clearField(2);

  Int64 get vehicleId => $_getI64(2);
  set vehicleId(Int64 v) { $_setInt64(2, v); }
  bool hasVehicleId() => $_has(2);
  void clearVehicleId() => clearField(3);

  $1.FuelType get fuelType => $_getN(3);
  set fuelType($1.FuelType v) { setField(4, v); }
  bool hasFuelType() => $_has(3);
  void clearFuelType() => clearField(4);

  List<int> get uuid => $_getN(4);
  set uuid(List<int> v) { $_setBytes(4, v); }
  bool hasUuid() => $_has(4);
  void clearUuid() => clearField(5);
}

class GetBestFSRes extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = new $pb.BuilderInfo('GetBestFSRes', package: const $pb.PackageName('api.gen'))
    ..pc<FuelStation>(1, 'fuelStationsList', $pb.PbFieldType.PM,FuelStation.create)
    ..pc<FuelConsumption>(2, 'fuelConsumptionsList', $pb.PbFieldType.PM,FuelConsumption.create)
    ..hasRequiredFields = false
  ;

  GetBestFSRes() : super();
  GetBestFSRes.fromBuffer(List<int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  GetBestFSRes.fromJson(String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  GetBestFSRes clone() => new GetBestFSRes()..mergeFromMessage(this);
  GetBestFSRes copyWith(void Function(GetBestFSRes) updates) => super.copyWith((message) => updates(message as GetBestFSRes));
  $pb.BuilderInfo get info_ => _i;
  static GetBestFSRes create() => new GetBestFSRes();
  GetBestFSRes createEmptyInstance() => create();
  static $pb.PbList<GetBestFSRes> createRepeated() => new $pb.PbList<GetBestFSRes>();
  static GetBestFSRes getDefault() => _defaultInstance ??= create()..freeze();
  static GetBestFSRes _defaultInstance;

  List<FuelStation> get fuelStationsList => $_getList(0);

  List<FuelConsumption> get fuelConsumptionsList => $_getList(1);
}

class FuelStation extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = new $pb.BuilderInfo('FuelStation', package: const $pb.PackageName('api.gen'))
    ..aOS(1, 'fuelStationId')
    ..aOS(2, 'secId')
    ..aOS(3, 'address')
    ..p<double>(4, 'coord', $pb.PbFieldType.PF)
    ..e<$0.Brand>(5, 'brand', $pb.PbFieldType.OE, $0.Brand.BRAND_INVALID, $0.Brand.valueOf, $0.Brand.values)
    ..m<int, String>(6, 'prices', 'FuelStation.PricesEntry',$pb.PbFieldType.O3, $pb.PbFieldType.OS, null, null, null , const $pb.PackageName('api.gen'))
    ..aOS(7, 'openningHours')
    ..aInt64(8, 'lastPriceUpdated')
    ..aOS(9, 'source')
    ..pc<$1.FuelType>(10, 'availableFuelTypes', $pb.PbFieldType.PE, null, $1.FuelType.valueOf, $1.FuelType.values)
    ..e<FuelStation_State>(11, 'state', $pb.PbFieldType.OE, FuelStation_State.FUEL_STATION_STATE_INVALID, FuelStation_State.valueOf, FuelStation_State.values)
    ..pc<FuelStation_Service>(12, 'services', $pb.PbFieldType.PE, null, FuelStation_Service.valueOf, FuelStation_Service.values)
    ..hasRequiredFields = false
  ;

  FuelStation() : super();
  FuelStation.fromBuffer(List<int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  FuelStation.fromJson(String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  FuelStation clone() => new FuelStation()..mergeFromMessage(this);
  FuelStation copyWith(void Function(FuelStation) updates) => super.copyWith((message) => updates(message as FuelStation));
  $pb.BuilderInfo get info_ => _i;
  static FuelStation create() => new FuelStation();
  FuelStation createEmptyInstance() => create();
  static $pb.PbList<FuelStation> createRepeated() => new $pb.PbList<FuelStation>();
  static FuelStation getDefault() => _defaultInstance ??= create()..freeze();
  static FuelStation _defaultInstance;

  String get fuelStationId => $_getS(0, '');
  set fuelStationId(String v) { $_setString(0, v); }
  bool hasFuelStationId() => $_has(0);
  void clearFuelStationId() => clearField(1);

  String get secId => $_getS(1, '');
  set secId(String v) { $_setString(1, v); }
  bool hasSecId() => $_has(1);
  void clearSecId() => clearField(2);

  String get address => $_getS(2, '');
  set address(String v) { $_setString(2, v); }
  bool hasAddress() => $_has(2);
  void clearAddress() => clearField(3);

  List<double> get coord => $_getList(3);

  $0.Brand get brand => $_getN(4);
  set brand($0.Brand v) { setField(5, v); }
  bool hasBrand() => $_has(4);
  void clearBrand() => clearField(5);

  Map<int, String> get prices => $_getMap(5);

  String get openningHours => $_getS(6, '');
  set openningHours(String v) { $_setString(6, v); }
  bool hasOpenningHours() => $_has(6);
  void clearOpenningHours() => clearField(7);

  Int64 get lastPriceUpdated => $_getI64(7);
  set lastPriceUpdated(Int64 v) { $_setInt64(7, v); }
  bool hasLastPriceUpdated() => $_has(7);
  void clearLastPriceUpdated() => clearField(8);

  String get source => $_getS(8, '');
  set source(String v) { $_setString(8, v); }
  bool hasSource() => $_has(8);
  void clearSource() => clearField(9);

  List<$1.FuelType> get availableFuelTypes => $_getList(9);

  FuelStation_State get state => $_getN(10);
  set state(FuelStation_State v) { setField(11, v); }
  bool hasState() => $_has(10);
  void clearState() => clearField(11);

  List<FuelStation_Service> get services => $_getList(11);
}

class ListFSReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = new $pb.BuilderInfo('ListFSReq', package: const $pb.PackageName('api.gen'))
    ..p<double>(1, 'coordinates', $pb.PbFieldType.PF)
    ..a<double>(2, 'radius', $pb.PbFieldType.OF)
    ..hasRequiredFields = false
  ;

  ListFSReq() : super();
  ListFSReq.fromBuffer(List<int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  ListFSReq.fromJson(String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  ListFSReq clone() => new ListFSReq()..mergeFromMessage(this);
  ListFSReq copyWith(void Function(ListFSReq) updates) => super.copyWith((message) => updates(message as ListFSReq));
  $pb.BuilderInfo get info_ => _i;
  static ListFSReq create() => new ListFSReq();
  ListFSReq createEmptyInstance() => create();
  static $pb.PbList<ListFSReq> createRepeated() => new $pb.PbList<ListFSReq>();
  static ListFSReq getDefault() => _defaultInstance ??= create()..freeze();
  static ListFSReq _defaultInstance;

  List<double> get coordinates => $_getList(0);

  double get radius => $_getN(1);
  set radius(double v) { $_setFloat(1, v); }
  bool hasRadius() => $_has(1);
  void clearRadius() => clearField(2);
}

class ListFSRes extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = new $pb.BuilderInfo('ListFSRes', package: const $pb.PackageName('api.gen'))
    ..pc<FuelStation>(1, 'fuelStationsList', $pb.PbFieldType.PM,FuelStation.create)
    ..hasRequiredFields = false
  ;

  ListFSRes() : super();
  ListFSRes.fromBuffer(List<int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  ListFSRes.fromJson(String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  ListFSRes clone() => new ListFSRes()..mergeFromMessage(this);
  ListFSRes copyWith(void Function(ListFSRes) updates) => super.copyWith((message) => updates(message as ListFSRes));
  $pb.BuilderInfo get info_ => _i;
  static ListFSRes create() => new ListFSRes();
  ListFSRes createEmptyInstance() => create();
  static $pb.PbList<ListFSRes> createRepeated() => new $pb.PbList<ListFSRes>();
  static ListFSRes getDefault() => _defaultInstance ??= create()..freeze();
  static ListFSRes _defaultInstance;

  List<FuelStation> get fuelStationsList => $_getList(0);
}

