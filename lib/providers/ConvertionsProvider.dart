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
