import 'package:flutter/material.dart';

class NaturalGasForm extends StatelessWidget {
  const NaturalGasForm({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Калькулятор викидів природного газу\n\nПри спалюванні газу частинки не викидаються",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16),
          Text(
            "Емісія твердих частинок: 0.0 г/ГДж\n"
            "Валові викиди газу: 0.0 т",
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
