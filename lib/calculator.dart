class EmissionCalculator {
  static double _calculateEmissionFactor({
    required double qr,
    required double avin,
    required double ar,
    required double gvin,
    required double nuz,
  }) {
    return (1000000 / qr) * avin * ar / (100 - gvin) * (1 - nuz);
  }

  static double calculateSolidParticlesEmissions({
    required double qr,
    required double avin,
    required double ar,
    required double gvin,
    required double nuz,
  }) {
    return (1000000 / qr) * avin * (ar / (100 - gvin)) * (1 - nuz);
  }

  static double calculateCoalEmissions({
    required double qr,
    required double avin,
    required double ar,
    required double gvin,
    required double nuz,
    required double coalMass,
  }) {
    double ktv = _calculateEmissionFactor(
        qr: qr, avin: avin, ar: ar, gvin: gvin, nuz: nuz);
    return 1e-6 * ktv * qr * coalMass;
  }

  static double calculateMazutEmissions({
    required double qr,
    required double avin,
    required double ar,
    required double gvin,
    required double nuz,
    required double mazutMass,
  }) {
    double ktv = _calculateEmissionFactor(
        qr: qr, avin: avin, ar: ar, gvin: gvin, nuz: nuz);
    return 1e-6 * ktv * qr * mazutMass;
  }

  static double calculateNaturalGasEmissions() {
    return 0.0;
  }
}
