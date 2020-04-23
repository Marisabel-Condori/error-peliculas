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
    //  width: double.infinity,
      
      child: Swiper(
        itemWidth: _screenSize.width * 0.7,
        itemHeight: _screenSize.height * 0.5,
        layout: SwiperLayout.STACK,
        itemBuilder: (BuildContext context, int index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.network(
            "https://www.eluniverso.com/sites/default/files/styles/powgallery_1024/public/fotos/2015/01/vye01ln281114aphoto06.jpg?itok=ciF60qG5",
            fit: BoxFit.cover),
          );
        },
        itemCount: 3,
       // pagination: new SwiperPagination(),
      //  control: new SwiperControl(),
      ),
    );
  }
}
