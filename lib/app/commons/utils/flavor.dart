import 'log.dart';

///
/// List of available app flavors
///
enum FlavorType { dev, mock, ti, hml, prod }

/// FlavorType extensions
extension FlavorTypeName on FlavorType {
  /// Returns a tittle associated with the current [FlavorType]
  String get title {
    switch (this) {
      case FlavorType.prod:
        return 'Pokedex App [PROD]';
      case FlavorType.hml:
        return 'Pokedex App [HML]';
      case FlavorType.ti:
        return 'Pokedex App [TI]';
      case FlavorType.dev:
        return 'Pokedex App [DEV]';
      default:
        return 'Pokedex App [MOCK]';
    }
  }

  String get flavor {
    switch (this) {
      case FlavorType.prod:
        return 'PROD';
      case FlavorType.hml:
        return 'HML';
      case FlavorType.ti:
        return 'TI';
      case FlavorType.dev:
        return 'DEV';
      default:
        return 'MOCK';
    }
  }
}

///
/// Current app flavor definition.
///
/// If no flavor is set with [setCurrent], [FlavorType.prod] will be used as default.
///
class Flavor {
  Flavor._();

  /// Get current singleton instance
  static Flavor instance = Flavor._();

  FlavorType? _type;

  /// Set current app flavor
  setType(FlavorType type) => _type = type;

  /// Get current [FlavorType]
  FlavorType get type {
    if (_type == null) {
      Log.d('No flavor was defined. PROD will be used as default!!');
    }

    return _type ?? FlavorType.prod;
  }
}
