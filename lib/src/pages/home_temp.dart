import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {
final opciones = ['Uno','Dos','Tres', 'Cuatro', 'Cinco'];
final opciones2 = <int>[1,2,3];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes Temp'),
      ),
      body: ListView(
        // children: _crearItems()
        children: _crearItemsCorta()
      ),
    );
  }

  List<Widget> _crearItems(){

    List<Widget> lista = new List<Widget>();

  for (String opt in opciones) {
    
    final tenpWidget = ListTile(
      
      title: Text(opt),
    
    );

    lista..add(tenpWidget)
        ..add(Divider());

  }

    return lista;
  }

  List<Widget> _crearItemsCorta(){

    return opciones.map((item){

      return Column(
        children: <Widget>[
          ListTile(
            title: Text(item + '!') ,
            subtitle: Text('cualquier'),
            leading: Icon(Icons.account_box),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap:(){} ,
          ),
          Divider()
        ],
      );

    }).toList();

  }
}