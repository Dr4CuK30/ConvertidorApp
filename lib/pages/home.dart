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
  String mensaje = '';
  String result = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ConvertidorApp'),
        centerTitle: true,
      ),
      body: BotonesPiolas(),
    );
  }

  Widget BotonesPiolas() {
    return Stack(children: [
      SingleChildScrollView(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              'Seleccione la base inicial y la base a la que quiera convertir el número, luego inserte el número y oprima el botón de convertir',
              style: TextStyle(fontSize: 18),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(padding: EdgeInsets.all(10)),
              Text('Base actual: ', style: TextStyle(fontSize: 18)),
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
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(padding: EdgeInsets.all(10)),
              Text('Base a convertir: ', style: TextStyle(fontSize: 18)),
              DropdownButton<String>(
                value: option2,
                items: GenerarListaOpciones2(option1),
                onChanged: (value) {
                  option2 = value;
                  setState(() {});
                },
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.all(15),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                  labelText: 'Valor a convertir',
                  labelStyle: TextStyle(fontSize: 18),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
          ),
          Container(
            padding: EdgeInsets.all(15),
            margin: EdgeInsets.fromLTRB(15, 0, 15, 5),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.blue),
                borderRadius: BorderRadius.circular(10)),
            child: Text("Valor obtenido: $result",
                style: TextStyle(color: Colors.blue, fontSize: 18)),
            width: MediaQuery.of(context).size.width,
          ),
          Text(
            mensaje,
            style: TextStyle(color: Colors.red, fontSize: 18),
          )
        ],
      )),
      Align(
        alignment: Alignment.bottomCenter,
        child: MaterialButton(
          minWidth: MediaQuery.of(context).size.width,
          color: Colors.blue,
          height: 80.0,
          onPressed: () {
            setState(() {
              if (_controller.text == '') {
                mensaje = 'Por favor, ingrese un número';
              } else if (option2 == null) {
                mensaje = 'Por favor, seleccione una base a convertir';
              } else {
                if (verificar(
                    deTipo: option1, value: _controller.text.toUpperCase())) {
                  result = ConvertirBase(
                          deTipo: option1,
                          aTipo: option2,
                          value: _controller.text)
                      .toUpperCase();
                  mensaje = '';
                } else {
                  mensaje = 'El número ingresado no es válido';
                }
              }
            });
          },
          child: Text('Convertir',
              style: TextStyle(color: Colors.white, fontSize: 25)),
        ),
      )
    ]);
  }
}
