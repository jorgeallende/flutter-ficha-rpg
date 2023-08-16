double convertLength(double input, String fromUnit, String toUnit) {
  if (fromUnit == 'Metros' && toUnit == 'Pes') {
    return input * 3.28084;
  } else if (fromUnit == 'Metros' && toUnit == 'Polegadas') {
    return input * 39.3701;
  } else if (fromUnit == 'Metros' && toUnit == 'Milhas'){
    return input / 1609;
  } else if (fromUnit == 'Pes' && toUnit == 'Metros') {
    return input * 0.3048;
  } else if (fromUnit == 'Pes' && toUnit == 'Polegadas') {
    return input * 12;}
  else if (fromUnit == 'Pes' && toUnit == 'Milhas') {
    return input / 5280;
  } else if (fromUnit == 'Polegadas' && toUnit == 'Metros') {
    return input / 39.37;
  } else if (fromUnit == 'Polegadas' && toUnit == 'Milhas') {
    return input / 63360;
  } else if (fromUnit == 'Polegadas' && toUnit == 'Pes') {
    return input / 12;
  } else if (fromUnit == 'Milhas' && toUnit == 'Pes') {
    return input * 5280;
  } else if (fromUnit == 'Milhas' && toUnit == 'Metros') {
    return input * 1609;
  } else if (fromUnit == 'Milhas' && toUnit == 'Polegadas') {
    return input * 63360;
  } else if (fromUnit == toUnit) {
    return input;
  }

  return 0.0;
}