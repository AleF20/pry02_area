import 'package:flutter/material.dart';
import '../logica/calculadora_logica.dart';
class CalculadoraPantalla extends StatefulWidget{
  @override
  State<StatefulWidget> createState()=> _CalculadoraPantallaState();
}

class _CalculadoraPantallaState extends State<CalculadoraPantalla>{
  /*logica*/
  final numero1 = TextEditingController();
  final numero2 = TextEditingController();
  String resultado = '0';
  //instanciar la clase de logica
  Calculadora calculadora =Calculadora();
  //calculos
  void sumar(){
    double a =double.parse(numero1.text);
    double b =double.parse(numero2.text);
    setState(() {
      resultado =calculadora.sumar(a, b).toString();
    });
  }
  void restar(){
    double a =double.parse(numero1.text);
    double b =double.parse(numero2.text);
    setState(() {
      resultado =calculadora.restar(a, b).toString();
    });
  }
  void multiplicar(){
    double a =double.parse(numero1.text);
    double b =double.parse(numero2.text);
    setState(() {
      resultado =calculadora.multiplicar(a, b).toString();
    });
  }
  void dividir(){
    double a =double.parse(numero1.text);
    double b =double.parse(numero2.text);
    setState(() {
      if(b==0){
        resultado = 'No se puede dividir';
      }else {
        resultado = calculadora.dividir(a, b).toString();
      }
    });


  }
  void limpiar(){
    numero1.clear();
    numero2.clear();
    resultado='0';
  }
  /*diseño*/
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text('Calculadora'),
      backgroundColor: Colors.blueGrey,),

      body: Padding(padding: EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: numero1,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Numero 1'
              ),
            ),
            SizedBox(height: 10,),
            TextField(
              controller: numero2,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: 'Numero 2'
              ),
            ),
            SizedBox(height: 10,),
            Wrap(
              spacing: 10,
              children: [
                ElevatedButton(onPressed: sumar, child: Text('+')),
                ElevatedButton(onPressed: restar, child: Text('-')),
                ElevatedButton(onPressed: multiplicar, child: Text('*')),
                ElevatedButton(onPressed: dividir, child: Text('/'))

              ],
            ),
            SizedBox(height:10,),
            Text('Resultado: $resultado',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize:40),
            ),
          ],
      ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: limpiar,
        backgroundColor: Colors.purpleAccent,
        foregroundColor: Colors.white,
        tooltip: 'Limpiar',
        child: Icon(Icons.cleaning_services),
      ),
    );
  }
}