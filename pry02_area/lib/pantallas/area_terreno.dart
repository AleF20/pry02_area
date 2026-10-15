import 'package:flutter/material.dart';

//definir la clase principal
//1. paso: declaraar
class AreaPantalla extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _AreaPantallaState();
}
//2. implementar
class _AreaPantallaState extends State<AreaPantalla>{
  /*Lógica*/
  //mapeo de objetos- generalmente se mapean las cajas de texto
  final baseCtrl=TextEditingController();
  final alturaCtrl=TextEditingController();
  //variables
  double area = 0, perimetro = 0, valor = 0;
  //calculos
  void calcular(){
     // convertir de texto a numero
    final base = double.tryParse(baseCtrl.text)??0;
    final altura = double.tryParse(alturaCtrl.text) ?? 0;
    setState(() {
      area= base * altura;
      perimetro = 2* (base+altura);
      valor=area*500;
    });
  }

  /*diseño*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Area de un terreno'),
        backgroundColor: Colors.tealAccent,
      ),
      body: Padding(padding: EdgeInsets.all(10),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //etiqueta
          Text('Ingresar medidas del terreno',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize:20),),
          SizedBox(height: 10,),
          //campos de texto
          TextField(controller: baseCtrl,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                labelText:'Base m2',
                border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 10,),
          TextField(controller: alturaCtrl,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText:'Altura m2',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 10,),
          //boton
          ElevatedButton(onPressed: calcular, child: Text('Calcular')),
          SizedBox(height: 10,),
          //mostrar resultados
          Text('Area: ${area.toStringAsFixed(2)}'),
          Text('Perimetro: ${perimetro.toStringAsFixed(2)}'),
          Text('Valor total: \$${valor.toStringAsFixed(2)}',
            style: TextStyle(color:Colors.greenAccent, fontSize: 40,
              fontWeight: FontWeight.bold),
          )
        ],
      ),),
    );
  }
}

