import 'package:flutter/material.dart';
import 'package:peliculas/models/pelicua_models.dart';
import 'package:peliculas/provider/peliculas_provider.dart';

import 'package:peliculas/widget/card_swiper_widget.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Peliculas'),
        backgroundColor: Colors.indigo,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: () {})
        ],
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            _swiperTarjetas(),
            _footer(context),
          ],
        ),
      ),
    );
  }

  Widget _swiperTarjetas() {
    return FutureBuilder(
      future: PeliculasProvider().getEnCines(), 
      builder: (BuildContext context, AsyncSnapshot<List> peli){
        if (peli.hasData){return CardSwiper(peliculas: peli.data,);}
        else {
          return Container(
            child: Center( child:CircularProgressIndicator())
          );
        }
      },
    );
  }

  Widget _footer(BuildContext context ){
    return Container(
      child: Column(
        children: <Widget>[
          Text('Popuulares', style: Theme.of(context).textTheme.subhead),
          FutureBuilder(
            future: PeliculasProvider().getPopulares(),
            builder: (BuildContext context, AsyncSnapshot<List<Pelicula>> peliPopular) {
              for (var item1 in peliPopular.data) {
                print(item1.title);
              }
              
              return Text('aqui imagen');
              
            },
          ),
        ],
      ),
    );
  }

}
