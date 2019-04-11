///
//  Generated code. Do not modify.
//  source: api/protos/vehicles.proto
///
// ignore_for_file: non_constant_identifier_names,library_prefixes,unused_import

// ignore_for_file: UNDEFINED_SHOWN_NAME,UNUSED_SHOWN_NAME
import 'dart:core' show int, dynamic, String, List, Map;
import 'package:protobuf/protobuf.dart' as $pb;

class DriveType extends $pb.ProtobufEnum {
  static const DriveType DRIVE_TYPE_INVALID = const DriveType._(0, 'DRIVE_TYPE_INVALID');
  static const DriveType DRIVE_TYPE_FWD = const DriveType._(1, 'DRIVE_TYPE_FWD');
  static const DriveType DRIVE_TYPE_TWD = const DriveType._(2, 'DRIVE_TYPE_TWD');
  static const DriveType DRIVE_TYPE_AWD = const DriveType._(3, 'DRIVE_TYPE_AWD');
  static const DriveType DRIVE_TYPE_4WD = const DriveType._(4, 'DRIVE_TYPE_4WD');
  static const DriveType DRIVE_TYPE_RWD = const DriveType._(5, 'DRIVE_TYPE_RWD');
  static const DriveType DRIVE_TYPE_UNKNOWN = const DriveType._(6, 'DRIVE_TYPE_UNKNOWN');

  static const List<DriveType> values = const <DriveType> [
    DRIVE_TYPE_INVALID,
    DRIVE_TYPE_FWD,
    DRIVE_TYPE_TWD,
    DRIVE_TYPE_AWD,
    DRIVE_TYPE_4WD,
    DRIVE_TYPE_RWD,
    DRIVE_TYPE_UNKNOWN,
  ];

  static final Map<int, DriveType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static DriveType valueOf(int value) => _byValue[value];

  const DriveType._(int v, String n) : super(v, n);
}

class Transmission extends $pb.ProtobufEnum {
  static const Transmission TRANSMISSION_INVALID = const Transmission._(0, 'TRANSMISSION_INVALID');
  static const Transmission TRANSMISSION_AUTOMATIC = const Transmission._(1, 'TRANSMISSION_AUTOMATIC');
  static const Transmission TRANSMISSION_MANUAL = const Transmission._(2, 'TRANSMISSION_MANUAL');
  static const Transmission TRANSMISSION_HYBRID = const Transmission._(3, 'TRANSMISSION_HYBRID');
  static const Transmission TRANSMISSION_ANY = const Transmission._(4, 'TRANSMISSION_ANY');

  static const List<Transmission> values = const <Transmission> [
    TRANSMISSION_INVALID,
    TRANSMISSION_AUTOMATIC,
    TRANSMISSION_MANUAL,
    TRANSMISSION_HYBRID,
    TRANSMISSION_ANY,
  ];

  static final Map<int, Transmission> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Transmission valueOf(int value) => _byValue[value];

  const Transmission._(int v, String n) : super(v, n);
}

