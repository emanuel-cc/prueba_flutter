// To parse this JSON data, do
//
//     final pokemonDescription = pokemonDescriptionFromMap(jsonString);

import 'dart:convert';

import 'package:prueba_flutter/models/models.dart';

class PokemonDescription {
    PokemonDescription({
      required this.descriptions,
      required this.geneModulo,
      required this.highestStat,
      required this.id,
      required this.possibleValues,
    });

    List<Description> descriptions;
    int geneModulo;
    HighestStat highestStat;
    int id;
    List<int> possibleValues;

    factory PokemonDescription.fromJson(String str) => PokemonDescription.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory PokemonDescription.fromMap(Map<String, dynamic> json) => PokemonDescription(
        descriptions: List<Description>.from(json["descriptions"].map((x) => Description.fromMap(x))),
        geneModulo: json["gene_modulo"],
        highestStat: HighestStat.fromMap(json["highest_stat"]),
        id: json["id"],
        possibleValues: List<int>.from(json["possible_values"].map((x) => x)),
    );

    Map<String, dynamic> toMap() => {
        "descriptions": List<dynamic>.from(descriptions.map((x) => x.toMap())),
        "gene_modulo": geneModulo,
        "highest_stat": highestStat.toMap(),
        "id": id,
        "possible_values": List<dynamic>.from(possibleValues.map((x) => x)),
    };
}
