import 'package:flutter/material.dart';
import 'package:componentes/src/pages/providers/menu_provider.dart';
import 'package:componentes/src/utils/icono_string_util.dart';
import 'package:componentes/src/pages/alert_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes'),
      ),
      body: _lista(),
    );
  }
      
  Widget _lista() {
    // menuprovider.cargarData().then((opciones){

    //   print(opciones);

    // });

    return FutureBuilder(

      future: menuprovider.cargarData(),
      initialData: [],
      builder: ( context, AsyncSnapshot <List<dynamic>> snapshot){
        return ListView(
          children: _ListaItems(snapshot.data, context),
        );

      },

    );

  }

}
  List<Widget>_ListaItems( List<dynamic> data, BuildContext context) {
   
   final List<Widget> opciones = [];

   data.forEach((opt) {

     final widgetTemp = ListTile(
       title: Text(opt['texto']),
       leading: getIcon(opt['icon']),
       trailing: Icon(Icons.keyboard_arrow_right, color: Colors.blue),
       onTap: (){
         Navigator.pushNamed(context, opt['ruta']);


       },
     );
    opciones..add(widgetTemp)
            ..add(Divider ());
   });

   return opciones;
   
  }