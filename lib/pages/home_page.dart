import 'package:flutter/material.dart';
import 'package:peliculas/provider/peliculas_provider.dart';

import 'package:peliculas/widget/card_swiper_widget.dart';
import 'package:peliculas/widget/movie_horizontal.dart';

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
            Divider(height: 20.0,),
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
      width: double.infinity,
      child: Column(
        children: <Widget>[
          Text('Popuulares',
           style: Theme.of(context).textTheme.subhead),
          FutureBuilder(
            future: PeliculasProvider().getPopulares(),
            builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
              snapshot.data?.forEach((p) => print(p.title));
              if(snapshot == null){return CircularProgressIndicator();
              }else{return MovieHorizontal(peliculas: snapshot.data,); }
            },
          ),
        ],
      ),
    );
  }

}
