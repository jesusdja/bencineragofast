///
//  Generated code. Do not modify.
//  source: api/protos/fuel_station.proto
///
// ignore_for_file: non_constant_identifier_names,library_prefixes,unused_import

const Highlight$json = const {
  '1': 'Highlight',
  '2': const [
    const {'1': 'HIGHLIGHT_INVALID', '2': 0},
    const {'1': 'HIGHLIGHT_LIST', '2': 1},
    const {'1': 'HIGHLIGHT_MAP', '2': 2},
    const {'1': 'HIGHLIGHT_PREMIUM', '2': 3},
  ],
};

const Company$json = const {
  '1': 'Company',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 14, '6': '.api.gen.Brand', '10': 'id'},
    const {'1': 'highlights', '3': 2, '4': 3, '5': 14, '6': '.api.gen.Highlight', '10': 'highlights'},
  ],
};

const FuelConsumption$json = const {
  '1': 'FuelConsumption',
  '2': const [
    const {'1': 'distance', '3': 2, '4': 1, '5': 2, '10': 'distance'},
    const {'1': 'cost', '3': 1, '4': 1, '5': 2, '10': 'cost'},
  ],
};

const GetBestFSReq$json = const {
  '1': 'GetBestFSReq',
  '2': const [
    const {'1': 'coordinates', '3': 1, '4': 3, '5': 2, '10': 'coordinates'},
    const {'1': 'radius', '3': 2, '4': 1, '5': 2, '10': 'radius'},
    const {'1': 'vehicle_id', '3': 3, '4': 1, '5': 3, '10': 'vehicleId'},
    const {'1': 'fuel_type', '3': 4, '4': 1, '5': 14, '6': '.api.gen.FuelType', '10': 'fuelType'},
    const {'1': 'uuid', '3': 5, '4': 1, '5': 12, '10': 'uuid'},
  ],
};

const GetBestFSRes$json = const {
  '1': 'GetBestFSRes',
  '2': const [
    const {'1': 'fuel_stations_list', '3': 1, '4': 3, '5': 11, '6': '.api.gen.FuelStation', '10': 'fuelStationsList'},
    const {'1': 'fuel_consumptions_list', '3': 2, '4': 3, '5': 11, '6': '.api.gen.FuelConsumption', '10': 'fuelConsumptionsList'},
  ],
};

const FuelStation$json = const {
  '1': 'FuelStation',
  '2': const [
    const {'1': 'fuel_station_id', '3': 1, '4': 1, '5': 9, '10': 'fuelStationId'},
    const {'1': 'sec_id', '3': 2, '4': 1, '5': 9, '10': 'secId'},
    const {'1': 'address', '3': 3, '4': 1, '5': 9, '10': 'address'},
    const {'1': 'coord', '3': 4, '4': 3, '5': 2, '10': 'coord'},
    const {'1': 'brand', '3': 5, '4': 1, '5': 14, '6': '.api.gen.Brand', '10': 'brand'},
    const {'1': 'prices', '3': 6, '4': 3, '5': 11, '6': '.api.gen.FuelStation.PricesEntry', '10': 'prices'},
    const {'1': 'openning_hours', '3': 7, '4': 1, '5': 9, '10': 'openningHours'},
    const {'1': 'last_price_updated', '3': 8, '4': 1, '5': 3, '10': 'lastPriceUpdated'},
    const {'1': 'source', '3': 9, '4': 1, '5': 9, '10': 'source'},
    const {'1': 'available_fuel_types', '3': 10, '4': 3, '5': 14, '6': '.api.gen.FuelType', '10': 'availableFuelTypes'},
    const {'1': 'state', '3': 11, '4': 1, '5': 14, '6': '.api.gen.FuelStation.State', '10': 'state'},
    const {'1': 'services', '3': 12, '4': 3, '5': 14, '6': '.api.gen.FuelStation.Service', '10': 'services'},
  ],
  '3': const [FuelStation_PricesEntry$json],
  '4': const [FuelStation_Service$json, FuelStation_PaymentMode$json, FuelStation_State$json],
};

const FuelStation_PricesEntry$json = const {
  '1': 'PricesEntry',
  '2': const [
    const {'1': 'key', '3': 1, '4': 1, '5': 5, '10': 'key'},
    const {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
  '7': const {'7': true},
};

const FuelStation_Service$json = const {
  '1': 'Service',
  '2': const [
    const {'1': 'FUEL_STATION_SERVICE_INVALID', '2': 0},
    const {'1': 'FUEL_STATION_SERVICE_CARWASH', '2': 1},
    const {'1': 'FUEL_STATION_SERVICE_FOOD_PLACE', '2': 2},
    const {'1': 'FUEL_STATION_SERVICE_AIR', '2': 3},
    const {'1': 'FUEL_STATION_SERVICE_BATHROOMS', '2': 4},
    const {'1': 'FUEL_STATION_SERVICE_PHARMACY', '2': 5},
    const {'1': 'FUEL_STATION_SERVICE_MAINTENANCE', '2': 6},
    const {'1': 'FUEL_STATION_SERVICE_KIOSK', '2': 7},
  ],
};

const FuelStation_PaymentMode$json = const {
  '1': 'PaymentMode',
  '2': const [
    const {'1': 'FUEL_STATION_PAYMENT_MODE_INVALID', '2': 0},
    const {'1': 'FUEL_STATION_PAYMENT_MODE_CARD', '2': 1},
    const {'1': 'FUEL_STATION_PAYMENT_MODE_CHECK', '2': 2},
    const {'1': 'FUEL_STATION_PAYMENT_MODE_CASH', '2': 3},
    const {'1': 'FUEL_STATION_PAYMENT_MODE_RETAIL', '2': 4},
  ],
};

const FuelStation_State$json = const {
  '1': 'State',
  '2': const [
    const {'1': 'FUEL_STATION_STATE_INVALID', '2': 0},
    const {'1': 'FUEL_STATION_STATE_OPEN', '2': 1},
    const {'1': 'FUEL_STATION_STATE_CLOSED', '2': 2},
    const {'1': 'FUEL_STATION_STATE_TEMPORAL_CLOSED', '2': 3},
  ],
};

const ListFSReq$json = const {
  '1': 'ListFSReq',
  '2': const [
    const {'1': 'coordinates', '3': 1, '4': 3, '5': 2, '10': 'coordinates'},
    const {'1': 'radius', '3': 2, '4': 1, '5': 2, '10': 'radius'},
  ],
};

const ListFSRes$json = const {
  '1': 'ListFSRes',
  '2': const [
    const {'1': 'fuel_stations_list', '3': 1, '4': 3, '5': 11, '6': '.api.gen.FuelStation', '10': 'fuelStationsList'},
  ],
};

