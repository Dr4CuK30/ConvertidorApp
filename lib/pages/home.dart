import 'package:convertidor/providers/ConvertionsProvider.dart';
import 'package:convertidor/providers/OptionsProvider.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  String option1 = 'Decimal';
  String option2 = 'Binario';
  String result = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('ConvertidorApp'),
          centerTitle: true,
        ),
        body: BotonesPiolas(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              result = ConvertirBase(
                      deTipo: option1, aTipo: option2, value: _controller.text)
                  .toUpperCase();
            });
          },
        ),
      ),
    );
  }

  Widget BotonesPiolas() {
    return Column(
      children: [
        DropdownButton<String>(
          value: option1,
          items: GenerarListaOpciones(),
          onChanged: (value) {
            option1 = value;
            if (option1 == option2) {
              option2 = null;
            }
            setState(() {});
          },
        ),
        DropdownButton<String>(
          value: option2,
          items: GenerarListaOpciones2(option1),
          onChanged: (value) {
            option2 = value;
            setState(() {});
          },
        ),
        TextField(
          controller: _controller,
          decoration: InputDecoration(labelText: 'Valor a convertir'),
        ),
        Text(result)
      ],
    );
  }
}
