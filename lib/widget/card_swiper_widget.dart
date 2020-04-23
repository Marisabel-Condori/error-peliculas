import 'package:flutter/material.dart';

import 'package:flutter_swiper/flutter_swiper.dart';

class CardSwiper extends StatelessWidget {
  final List<dynamic> peliculas;
  CardSwiper({@required this.peliculas});

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(top: 10.0),
      child: Swiper(
        itemWidth: _screenSize.width * 0.7,
        itemHeight: _screenSize.height * 0.5,
        layout: SwiperLayout.STACK,
        itemBuilder: (BuildContext context, int index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: FadeInImage(
              placeholder: AssetImage('lib/asset/no-image.jpg'), 
              image: NetworkImage(peliculas[index].getObtenerPoster()),
              fit: BoxFit.cover,),
          );
        },
        itemCount: peliculas.length,
       // pagination: new SwiperPagination(),
      //  control: new SwiperControl(),
      ),
    );
  }
}
