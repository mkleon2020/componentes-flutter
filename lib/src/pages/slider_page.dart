import 'package:flutter/material.dart';


class SlidePage extends StatefulWidget {
  @override
  _SlidePageState createState() => _SlidePageState();
}

class _SlidePageState extends State<SlidePage> {

  double _valorSlider = 100.0;
  bool _bloquearCheck = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider'),
      ),
      body: Container(
        padding: EdgeInsets.only(top:50.0) ,
        child: Column(
          children: <Widget>[
            _crearSlider(),
            _checkBox(),
            _crearSwitch(),
            Expanded(child: _crearImagen()),
          ],
        ),
      ),
    );
  }

  Widget _crearSlider() {

    return Slider(
      activeColor: Colors.indigoAccent,
      label: 'Tamano de la imagen',
      value: _valorSlider,
      min: 10.0,
      max: 400.0, 
      onChanged:(_bloquearCheck) ? null: (valor) {
        setState(() {
        _valorSlider = valor;
          
        });
      }
      );

  }

  Widget _crearImagen() {

    return Image(
      image: NetworkImage('https://www.google.com/imgres?imgurl=https%3A%2F%2Fvignette.wikia.nocookie.net%2Fmarvelcinematicuniverse%2Fimages%2F9%2F9b%2FAvenger_Endgame_Poster_Oficial.png%2Frevision%2Flatest%3Fcb%3D20190326185910%26path-prefix%3Des&imgrefurl=https%3A%2F%2Fmarvelcinematicuniverse.fandom.com%2Fes%2Fwiki%2FAvengers%3A_Endgame&tbnid=Tmz62Foc_OkTQM&vet=12ahUKEwjcnuGaqd7oAhXNVzABHY88BAoQMygAegUIARCYAg..i&docid=Li-kupFv2BXC7M&w=1688&h=2500&q=avengers&ved=2ahUKEwjcnuGaqd7oAhXNVzABHY88BAoQMygAegUIARCYAg'),
      width: _valorSlider,
      fit: BoxFit.contain,
      );

  }

  Widget _checkBox() {

    // return Checkbox(
    //     value: _bloquearCheck, 
    //     onChanged: (valor){
    //       setState(() {
    //         _bloquearCheck = valor;
    //       });
    //     }
    //   );
    return CheckboxListTile(
      title: Text('Bloquear slider'),
       value: _bloquearCheck, 
       onChanged: (valor){
          setState(() {
            _bloquearCheck = valor;
          });
        }
    );


  }

  _crearSwitch() {

     return SwitchListTile(
      title: Text('Bloquear slider'),
       value: _bloquearCheck, 
       onChanged: (valor){
          setState(() {
            _bloquearCheck = valor;
          });
        }
    );
  }
}