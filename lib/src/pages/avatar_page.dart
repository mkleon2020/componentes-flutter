import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avatar page'),
        actions: <Widget>[
          Container(
            padding: EdgeInsets.all(2.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage('https://previews.123rf.com/images/yupiramos/yupiramos1609/yupiramos160912745/62358467-avatar-sonriente-hombre-de-negocios-llevaba-traje-de-dibujos-animados-y-corbata-ilustraci%C3%B3n-vectorial.jpg'),
              radius: 25.0,
            ),
          ),
          Container(
            margin: EdgeInsets.only(right:10.0),
            child: CircleAvatar(
              child: Text('ST'),
              backgroundColor: Colors.brown,
            ),
          )
        ],
      ),
      body: Center(
        child: FadeInImage(placeholder: AssetImage('assets/original.gif'),
        fadeInDuration: Duration(milliseconds:200),
        image: NetworkImage('https://previews.123rf.com/images/yupiramos/yupiramos1609/yupiramos160912745/62358467-avatar-sonriente-hombre-de-negocios-llevaba-traje-de-dibujos-animados-y-corbata-ilustraci%C3%B3n-vectorial.jpg')),
      ),
    );
  }

}

