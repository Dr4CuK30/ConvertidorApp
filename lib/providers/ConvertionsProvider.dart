import 'package:flutter/material.dart';

bool verificar({deTipo: String, value: String}) {
  int c = 0;
  switch (deTipo) {
    case 'Decimal':
      {
        for (var i = 0; i < value.toString().length; i++) {
          if (!(value[i] == '0' ||
              value[i] == '1' ||
              value[i] == '2' ||
              value[i] == '3' ||
              value[i] == '4' ||
              value[i] == '5' ||
              value[i] == '6' ||
              value[i] == '7' ||
              value[i] == '8' ||
              value[i] == '9')) {
            c++;
          }
        }
        if (c != 0) {
          return false;
        } else {
          return true;
        }
      }
      break;

    case 'Binario':
      {
        for (var i = 0; i < value.toString().length; i++) {
          if (!(value[i] == '0' ||
              value[i] == '1' )) {
            c++;
          }
        }
        if (c != 0) {
          return false;
        } else {
          return true;
        }
      }
      break;

    case 'Octal':
      {for (var i = 0; i < value.toString().length; i++) {
          if (!(value[i] == '0' ||
              value[i] == '1' ||
              value[i] == '2' ||
              value[i] == '3' ||
              value[i] == '4' ||
              value[i] == '5' ||
              value[i] == '6' ||
              value[i] == '7')) {
            c++;
          }
        }
        if (c != 0) {
          return false;
        } else {
          return true;
        }}
      break;

    case 'Hexadecimal':
      {
        for (var i = 0; i < value.toString().length; i++) {
          if (!(value[i] == '0' ||
              value[i] == '1' ||
              value[i] == '2' ||
              value[i] == '3' ||
              value[i] == '4' ||
              value[i] == '5' ||
              value[i] == '6' ||
              value[i] == '7' ||
              value[i] == '8' ||
              value[i] == '9'||
              value[i] == 'A' ||
              value[i] == 'B' ||
              value[i] == 'C' ||
              value[i] == 'D' ||
              value[i] == 'E' ||
              value[i] == 'F')) {
            c++;
          }
        }
        if (c != 0) {
          return false;
        } else {
          return true;
        }
      }
      break;
  }
}

String ConvertirBase({deTipo: String, aTipo: String, value: String}) {
  switch (deTipo) {
    case 'Decimal':
      {
        int base;
        switch (aTipo) {
          case 'Decimal':
            {
              return value;
            }
            break;
          case 'Binario':
            {
              base = 2;
            }
            break;
          case 'Octal':
            {
              base = 8;
            }
            break;
          case 'Hexadecimal':
            {
              base = 16;
            }
            break;
        }
        return int.parse(value).toRadixString(base);
      }
      break;

    case 'Binario':
      {
        return ConvertirBase(
            value: int.parse(value, radix: 2).toRadixString(10),
            deTipo: 'Decimal',
            aTipo: aTipo);
      }
      break;

    case 'Octal':
      {
        return ConvertirBase(
            value: int.parse(value, radix: 8).toRadixString(10),
            deTipo: 'Decimal',
            aTipo: aTipo);
      }
      break;

    case 'Hexadecimal':
      {
        return ConvertirBase(
            value: int.parse(value, radix: 16).toRadixString(10),
            deTipo: 'Decimal',
            aTipo: aTipo);
      }
      break;
  }
}
