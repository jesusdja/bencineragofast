///
//  Generated code. Do not modify.
//  source: api/protos/vehicles.proto
///
// ignore_for_file: non_constant_identifier_names,library_prefixes,unused_import

const DriveType$json = const {
  '1': 'DriveType',
  '2': const [
    const {'1': 'DRIVE_TYPE_INVALID', '2': 0},
    const {'1': 'DRIVE_TYPE_FWD', '2': 1},
    const {'1': 'DRIVE_TYPE_TWD', '2': 2},
    const {'1': 'DRIVE_TYPE_AWD', '2': 3},
    const {'1': 'DRIVE_TYPE_4WD', '2': 4},
    const {'1': 'DRIVE_TYPE_RWD', '2': 5},
    const {'1': 'DRIVE_TYPE_UNKNOWN', '2': 6},
  ],
};

const Transmission$json = const {
  '1': 'Transmission',
  '2': const [
    const {'1': 'TRANSMISSION_INVALID', '2': 0},
    const {'1': 'TRANSMISSION_AUTOMATIC', '2': 1},
    const {'1': 'TRANSMISSION_MANUAL', '2': 2},
    const {'1': 'TRANSMISSION_HYBRID', '2': 3},
    const {'1': 'TRANSMISSION_ANY', '2': 4},
  ],
};

const VehicleClass$json = const {
  '1': 'VehicleClass',
  '2': const [
    const {'1': 'VEHICLE_CLASS_INVALID', '2': 0},
    const {'1': 'VEHICLE_CLASS_MINICOMPACT_CARS', '2': 1},
    const {'1': 'VEHICLE_CLASS_SUBCOMPACT_CARS', '2': 2},
    const {'1': 'VEHICLE_CLASS_COMPACT_CARS', '2': 3},
    const {'1': 'VEHICLE_CLASS_MIDSIZE_CARS', '2': 4},
    const {'1': 'VEHICLE_CLASS_LARGE_CARS', '2': 5},
    const {'1': 'VEHICLE_CLASS_TWO_SEATERS', '2': 6},
    const {'1': 'VEHICLE_CLASS_MINIVAN', '2': 7},
    const {'1': 'VEHICLE_CLASS_VANS_GENERAL', '2': 8},
    const {'1': 'VEHICLE_CLASS_VANS_PASSENGER', '2': 9},
    const {'1': 'VEHICLE_CLASS_VANS_CARGO', '2': 10},
    const {'1': 'VEHICLE_CLASS_SMALL_STATION_WAGONS', '2': 11},
    const {'1': 'VEHICLE_CLASS_MIDSIZE_STATION_WAGONS', '2': 12},
    const {'1': 'VEHICLE_CLASS_MIDSIZE_LARGE_STATION_WAGONS', '2': 13},
    const {'1': 'VEHICLE_CLASS_SMALL_SPORT_UTILITY_VEHICLE', '2': 14},
    const {'1': 'VEHICLE_CLASS_STANDARD_SPORT_UTILITY_VEHICLE', '2': 15},
    const {'1': 'VEHICLE_CLASS_SMALL_PICKUP_TRUCKS', '2': 16},
    const {'1': 'VEHICLE_CLASS_STANDARD_PICKUP_TRUCKS', '2': 17},
    const {'1': 'VEHICLE_CLASS_SPECIAL_PURPOSE_VEHICLES', '2': 18},
  ],
};

const Vehicle$json = const {
  '1': 'Vehicle',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 3, '10': 'id'},
    const {'1': 'maker', '3': 2, '4': 1, '5': 14, '6': '.api.gen.Maker', '10': 'maker'},
    const {'1': 'model', '3': 3, '4': 1, '5': 9, '10': 'model'},
    const {'1': 'year', '3': 4, '4': 1, '5': 5, '10': 'year'},
    const {'1': 'engine_lts', '3': 5, '4': 1, '5': 2, '10': 'engineLts'},
    const {'1': 'version', '3': 6, '4': 1, '5': 9, '10': 'version'},
    const {'1': 'city_mpg', '3': 7, '4': 1, '5': 2, '10': 'cityMpg'},
    const {'1': 'highway_mpg', '3': 8, '4': 1, '5': 2, '10': 'highwayMpg'},
    const {'1': 'fuel_types', '3': 9, '4': 3, '5': 14, '6': '.api.gen.FuelType', '10': 'fuelTypes'},
    const {'1': 'drive', '3': 10, '4': 1, '5': 14, '6': '.api.gen.DriveType', '10': 'drive'},
    const {'1': 'vehicle_type', '3': 11, '4': 1, '5': 14, '6': '.api.gen.VehicleClass', '10': 'vehicleType'},
    const {'1': 'transmission', '3': 12, '4': 1, '5': 14, '6': '.api.gen.Transmission', '10': 'transmission'},
  ],
};

const EngineSizes$json = const {
  '1': 'EngineSizes',
  '2': const [
    const {'1': 'available_engine_sizes', '3': 1, '4': 3, '5': 2, '10': 'availableEngineSizes'},
  ],
};

const VehicleFields$json = const {
  '1': 'VehicleFields',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 3, '10': 'id'},
    const {'1': 'fuel_type', '3': 2, '4': 1, '5': 14, '6': '.api.gen.FuelType', '10': 'fuelType'},
    const {'1': 'transmission', '3': 3, '4': 1, '5': 14, '6': '.api.gen.Transmission', '10': 'transmission'},
    const {'1': 'miles_per_gallon', '3': 4, '4': 1, '5': 3, '10': 'milesPerGallon'},
    const {'1': 'engine_size', '3': 5, '4': 1, '5': 2, '10': 'engineSize'},
  ],
};

const GetModelsReq$json = const {
  '1': 'GetModelsReq',
  '2': const [
    const {'1': 'maker', '3': 1, '4': 1, '5': 14, '6': '.api.gen.Maker', '10': 'maker'},
  ],
};

const GetModelsRes$json = const {
  '1': 'GetModelsRes',
  '2': const [
    const {'1': 'models', '3': 1, '4': 3, '5': 9, '10': 'models'},
  ],
};

const GetVehiclesReq$json = const {
  '1': 'GetVehiclesReq',
  '2': const [
    const {'1': 'maker', '3': 1, '4': 1, '5': 14, '6': '.api.gen.Maker', '10': 'maker'},
    const {'1': 'model', '3': 2, '4': 1, '5': 9, '10': 'model'},
  ],
};

const VehicleArray$json = const {
  '1': 'VehicleArray',
  '2': const [
    const {'1': 'vehicles', '3': 1, '4': 3, '5': 11, '6': '.api.gen.Vehicle', '10': 'vehicles'},
  ],
};

const GetVehiclesRes$json = const {
  '1': 'GetVehiclesRes',
  '2': const [
    const {'1': 'vehicles', '3': 1, '4': 3, '5': 11, '6': '.api.gen.GetVehiclesRes.VehiclesEntry', '10': 'vehicles'},
  ],
  '3': const [GetVehiclesRes_VehiclesEntry$json],
};

const GetVehiclesRes_VehiclesEntry$json = const {
  '1': 'VehiclesEntry',
  '2': const [
    const {'1': 'key', '3': 1, '4': 1, '5': 3, '10': 'key'},
    const {'1': 'value', '3': 2, '4': 1, '5': 11, '6': '.api.gen.VehicleArray', '10': 'value'},
  ],
  '7': const {'7': true},
};

