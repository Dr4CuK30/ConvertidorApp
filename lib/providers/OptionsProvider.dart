import 'package:flutter/material.dart';

List<String> _options = ['Decimal', 'Binario', 'Octal', 'Hexadecimal'];

List<DropdownMenuItem<String>> GenerarListaOpciones() {
  return [..._options]
      .map((String s) => DropdownMenuItem<String>(value: s, child: Text(s,style: TextStyle(fontSize: 18))))
      .toList();
}

List<DropdownMenuItem<String>> GenerarListaOpciones2(String optionOcuped) {
  List<String> opcionesMod = [..._options];
  opcionesMod.remove(optionOcuped);
  return opcionesMod
      .map((String s) => DropdownMenuItem<String>(value: s, child: Text(s,style: TextStyle(fontSize: 18))))
      .toList();
}
