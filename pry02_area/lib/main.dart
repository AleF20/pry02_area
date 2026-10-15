import 'package:calcular_area/pantallas/calculadora_pantalla.dart';
import 'package:flutter/material.dart';
import 'pantallas/calculadora_pantalla.dart';
void main() {
  runApp(const MyApp());
}
//
class MyApp extends StatelessWidget {
  const MyApp();

  @override
  Widget build(BuildContext context){
    //MaterialApp es el lienzo, se recomienda ocupar ese
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculadora',
      theme: ThemeData(
        //color scheme seed mezclamos los colores
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal)
      ),
      home: CalculadoraPantalla(),
    );
  }
}
