///
//  Generated code. Do not modify.
//  source: api/protos/fuel_station.proto
///
// ignore_for_file: non_constant_identifier_names,library_prefixes,unused_import

// ignore_for_file: UNDEFINED_SHOWN_NAME,UNUSED_SHOWN_NAME
import 'dart:core' show int, dynamic, String, List, Map;
import 'package:protobuf/protobuf.dart' as $pb;

class Highlight extends $pb.ProtobufEnum {
  static const Highlight HIGHLIGHT_INVALID = const Highlight._(0, 'HIGHLIGHT_INVALID');
  static const Highlight HIGHLIGHT_LIST = const Highlight._(1, 'HIGHLIGHT_LIST');
  static const Highlight HIGHLIGHT_MAP = const Highlight._(2, 'HIGHLIGHT_MAP');
  static const Highlight HIGHLIGHT_PREMIUM = const Highlight._(3, 'HIGHLIGHT_PREMIUM');

  static const List<Highlight> values = const <Highlight> [
    HIGHLIGHT_INVALID,
    HIGHLIGHT_LIST,
    HIGHLIGHT_MAP,
    HIGHLIGHT_PREMIUM,
  ];

  static final Map<int, Highlight> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Highlight valueOf(int value) => _byValue[value];

  const Highlight._(int v, String n) : super(v, n);
}

class FuelStation_Service extends $pb.ProtobufEnum {
  static const FuelStation_Service FUEL_STATION_SERVICE_INVALID = const FuelStation_Service._(0, 'FUEL_STATION_SERVICE_INVALID');
  static const FuelStation_Service FUEL_STATION_SERVICE_CARWASH = const FuelStation_Service._(1, 'FUEL_STATION_SERVICE_CARWASH');
  static const FuelStation_Service FUEL_STATION_SERVICE_FOOD_PLACE = const FuelStation_Service._(2, 'FUEL_STATION_SERVICE_FOOD_PLACE');
  static const FuelStation_Service FUEL_STATION_SERVICE_AIR = const FuelStation_Service._(3, 'FUEL_STATION_SERVICE_AIR');
  static const FuelStation_Service FUEL_STATION_SERVICE_BATHROOMS = const FuelStation_Service._(4, 'FUEL_STATION_SERVICE_BATHROOMS');
  static const FuelStation_Service FUEL_STATION_SERVICE_PHARMACY = const FuelStation_Service._(5, 'FUEL_STATION_SERVICE_PHARMACY');
  static const FuelStation_Service FUEL_STATION_SERVICE_MAINTENANCE = const FuelStation_Service._(6, 'FUEL_STATION_SERVICE_MAINTENANCE');
  static const FuelStation_Service FUEL_STATION_SERVICE_KIOSK = const FuelStation_Service._(7, 'FUEL_STATION_SERVICE_KIOSK');

  static const List<FuelStation_Service> values = const <FuelStation_Service> [
    FUEL_STATION_SERVICE_INVALID,
    FUEL_STATION_SERVICE_CARWASH,
    FUEL_STATION_SERVICE_FOOD_PLACE,
    FUEL_STATION_SERVICE_AIR,
    FUEL_STATION_SERVICE_BATHROOMS,
    FUEL_STATION_SERVICE_PHARMACY,
    FUEL_STATION_SERVICE_MAINTENANCE,
    FUEL_STATION_SERVICE_KIOSK,
  ];

  static final Map<int, FuelStation_Service> _byValue = $pb.ProtobufEnum.initByValue(values);
  static FuelStation_Service valueOf(int value) => _byValue[value];

  const FuelStation_Service._(int v, String n) : super(v, n);
}

class FuelStation_PaymentMode extends $pb.ProtobufEnum {
  static const FuelStation_PaymentMode FUEL_STATION_PAYMENT_MODE_INVALID = const FuelStation_PaymentMode._(0, 'FUEL_STATION_PAYMENT_MODE_INVALID');
  static const FuelStation_PaymentMode FUEL_STATION_PAYMENT_MODE_CARD = const FuelStation_PaymentMode._(1, 'FUEL_STATION_PAYMENT_MODE_CARD');
  static const FuelStation_PaymentMode FUEL_STATION_PAYMENT_MODE_CHECK = const FuelStation_PaymentMode._(2, 'FUEL_STATION_PAYMENT_MODE_CHECK');
  static const FuelStation_PaymentMode FUEL_STATION_PAYMENT_MODE_CASH = const FuelStation_PaymentMode._(3, 'FUEL_STATION_PAYMENT_MODE_CASH');
  static const FuelStation_PaymentMode FUEL_STATION_PAYMENT_MODE_RETAIL = const FuelStation_PaymentMode._(4, 'FUEL_STATION_PAYMENT_MODE_RETAIL');

  static const List<FuelStation_PaymentMode> values = const <FuelStation_PaymentMode> [
    FUEL_STATION_PAYMENT_MODE_INVALID,
    FUEL_STATION_PAYMENT_MODE_CARD,
    FUEL_STATION_PAYMENT_MODE_CHECK,
    FUEL_STATION_PAYMENT_MODE_CASH,
    FUEL_STATION_PAYMENT_MODE_RETAIL,
  ];

  static final Map<int, FuelStation_PaymentMode> _byValue = $pb.ProtobufEnum.initByValue(values);
  static FuelStation_PaymentMode valueOf(int value) => _byValue[value];

  const FuelStation_PaymentMode._(int v, String n) : super(v, n);
}

class FuelStation_State extends $pb.ProtobufEnum {
  static const FuelStation_State FUEL_STATION_STATE_INVALID = const FuelStation_State._(0, 'FUEL_STATION_STATE_INVALID');
  static const FuelStation_State FUEL_STATION_STATE_OPEN = const FuelStation_State._(1, 'FUEL_STATION_STATE_OPEN');
  static const FuelStation_State FUEL_STATION_STATE_CLOSED = const FuelStation_State._(2, 'FUEL_STATION_STATE_CLOSED');
  static const FuelStation_State FUEL_STATION_STATE_TEMPORAL_CLOSED = const FuelStation_State._(3, 'FUEL_STATION_STATE_TEMPORAL_CLOSED');

  static const List<FuelStation_State> values = const <FuelStation_State> [
    FUEL_STATION_STATE_INVALID,
    FUEL_STATION_STATE_OPEN,
    FUEL_STATION_STATE_CLOSED,
    FUEL_STATION_STATE_TEMPORAL_CLOSED,
  ];

  static final Map<int, FuelStation_State> _byValue = $pb.ProtobufEnum.initByValue(values);
  static FuelStation_State valueOf(int value) => _byValue[value];

  const FuelStation_State._(int v, String n) : super(v, n);
}

