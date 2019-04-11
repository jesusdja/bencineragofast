///
//  Generated code. Do not modify.
//  source: api/protos/fuel_type.proto
///
// ignore_for_file: non_constant_identifier_names,library_prefixes,unused_import

// ignore_for_file: UNDEFINED_SHOWN_NAME,UNUSED_SHOWN_NAME
import 'dart:core' show int, dynamic, String, List, Map;
import 'package:protobuf/protobuf.dart' as $pb;

class FuelType extends $pb.ProtobufEnum {
  static const FuelType FUEL_TYPE_INVALID = const FuelType._(0, 'FUEL_TYPE_INVALID');
  static const FuelType FUEL_TYPE_85 = const FuelType._(1, 'FUEL_TYPE_85');
  static const FuelType FUEL_TYPE_86 = const FuelType._(2, 'FUEL_TYPE_86');
  static const FuelType FUEL_TYPE_87 = const FuelType._(3, 'FUEL_TYPE_87');
  static const FuelType FUEL_TYPE_88 = const FuelType._(4, 'FUEL_TYPE_88');
  static const FuelType FUEL_TYPE_89 = const FuelType._(5, 'FUEL_TYPE_89');
  static const FuelType FUEL_TYPE_90 = const FuelType._(6, 'FUEL_TYPE_90');
  static const FuelType FUEL_TYPE_91 = const FuelType._(7, 'FUEL_TYPE_91');
  static const FuelType FUEL_TYPE_92 = const FuelType._(8, 'FUEL_TYPE_92');
  static const FuelType FUEL_TYPE_93 = const FuelType._(9, 'FUEL_TYPE_93');
  static const FuelType FUEL_TYPE_94 = const FuelType._(10, 'FUEL_TYPE_94');
  static const FuelType FUEL_TYPE_95 = const FuelType._(11, 'FUEL_TYPE_95');
  static const FuelType FUEL_TYPE_96 = const FuelType._(12, 'FUEL_TYPE_96');
  static const FuelType FUEL_TYPE_97 = const FuelType._(13, 'FUEL_TYPE_97');
  static const FuelType FUEL_TYPE_98 = const FuelType._(14, 'FUEL_TYPE_98');
  static const FuelType FUEL_TYPE_GNC = const FuelType._(15, 'FUEL_TYPE_GNC');
  static const FuelType FUEL_TYPE_GNL = const FuelType._(16, 'FUEL_TYPE_GNL');
  static const FuelType FUEL_TYPE_VOLTEX = const FuelType._(17, 'FUEL_TYPE_VOLTEX');
  static const FuelType FUEL_TYPE_N5 = const FuelType._(18, 'FUEL_TYPE_N5');
  static const FuelType FUEL_TYPE_N6 = const FuelType._(19, 'FUEL_TYPE_N6');
  static const FuelType FUEL_TYPE_DIESEL = const FuelType._(20, 'FUEL_TYPE_DIESEL');
  static const FuelType FUEL_TYPE_KEROSENE = const FuelType._(21, 'FUEL_TYPE_KEROSENE');
  static const FuelType FUEL_TYPE_GLP = const FuelType._(22, 'FUEL_TYPE_GLP');
  static const FuelType FUEL_TYPE_BLUE = const FuelType._(23, 'FUEL_TYPE_BLUE');
  static const FuelType FUEL_TYPE_ELECTRICITY = const FuelType._(24, 'FUEL_TYPE_ELECTRICITY');
  static const FuelType FUEL_TYPE_ETHANOL = const FuelType._(25, 'FUEL_TYPE_ETHANOL');

  static const List<FuelType> values = const <FuelType> [
    FUEL_TYPE_INVALID,
    FUEL_TYPE_85,
    FUEL_TYPE_86,
    FUEL_TYPE_87,
    FUEL_TYPE_88,
    FUEL_TYPE_89,
    FUEL_TYPE_90,
    FUEL_TYPE_91,
    FUEL_TYPE_92,
    FUEL_TYPE_93,
    FUEL_TYPE_94,
    FUEL_TYPE_95,
    FUEL_TYPE_96,
    FUEL_TYPE_97,
    FUEL_TYPE_98,
    FUEL_TYPE_GNC,
    FUEL_TYPE_GNL,
    FUEL_TYPE_VOLTEX,
    FUEL_TYPE_N5,
    FUEL_TYPE_N6,
    FUEL_TYPE_DIESEL,
    FUEL_TYPE_KEROSENE,
    FUEL_TYPE_GLP,
    FUEL_TYPE_BLUE,
    FUEL_TYPE_ELECTRICITY,
    FUEL_TYPE_ETHANOL,
  ];

  static final Map<int, FuelType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static FuelType valueOf(int value) => _byValue[value];

  const FuelType._(int v, String n) : super(v, n);
}

class SimplifiedFuelType extends $pb.ProtobufEnum {
  static const SimplifiedFuelType SIMPLIFIED_FUEL_TYPE_INVALID = const SimplifiedFuelType._(0, 'SIMPLIFIED_FUEL_TYPE_INVALID');
  static const SimplifiedFuelType SIMPLIFIED_FUEL_TYPE_GASOLINE = const SimplifiedFuelType._(1, 'SIMPLIFIED_FUEL_TYPE_GASOLINE');
  static const SimplifiedFuelType SIMPLIFIED_FUEL_TYPE_DIESEL = const SimplifiedFuelType._(2, 'SIMPLIFIED_FUEL_TYPE_DIESEL');
  static const SimplifiedFuelType SIMPLIFIED_FUEL_TYPE_GAS = const SimplifiedFuelType._(3, 'SIMPLIFIED_FUEL_TYPE_GAS');
  static const SimplifiedFuelType SIMPLIFIED_FUEL_TYPE_ELECTRICAL = const SimplifiedFuelType._(4, 'SIMPLIFIED_FUEL_TYPE_ELECTRICAL');

  static const List<SimplifiedFuelType> values = const <SimplifiedFuelType> [
    SIMPLIFIED_FUEL_TYPE_INVALID,
    SIMPLIFIED_FUEL_TYPE_GASOLINE,
    SIMPLIFIED_FUEL_TYPE_DIESEL,
    SIMPLIFIED_FUEL_TYPE_GAS,
    SIMPLIFIED_FUEL_TYPE_ELECTRICAL,
  ];

  static final Map<int, SimplifiedFuelType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static SimplifiedFuelType valueOf(int value) => _byValue[value];

  const SimplifiedFuelType._(int v, String n) : super(v, n);
}

