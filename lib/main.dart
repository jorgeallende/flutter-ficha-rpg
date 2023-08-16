import 'package:flutter/material.dart';

void main() {
  runApp(UnitConverterApp());
}

class UnitConverterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Conversor de Unidade',
      home: UnitConverterScreen(),
    );
  }
}

class UnitConverterScreen extends StatefulWidget {
  @override
  _UnitConverterScreenState createState() => _UnitConverterScreenState();
}

class _UnitConverterScreenState extends State<UnitConverterScreen> {
  final List<String> units = ['Metros', 'Pes', 'Polegadas'];

  // Selected units
  String fromUnit = 'Metros';
  String toUnit = 'Pes';

  double inputValue = 0.0;

  double convertedValue = 0.0;

  double convertLength(double input, String fromUnit, String toUnit) {
    if (fromUnit == 'Metros' && toUnit == 'Pes') {
      return input * 3.28084;
    } else if (fromUnit == 'Metros' && toUnit == 'Polegadas') {
      return input * 39.3701;
    } else if (fromUnit == 'Pes' && toUnit == 'Metros') {
      return input * 0.3048;
    } else if (fromUnit == 'Pes' && toUnit == 'Polegadas') {
      return input * 12;
    } else if (fromUnit == 'Polegadas' && toUnit == 'Metros') {
      return input / 39.37;
    } else if (fromUnit == 'Polegadas' && toUnit == 'Pes') {
      return input / 12;
    } else if (fromUnit == toUnit) {
      return input;
    }

    return 0.0;
  }

  void convert() {
    setState(() {
      convertedValue = convertLength(inputValue, fromUnit, toUnit);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Converter unidades'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Digite o valor:'),
              onChanged: (value) {
                inputValue = double.tryParse(value) ?? 0.0;
              },
            ),
            const SizedBox(height: 16.0),
            DropdownButton<String>(
              value: fromUnit,
              onChanged: (newValue) {
                setState(() {
                  fromUnit = newValue!;
                });
              },
              items: units.map<DropdownMenuItem<String>>((String unit) {
                return DropdownMenuItem<String>(
                  value: unit,
                  child: Text(unit),
                );
              }).toList(),
            ),
            const SizedBox(height: 16.0),
            DropdownButton<String>(
              value: toUnit,
              onChanged: (newValue) {
                setState(() {
                  toUnit = newValue!;
                });
              },
              items: units.map<DropdownMenuItem<String>>((String unit) {
                return DropdownMenuItem<String>(
                  value: unit,
                  child: Text(unit),
                );
              }).toList(),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: convert,
              child: const Text('Converter'),
            ),
            const SizedBox(height: 16.0),
            Text(
              'Resultado: $convertedValue',
              style: const TextStyle(fontSize: 18.0),
            ),
          ],
        ),
      ),
    );
  }
}
