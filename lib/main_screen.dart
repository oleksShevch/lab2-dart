import 'package:flutter/material.dart';
import 'package:lab2/widgets/coal.dart';
import 'package:lab2/widgets/mazut.dart';
import 'package:lab2/widgets/gas.dart';

class EmissionCalculatorScreen extends StatefulWidget {
  const EmissionCalculatorScreen({super.key});

  @override
  _EmissionCalculatorScreenState createState() =>
      _EmissionCalculatorScreenState();
}

class _EmissionCalculatorScreenState extends State<EmissionCalculatorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Калькулятор викидів'),
      ),
      body: DefaultTabController(
        length: 3,
        child: Column(
          children: [
            const TabBar(
              tabs: [
                Tab(text: "Вугілля"),
                Tab(text: "Мазут"),
                Tab(text: "Пр. газ"),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  const CoalForm(),
                  const MazutForm(),
                  const NaturalGasForm(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