class VehicleClass extends $pb.ProtobufEnum {
  static const VehicleClass VEHICLE_CLASS_INVALID = const VehicleClass._(0, 'VEHICLE_CLASS_INVALID');
  static const VehicleClass VEHICLE_CLASS_MINICOMPACT_CARS = const VehicleClass._(1, 'VEHICLE_CLASS_MINICOMPACT_CARS');
  static const VehicleClass VEHICLE_CLASS_SUBCOMPACT_CARS = const VehicleClass._(2, 'VEHICLE_CLASS_SUBCOMPACT_CARS');
  static const VehicleClass VEHICLE_CLASS_COMPACT_CARS = const VehicleClass._(3, 'VEHICLE_CLASS_COMPACT_CARS');
  static const VehicleClass VEHICLE_CLASS_MIDSIZE_CARS = const VehicleClass._(4, 'VEHICLE_CLASS_MIDSIZE_CARS');
  static const VehicleClass VEHICLE_CLASS_LARGE_CARS = const VehicleClass._(5, 'VEHICLE_CLASS_LARGE_CARS');
  static const VehicleClass VEHICLE_CLASS_TWO_SEATERS = const VehicleClass._(6, 'VEHICLE_CLASS_TWO_SEATERS');
  static const VehicleClass VEHICLE_CLASS_MINIVAN = const VehicleClass._(7, 'VEHICLE_CLASS_MINIVAN');
  static const VehicleClass VEHICLE_CLASS_VANS_GENERAL = const VehicleClass._(8, 'VEHICLE_CLASS_VANS_GENERAL');
  static const VehicleClass VEHICLE_CLASS_VANS_PASSENGER = const VehicleClass._(9, 'VEHICLE_CLASS_VANS_PASSENGER');
  static const VehicleClass VEHICLE_CLASS_VANS_CARGO = const VehicleClass._(10, 'VEHICLE_CLASS_VANS_CARGO');
  static const VehicleClass VEHICLE_CLASS_SMALL_STATION_WAGONS = const VehicleClass._(11, 'VEHICLE_CLASS_SMALL_STATION_WAGONS');
  static const VehicleClass VEHICLE_CLASS_MIDSIZE_STATION_WAGONS = const VehicleClass._(12, 'VEHICLE_CLASS_MIDSIZE_STATION_WAGONS');
  static const VehicleClass VEHICLE_CLASS_MIDSIZE_LARGE_STATION_WAGONS = const VehicleClass._(13, 'VEHICLE_CLASS_MIDSIZE_LARGE_STATION_WAGONS');
  static const VehicleClass VEHICLE_CLASS_SMALL_SPORT_UTILITY_VEHICLE = const VehicleClass._(14, 'VEHICLE_CLASS_SMALL_SPORT_UTILITY_VEHICLE');
  static const VehicleClass VEHICLE_CLASS_STANDARD_SPORT_UTILITY_VEHICLE = const VehicleClass._(15, 'VEHICLE_CLASS_STANDARD_SPORT_UTILITY_VEHICLE');
  static const VehicleClass VEHICLE_CLASS_SMALL_PICKUP_TRUCKS = const VehicleClass._(16, 'VEHICLE_CLASS_SMALL_PICKUP_TRUCKS');
  static const VehicleClass VEHICLE_CLASS_STANDARD_PICKUP_TRUCKS = const VehicleClass._(17, 'VEHICLE_CLASS_STANDARD_PICKUP_TRUCKS');
  static const VehicleClass VEHICLE_CLASS_SPECIAL_PURPOSE_VEHICLES = const VehicleClass._(18, 'VEHICLE_CLASS_SPECIAL_PURPOSE_VEHICLES');

  static const List<VehicleClass> values = const <VehicleClass> [
    VEHICLE_CLASS_INVALID,
    VEHICLE_CLASS_MINICOMPACT_CARS,
    VEHICLE_CLASS_SUBCOMPACT_CARS,
    VEHICLE_CLASS_COMPACT_CARS,
    VEHICLE_CLASS_MIDSIZE_CARS,
    VEHICLE_CLASS_LARGE_CARS,
    VEHICLE_CLASS_TWO_SEATERS,
    VEHICLE_CLASS_MINIVAN,
    VEHICLE_CLASS_VANS_GENERAL,
    VEHICLE_CLASS_VANS_PASSENGER,
    VEHICLE_CLASS_VANS_CARGO,
    VEHICLE_CLASS_SMALL_STATION_WAGONS,
    VEHICLE_CLASS_MIDSIZE_STATION_WAGONS,
    VEHICLE_CLASS_MIDSIZE_LARGE_STATION_WAGONS,
    VEHICLE_CLASS_SMALL_SPORT_UTILITY_VEHICLE,
    VEHICLE_CLASS_STANDARD_SPORT_UTILITY_VEHICLE,
    VEHICLE_CLASS_SMALL_PICKUP_TRUCKS,
    VEHICLE_CLASS_STANDARD_PICKUP_TRUCKS,
    VEHICLE_CLASS_SPECIAL_PURPOSE_VEHICLES,
  ];

  static final Map<int, VehicleClass> _byValue = $pb.ProtobufEnum.initByValue(values);
  static VehicleClass valueOf(int value) => _byValue[value];

  const VehicleClass._(int v, String n) : super(v, n);
}

