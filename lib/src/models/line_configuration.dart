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

  final String lineName;

  final double lye1ConcentrationMin;
  final double lye1ConcentrationMax;

  final double? lye2ConcentrationMin;
  final double? lye2ConcentrationMax;

  final double? acidConcentrationMin;
  final double? acidConcentrationMax;

  bool get hasLye2 => lye2ConcentrationMin != null;

  bool get hasAcid => acidConcentrationMin != null;

  static const LineConfiguration lineOne = LineConfiguration(
    lineName: 'LineOne',

    lye1ConcentrationMin: 1.8,
    lye1ConcentrationMax: 2.8,
    lye2ConcentrationMin: 1.5,
    lye2ConcentrationMax: 2.1,
  );

  static const LineConfiguration lineTwo = LineConfiguration(
    lineName: 'LineTwo',

    lye1ConcentrationMin: 1.8,
    lye1ConcentrationMax: 2.8,
  );

  static const LineConfiguration kegLine = LineConfiguration(
    lineName: 'KegLine',

    lye1ConcentrationMin: 1.0,
    lye1ConcentrationMax: 2.0,
    lye2ConcentrationMin: 1.8,
    lye2ConcentrationMax: 2.8,
    acidConcentrationMin: 1.2,
    acidConcentrationMax: 2.2,
  );

  static const List<LineConfiguration> allConfigurations = <LineConfiguration>[
    lineOne,
    lineTwo,
    kegLine,
  ];

  static LineConfiguration? getByName(String name) {
    try {
      return allConfigurations.firstWhere(
        (LineConfiguration config) => config.lineName == name,
      );
    } catch (e) {
      return null;
    }
  }

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

  @override
  String toString() => 'LineConfiguration($lineName)';
}
