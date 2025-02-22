import 'package:flutter/material.dart';
import 'package:lab2/calculator.dart';
import 'package:lab2/widgets/emission_input.dart';

class MazutForm extends StatefulWidget {
  const MazutForm({super.key});

  @override
  _MazutFormState createState() => _MazutFormState();
}

class _MazutFormState extends State<MazutForm> {
  final _formKey = GlobalKey<FormState>();

  double mazutQr = 39.48;
  double mazutAvin = 1.0;
  double mazutAr = 0.15;
  double mazutGvin = 0.0;
  double mazutNuz = 0.985;
  double mazutMass = 70945.0;
  double emissions = 0.0;
  double particleEmissions = 0.0;

  void _calculateEmissions() {
    emissions = EmissionCalculator.calculateMazutEmissions(
        qr: mazutQr,
        avin: mazutAvin,
        ar: mazutAr,
        gvin: mazutGvin,
        nuz: mazutNuz,
        mazutMass: mazutMass);

    particleEmissions = EmissionCalculator.calculateSolidParticlesEmissions(
      qr: mazutQr,
      avin: mazutAvin,
      ar: mazutAr,
      gvin: mazutGvin,
      nuz: mazutNuz,
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            EmissionInputField(
              label: "Qr мазуту (МДж/кг)",
              value: mazutQr.toString(),
              onChanged: (value) {
                mazutQr = double.tryParse(value) ?? 39.48;
              },
            ),
            EmissionInputField(
              label: "Aвин мазуту",
              value: mazutAvin.toString(),
              onChanged: (value) {
                mazutAvin = double.tryParse(value) ?? 1.0;
              },
            ),
            EmissionInputField(
              label: "Ar мазуту (%)",
              value: mazutAr.toString(),
              onChanged: (value) {
                mazutAr = double.tryParse(value) ?? 0.15;
              },
            ),
            EmissionInputField(
              label: "Гвин мазуту (%)",
              value: mazutGvin.toString(),
              onChanged: (value) {
                mazutGvin = double.tryParse(value) ?? 0.0;
              },
            ),
            EmissionInputField(
              label: "Nзу мазуту",
              value: mazutNuz.toString(),
              onChanged: (value) {
                mazutNuz = double.tryParse(value) ?? 0.985;
              },
            ),
            EmissionInputField(
              label: "Маса мазуту (т)",
              value: mazutMass.toString(),
              onChanged: (value) {
                mazutMass = double.tryParse(value) ?? 70945.0;
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calculateEmissions,
              child: const Text('Розрахувати'),
            ),
            const SizedBox(height: 20),
            Text(
              "Емісія твердих частинок: ${particleEmissions.toStringAsFixed(2)} г/ГДж\n"
              "Валові викиди мазуту: ${emissions.toStringAsFixed(2)} т",
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
