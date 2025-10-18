/// A model representing the configuration for a specific production line,
/// including the tolerances for various substances used in the process.
class LineConfiguration {
  const LineConfiguration({
    required this.lineName,
    required this.lye1ConcentrationMin,
    required this.lye1ConcentrationMax,
    this.lye2ConcentrationMin,
    this.lye2ConcentrationMax,
    this.acidConcentrationMin,
    this.acidConcentrationMax,
  });

  // The name of the production line.
  final String lineName;

  /// The minimum concentration of Lye1.
  final double lye1ConcentrationMin;

  /// The maximum concentration of Lye1.
  final double lye1ConcentrationMax;

  /// The minimum concentration of Lye2.
  final double? lye2ConcentrationMin;

  /// The maximum concentration of Lye2.
  final double? lye2ConcentrationMax;

  /// The minimum concentration of Acid.
  final double? acidConcentrationMin;

  /// The maximum concentration of Acid.
  final double? acidConcentrationMax;

  /// Indicates whether the configuration includes Lye2 tolerances.
  /// Returns true if Lye2 tolerances are defined, false otherwise.
  bool get hasLye2 => lye2ConcentrationMin != null;

  /// Indicates whether the configuration includes Acid tolerances.
  /// Returns true if Acid tolerances are defined, false otherwise.
  bool get hasAcid => acidConcentrationMin != null;

  /// The configuration for the first production line.
  /// Includes tolerances for Lye1 and Lye2.
  /// The tolerances are defined as minimum and maximum concentration values.
  /// Example:
  /// ```dart
  /// final lineOneConfig = LineConfiguration.lineOne;
  /// print(lineOneConfig.lye1ConcentrationMin); // Outputs: 1.8
  /// ```
  static const LineConfiguration lineOne = LineConfiguration(
    lineName: 'LineOne',

    lye1ConcentrationMin: 1.8,
    lye1ConcentrationMax: 2.8,
    lye2ConcentrationMin: 1.5,
    lye2ConcentrationMax: 2.1,
  );

  /// The configuration for the second production line.
  /// Includes tolerances for Lye1 only.
  /// The tolerances are defined as minimum and maximum concentration values.
  /// Example:
  /// ```dart
  /// final lineTwoConfig = LineConfiguration.lineTwo;
  /// print(lineTwoConfig.lye1ConcentrationMax); // Outputs: 2.8
  /// ```
  static const LineConfiguration lineTwo = LineConfiguration(
    lineName: 'LineTwo',

    lye1ConcentrationMin: 1.8,
    lye1ConcentrationMax: 2.8,
  );

  /// The configuration for the keg production line.
  /// Includes tolerances for Lye1, Lye2, and Acid.
  /// The tolerances are defined as minimum and maximum concentration values.
  /// Example:
  /// ```dart
  /// final kegLineConfig = LineConfiguration.kegLine;
  /// print(kegLineConfig.lye1ConcentrationMin); // Outputs: 1.0
  /// ```
  static const LineConfiguration kegLine = LineConfiguration(
    lineName: 'KegLine',

    lye1ConcentrationMin: 1.0,
    lye1ConcentrationMax: 2.0,
    lye2ConcentrationMin: 1.8,
    lye2ConcentrationMax: 2.8,
    acidConcentrationMin: 1.2,
    acidConcentrationMax: 2.2,
  );

  /// A list of all predefined line configurations.
  /// Includes configurations for LineOne, LineTwo, and KegLine.
  static const List<LineConfiguration> allConfigurations = <LineConfiguration>[
    lineOne,
    lineTwo,
    kegLine,
  ];

  /// Retrieves a [LineConfiguration] by its [name].
  /// Returns the matching configuration or null if not found.
  static LineConfiguration? getByName(String name) {
    try {
      return allConfigurations.firstWhere(
        (LineConfiguration config) => config.lineName == name,
      );
    } catch (e) {
      return null;
    }
  }

  /// Retrieves the minimum tolerance for a specific substance.
  /// Returns the minimum concentration value or null if not defined.
  /// [substanceName] can be 'Lye1', 'Lye2', or 'Acid'.
  /// Example:
  /// ```dart
  /// final minTolerance = lineConfig.getToleranceMin('Lye1');
  /// ```
  double? getToleranceMin(String substanceName) {
    switch (substanceName) {
      case 'Lye1':
        return lye1ConcentrationMin;
      case 'Lye2':
        return lye2ConcentrationMin;
      case 'Acid':
        return acidConcentrationMin;
      default:
        return null;
    }
  }

  /// Retrieves the maximum tolerance for a specific substance.
  /// Returns the maximum concentration value or null if not defined.
  /// [substanceName] can be 'Lye1', 'Lye2', or 'Acid'.
  /// Example:
  /// ```dart
  /// final maxTolerance = lineConfig.getToleranceMax('Lye1');
  /// ```
  double? getToleranceMax(String substanceName) {
    switch (substanceName) {
      case 'Lye1':
        return lye1ConcentrationMax;
      case 'Lye2':
        return lye2ConcentrationMax;
      case 'Acid':
        return acidConcentrationMax;
      default:
        return null;
    }
  }

  /// Returns a string representation of the line configuration.
  /// Includes the line name and concentration tolerances.
  @override
  String toString() => 'LineConfiguration($lineName)';
}
