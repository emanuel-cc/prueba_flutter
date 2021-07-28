import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:prueba_flutter/models/models.dart';

class PokemonServices extends ChangeNotifier{
  String _baseUrl = "pokeapi.co";
  Map<String,dynamic> responseDetail = {};
  List<PokemonDetail> listPokemon = [];
  final StreamController<List<PokemonDetail>> _pokemonController = StreamController.broadcast();

  Function(List<PokemonDetail>) get sinkPokemonList => _pokemonController.sink.add;

  Stream<List<PokemonDetail>> get pokemonListStream => _pokemonController.stream;

  void dispose() { 
    _pokemonController.close();
  }

  PokemonServices(){
    this.getListPokemon();
  }

  Future<List<PokemonDetail>> getListPokemon()async{
    final _url = Uri.https(_baseUrl,'/api/v2/pokemon');

    final resp = await http.get(_url);

    Map<String, dynamic> decodedData = json.decode(resp.body);

    final pokemonResponse = PokemonResponse.fromMap(decodedData);
    pokemonResponse.results.forEach((pokemon)async{ 
      final resp = await getPokemonDetail(pokemon.name);
      final pokemonDetailResponse = PokemonDetail.fromMap(resp);
      listPokemon.add(pokemonDetailResponse);
    });
    //print(listPokemon);
    
    sinkPokemonList(listPokemon);
    notifyListeners();
    return listPokemon;
  }

  Future<Map<String,dynamic>> getPokemonDetail(String name)async{
    final _url = Uri.https(_baseUrl,'/api/v2/pokemon/$name');
    final resp = await http.get(_url);

    Map<String,dynamic> decodedData = json.decode(resp.body);
    
    notifyListeners();
    return decodedData;
  }

  Future<Map<String,dynamic>> getDescription(int id)async{
    final _url = Uri.https(_baseUrl, '/api/v2/characteristic/$id');
    final resp = await http.get(_url);
    Map<String,dynamic> decodedData = json.decode(resp.body);
    notifyListeners();
    return decodedData;
  }
}