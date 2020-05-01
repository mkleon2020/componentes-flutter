
import 'package:flutter/material.dart';
import 'dart:async';

class ListaPage extends StatefulWidget {
  @override
  _ListaPageState createState() => _ListaPageState();
}

class _ListaPageState extends State<ListaPage> {


// esta propiedad me permite controlar todo lo que pasa en el scrolle
  ScrollController _scrollController = new ScrollController();

  List<int> _listaNumeros = new List();
  int _ultimoItem = 0;
  bool _isLoading = false;


//4 EL INITSTATE Y EL SUPER.INITSTATE  LLAMA O HACE REFERENCIA A LA CLASE STATE SIEMPRE SE COLOCA
  @override
  void initState() {
    super.initState();

    _agregar10();

      // ESTO SE DISPARA CADA VEZ QUE SE MUEVA EL SCROLL
    _scrollController.addListener((){

      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent ){
        // traer informacion
        fetchData();
      }
              
    });
      
  }
    //1 CUERPO DE LA PAGINA
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        
        appBar: AppBar(
          title: Text('Listas'),
        ),
        
        body: Stack(
          children: <Widget>[
              _crearLista(),
              _crearLoading(),
          ],
        )
              
      );
    }
    // 2 LIST VIEW
    Widget _crearLista() {
        
      return RefreshIndicator(
          onRefresh:obtenerPagina1,
          child: ListView.builder(
          controller: _scrollController,
          itemCount: _listaNumeros.length,
          itemBuilder: (BuildContext context, int index) {
          
            final imagen = _listaNumeros[index];
              return FadeInImage(
                placeholder: AssetImage('assets/original.gif'), 
                image: NetworkImage('https://i.picsum.photos/id/$imagen/500/300.jpg')
              );
          }
        ),
      );
    }

  Future<Null> obtenerPagina1() async{

    final duration = new Duration(seconds:2);

    new Timer(duration, (){

      _listaNumeros.clear();
      _ultimoItem++;
      _agregar10();

    });

    return Future.delayed(duration);

  }


    //3 CREAR DE 10 EN 10 LAS IMAGENES DE LA LISTA
    void _agregar10(){
      for (var i = 1; i < 10; i++) {

        _ultimoItem++;
        _listaNumeros.add(_ultimoItem);
              
      }
        
      setState(() {});
    }
      // SIMULAR UN DELAY 
    Future<Null> fetchData() async {

     _isLoading = true;
      setState(() {});
      final duration = new Duration(seconds:2);
      return  new Timer(duration, respuestaHTTP);

    }

// METODO QUE CARGA LAS IMAGENES DESPUES DEL DELAY
  void respuestaHTTP() {

    _isLoading = false;

    _scrollController.animateTo(
      _scrollController.position.pixels + 100, 
      duration: Duration(milliseconds: 250), 
      curve: Curves.fastOutSlowIn
    );
    _agregar10();


  }
    // DESTRUIR TODO LO QUE ALMACENA EL SCROLL AL SALIR DE LA PAGINA
   @override
   void dispose(){
     super.dispose();
     _scrollController.dispose();
   }
  
  // LOADING DE CARGA DE IMAGENES
  Widget _crearLoading() {

    if (_isLoading) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircularProgressIndicator()

            ],
          ),
          SizedBox(height: 15.0,)
        ],
      );
      
      
    }else{
      return Container();
    }
  }


  
}