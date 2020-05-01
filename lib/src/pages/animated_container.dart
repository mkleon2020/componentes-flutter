
import 'package:flutter/material.dart';
import 'dart:math';

class AnimatedContainerPage  extends StatefulWidget {
  @override
  _AnimatedContainerPageState createState() => _AnimatedContainerPageState();
}

class _AnimatedContainerPageState extends State<AnimatedContainerPage> {

  double _width = 50.0;
  double _height = 50.0;
  Color _color = Colors.green;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8.0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated container'),
      ),
      body: Center(
        child: AnimatedContainer(
          duration: Duration( seconds: 1),
          curve: Curves.bounceInOut,
          width : _width, 
          height : _height,
          decoration: BoxDecoration(
            borderRadius : _borderRadius,
            color : _color,
          ),
        ),
      ),
      floatingActionButton: _changes(),
    );
  }



   Widget _changes(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
      SizedBox(width:30),
      FloatingActionButton (child:Icon(Icons.exposure_zero), onPressed: _c),
      
    ],);
   
  }

   void _c(){
      final random = Random();
    setState(() {
      _width =  random.nextInt(300).toDouble();
      _height =  random.nextInt(300).toDouble();
      _color = Color.fromRGBO(
      random.nextInt(255), 
      random.nextInt(255),
      random.nextInt(255), 1);
      _borderRadius = BorderRadius.circular(random.nextInt(100).toDouble());

    });
  }

}

