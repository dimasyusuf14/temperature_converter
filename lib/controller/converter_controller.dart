class TemperatureConverterController {
  List<String> conversionHistory = [];

  String convertTemperature(double inputTemperature, String selectedScale) {
    double result = 0;

    switch (selectedScale) {
      case 'Celsius to Fahrenheit':
        result = (inputTemperature * 9 / 5) + 32;
        break;
      case 'Celsius to Reamur':
        result = inputTemperature * 4 / 5;
        break;
      case 'Celsius to Kelvin':
        result = inputTemperature + 273.15;
        break;
      case 'Fahrenheit to Celsius':
        result = (inputTemperature - 32) * 5 / 9;
        break;
      case 'Fahrenheit to Reamur':
        result = (inputTemperature - 32) * 4 / 9;
        break;
      case 'Fahrenheit to Kelvin':
        result = (inputTemperature - 32) * 5 / 9 + 273.15;
        break;
      case 'Reamur to Celsius':
        result = inputTemperature * 5 / 4;
        break;
      case 'Reamur to Fahrenheit':
        result = (inputTemperature * 9 / 4) + 32;
        break;
      case 'Reamur to Kelvin':
        result = (inputTemperature * 5 / 4) + 273.15;
        break;
      case 'Kelvin to Celsius':
        result = inputTemperature - 273.15;
        break;
      case 'Kelvin to Fahrenheit':
        result = (inputTemperature - 273.15) * 9 / 5 + 32;
        break;
      case 'Kelvin to Reamur':
        result = (inputTemperature - 273.15) * 4 / 5;
        break;
    }

    String fromUnit = selectedScale.split(" to ")[0];
    String toUnit = selectedScale.split(" to ")[1];
    String conversion = '$inputTemperature $fromUnit = ${result.toStringAsFixed(2)} $toUnit';

    conversionHistory.add(conversion);
    return result.toStringAsFixed(2);
  }
}
