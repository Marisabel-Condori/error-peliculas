import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:peliculas/models/pelicua_models.dart';

class PeliculasProvider{
  final _url = 'api.themoviedb.org';
  final _apiKey = '4ff241d64b62613bfd9cd597188f9028';
  final _languaje = 'es-ES';

  Future<List<Pelicula>> _procesarRespuesta (Uri url) async{
    final resp = await http.get(url);
    final decodeData = json.decode(resp.body);
    final peliculasPopu = new Peliculas.fromJsonList(decodeData['results']);
    return peliculasPopu.items;
  }

  Future<List<Pelicula>> getEnCines() async{
    final url = Uri.https(_url, '3/movie/now_playing',{
      'api_key'   : _apiKey,
      'languaje' : _languaje
    });
    return await _procesarRespuesta(url);
  }

  Future<List<Pelicula>> getPopulares() async{
    final url = Uri.https(_url, '3/movie/popular',{
      'api_key'   : _apiKey,
      'languaje' : _languaje
      }
    );
    return await _procesarRespuesta(url);
  }

}