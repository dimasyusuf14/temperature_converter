// ignore_for_file: prefer_const_constructors

import 'package:converter_temperature/widgets/button/button_primary.dart';
import 'package:converter_temperature/controller/converter_controller.dart';
import 'package:flutter/material.dart';
import 'history_page.dart';

class TemperatureConverterPage extends StatefulWidget {
  @override
  _TemperatureConverterPageState createState() =>
      _TemperatureConverterPageState();
}

class _TemperatureConverterPageState extends State<TemperatureConverterPage> {
  final TextEditingController _temperatureController = TextEditingController();
  final TemperatureConverterController _controller =
      TemperatureConverterController();
  String _selectedScale = 'Celsius to Fahrenheit';
  String _convertedTemperature = '';

  int _currentIndex = 0; // Menyimpan indeks halaman saat ini

  void _convertTemperature() {
    double inputTemperature = double.tryParse(_temperatureController.text) ?? 0;

    setState(() {
      _convertedTemperature =
          _controller.convertTemperature(inputTemperature, _selectedScale);
    });
  }

  void _onNavItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget getBody() {
      if (_currentIndex == 0) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 225,
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                    color: Color(0XFF445DCC),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                    child: TextField(
                      controller: _temperatureController,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 30, // Ukuran font saat mengetik
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      decoration: const InputDecoration(
                        hintText: 'Enter Temperature',
                        hintStyle: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                DropdownButton<String>(
                  value: _selectedScale,
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedScale = newValue!;
                    });
                  },
                  items: [
                    'Celsius to Fahrenheit',
                    'Celsius to Reamur',
                    'Celsius to Kelvin',
                    'Fahrenheit to Celsius',
                    'Fahrenheit to Reamur',
                    'Fahrenheit to Kelvin',
                    'Reamur to Celsius',
                    'Reamur to Fahrenheit',
                    'Reamur to Kelvin',
                    'Kelvin to Celsius',
                    'Kelvin to Fahrenheit',
                    'Kelvin to Reamur',
                  ].map((String scale) {
                    return DropdownMenuItem<String>(
                      value: scale,
                      child: Text(scale),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 16),
                Container(
                  height: 225,
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                    color: Color(0XFF445DCC),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                    child: Text(
                      "$_convertedTemperature ${_selectedScale.split(" to ")[1]}",
                      style: const TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Buttonprimary(
                  title: 'Convert',
                  color: Colors.teal.shade300,
                  onPressed: _convertTemperature,
                  width: MediaQuery.of(context).size.width * 0.9,
                ),
              ],
            ),
          ),
        );
      } else {
        // Halaman History
        return ConversionHistoryPage(history: _controller.conversionHistory);
      }
    }

    return Scaffold(
      backgroundColor: Color(0XFFE0E8F9),
      appBar: AppBar(
        title: Text(_currentIndex == 0 ? 'Temperature Converter' : 'Conversion History'),
        backgroundColor: Color(0XFF8598FF),
      ),
      body: getBody(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onNavItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'History',
          ),
        ],
      ),
    );
  }
}
