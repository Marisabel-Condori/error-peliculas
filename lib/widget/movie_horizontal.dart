import 'package:flutter/material.dart';
import 'package:peliculas/models/pelicua_models.dart';
 
class MovieHorizontal extends StatelessWidget {
  final List<Pelicula> peliculas;

  MovieHorizontal({ @required this.peliculas});

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return Container(
      height: _screenSize.height * 0.2,
        child: PageView(
          pageSnapping: false,
          controller: PageController(
            initialPage: 1, viewportFraction: 0.3
          ),
          children: _tarjetas(),
        ),
    );
  }

  List<Widget> _tarjetas() {
    return peliculas.map((pelicula){
      return Container(
        margin: EdgeInsets.only(right: 15.0),
        child: Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: FadeInImage(
                placeholder: AssetImage('lib/asset/no-image.jpg'), 
                image: NetworkImage(pelicula.getObtenerPoster(), ),
                height: 110.0,
              ),
            )
          ],
        ),
      );
    }).toList();
  }
}