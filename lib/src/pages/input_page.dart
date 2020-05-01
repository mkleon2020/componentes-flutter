import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState  createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  String _nombre = '';
  String _email = '';
  String _fecha = '';

  String _opcionSeleccionada = 'Volar';
  List <String> _poderes = ['Volar', 'Rayos x','Super fuerza'];

  TextEditingController _inputFieldDateController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Input title'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal:10.0, vertical: 20.0),
        children: <Widget>[
          _crearInput(),
          Divider(),
          _crearEmail(),
          Divider(),
           _crearPassword(),
          Divider(),
          _crearFecha(context),
          Divider(),
           _crearDrop(),
          Divider(),
          _crearPersona(),
        ],
      ),
    );
  }

 Widget _crearInput() {

    return TextField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        counter: Text('letras ${_nombre.length}'),
        hintText: 'Nombre de la persona',
        labelText: 'Nombre',
        helperText: 'solo es el nombre',
        suffixIcon: Icon(Icons.accessibility),
        icon: Icon(Icons.account_circle)
      ),
      onChanged: (valor){
        setState(() {
           _nombre = valor;
        });
      },
    );
  }



 Widget _crearEmail() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        counter: Text('letras ${_nombre.length}'),
        hintText: 'email de la persona',
        labelText: 'email',
        helperText: 'solo es el email',
        suffixIcon: Icon(Icons.alternate_email),
        icon: Icon(Icons.email)
      ),
      onChanged: (valor){
        setState(() {
           _email = valor;
        });
      },
    );

  }



 Widget _crearPassword() {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        counter: Text('letras ${_nombre.length}'),
        hintText: 'Password',
        labelText: 'password',
        helperText: 'password',
        suffixIcon: Icon(Icons.lock_open),
        icon: Icon(Icons.lock)
      ),
      onChanged: (valor){
        setState(() {
           _email = valor;
        });
      },
    );
 }

 Widget _crearFecha( BuildContext context) {
   return TextField(
      enableInteractiveSelection:false,
      controller: _inputFieldDateController,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        counter: Text('letras ${_nombre.length}'),
        hintText: 'Fecha de nacimiento',
        labelText: 'Fecha de nacimiento',
        suffixIcon: Icon(Icons.calendar_today),
        icon: Icon(Icons.calendar_today)
      ),
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);
      },
    );
 }

List<DropdownMenuItem<String>> getOpciones() {

  List<DropdownMenuItem<String>> lista = new List();

  _poderes.forEach((poder) {

    lista.add(DropdownMenuItem(
      child: Text(poder),
      value: poder,
    ));

  });

  return lista;

}

Widget  _crearDrop() {
    return Row(
      children: <Widget>[
        Icon(Icons.select_all),
        SizedBox(width:30.0),
         DropdownButton(
          value: _opcionSeleccionada,
          items: getOpciones(), 
          onChanged: (opt){

          setState(() {
            _opcionSeleccionada = opt;
          });

          }
        )
      ],
     
    );
    

 }


  Widget _crearPersona() {

    return ListTile(
      title: Text('Nombre es: $_nombre'),
      subtitle: Text('Email: $_email'),
      trailing: Text(_opcionSeleccionada),
    );

  }

   _selectDate(BuildContext context) async {

    DateTime picked =  await showDatePicker(
      context: context, 
      initialDate:  new DateTime.now(), 
      firstDate: new DateTime(2020), 
      lastDate: new DateTime(2025),
      locale: Locale('es', 'ES')
    );

    if(picked != null){

      setState(() {
        _fecha = picked.toString();
        _inputFieldDateController.text = _fecha;
      });

    }

  }

 

 

 


}