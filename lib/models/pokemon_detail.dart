// To parse this JSON data, do
//
//     final pokemonDetail = pokemonDetailFromMap(jsonString);

import 'dart:convert';

class PokemonDetail {
    PokemonDetail({
      required this.abilities,
      required this.baseExperience,
      required this.forms,
      required this.gameIndices,
      required this.height,
      required this.heldItems,
      required this.id,
      required this.isDefault,
      required this.locationAreaEncounters,
      required this.moves,
      required this.name,
      required this.order,
      required this.pastTypes,
      required this.species,
      required this.sprites,
      required this.stats,
      required this.types,
      required this.weight,
      this.descriptions
    });

    List<Ability> abilities;
    int baseExperience;
    List<Species> forms;
    List<GameIndex> gameIndices;
    int height;
    List<dynamic> heldItems;
    int id;
    bool isDefault;
    String locationAreaEncounters;
    List<Move> moves;
    String name;
    int order;
    List<dynamic> pastTypes;
    Species species;
    Sprites sprites;
    List<Stat> stats;
    List<Type> types;
    List<Description>? descriptions = [];
    int weight;


    factory PokemonDetail.fromJson(String str) => PokemonDetail.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory PokemonDetail.fromMap(Map<String, dynamic> json) => PokemonDetail(
        abilities: List<Ability>.from(json["abilities"].map((x) => Ability.fromMap(x))),
        baseExperience: json["base_experience"],
        forms: List<Species>.from(json["forms"].map((x) => Species.fromMap(x))),
        gameIndices: List<GameIndex>.from(json["game_indices"].map((x) => GameIndex.fromMap(x))),
        height: json["height"],
        heldItems: List<dynamic>.from(json["held_items"].map((x) => x)),
        id: json["id"],
        isDefault: json["is_default"],
        locationAreaEncounters: json["location_area_encounters"],
        moves: List<Move>.from(json["moves"].map((x) => Move.fromMap(x))),
        name: json["name"],
        order: json["order"],
        pastTypes: List<dynamic>.from(json["past_types"].map((x) => x)),
        species: Species.fromMap(json["species"]),
        sprites: Sprites.fromMap(json["sprites"]),
        stats: List<Stat>.from(json["stats"].map((x) => Stat.fromMap(x))),
        types: List<Type>.from(json["types"].map((x) => Type.fromMap(x))),
        weight: json["weight"], 
        //descriptions: List<Description>.from(json["descriptions"] == null ? null : json["descriptions"].map((x) => Description.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "abilities": List<dynamic>.from(abilities.map((x) => x.toMap())),
        "base_experience": baseExperience,
        "forms": List<dynamic>.from(forms.map((x) => x.toMap())),
        "game_indices": List<dynamic>.from(gameIndices.map((x) => x.toMap())),
        "height": height,
        "held_items": List<dynamic>.from(heldItems.map((x) => x)),
        "id": id,
        "is_default": isDefault,
        "location_area_encounters": locationAreaEncounters,
        "moves": List<dynamic>.from(moves.map((x) => x.toMap())),
        "name": name,
        "order": order,
        "past_types": List<dynamic>.from(pastTypes.map((x) => x)),
        "species": species.toMap(),
        "sprites": sprites.toMap(),
        "stats": List<dynamic>.from(stats.map((x) => x.toMap())),
        "types": List<dynamic>.from(types.map((x) => x.toMap())),
        "weight": weight,
    };
}

class Description {
    Description({
      required this.description,
      required this.language,
    });

    String description;
    HighestStat language;

    factory Description.fromJson(String str) => Description.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Description.fromMap(Map<String, dynamic> json) => Description(
        description: json["description"],
        language: HighestStat.fromMap(json["language"]),
    );

    Map<String, dynamic> toMap() => {
        "description": description,
        "language": language.toMap(),
    };
}

class HighestStat {
    HighestStat({
      required this.name,
      required this.url,
    });

    String name;
    String url;

    factory HighestStat.fromJson(String str) => HighestStat.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory HighestStat.fromMap(Map<String, dynamic> json) => HighestStat(
        name: json["name"],
        url: json["url"],
    );

    Map<String, dynamic> toMap() => {
        "name": name,
        "url": url,
    };
}

class Ability {
    Ability({
      required this.ability,
      required this.isHidden,
      required this.slot,
    });

    Species ability;
    bool isHidden;
    int slot;

    factory Ability.fromJson(String str) => Ability.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Ability.fromMap(Map<String, dynamic> json) => Ability(
        ability: Species.fromMap(json["ability"]),
        isHidden: json["is_hidden"],
        slot: json["slot"],
    );

    Map<String, dynamic> toMap() => {
        "ability": ability.toMap(),
        "is_hidden": isHidden,
        "slot": slot,
    };
}

class Species {
    Species({
      required this.name,
      required this.url,
    });

    String name;
    String url;

    factory Species.fromJson(String str) => Species.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Species.fromMap(Map<String, dynamic> json) => Species(
        name: json["name"],
        url: json["url"],
    );

    Map<String, dynamic> toMap() => {
        "name": name,
        "url": url,
    };
}

class GameIndex {
    GameIndex({
      required this.gameIndex,
      required this.version,
    });

    int gameIndex;
    Species version;

    factory GameIndex.fromJson(String str) => GameIndex.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory GameIndex.fromMap(Map<String, dynamic> json) => GameIndex(
        gameIndex: json["game_index"],
        version: Species.fromMap(json["version"]),
    );

    Map<String, dynamic> toMap() => {
        "game_index": gameIndex,
        "version": version.toMap(),
    };
}

class Move {
    Move({
      required this.move,
      required this.versionGroupDetails,
    });

    Species move;
    List<VersionGroupDetail> versionGroupDetails;

    factory Move.fromJson(String str) => Move.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Move.fromMap(Map<String, dynamic> json) => Move(
        move: Species.fromMap(json["move"]),
        versionGroupDetails: List<VersionGroupDetail>.from(json["version_group_details"].map((x) => VersionGroupDetail.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "move": move.toMap(),
        "version_group_details": List<dynamic>.from(versionGroupDetails.map((x) => x.toMap())),
    };
}

class VersionGroupDetail {
    VersionGroupDetail({
      required this.levelLearnedAt,
      required this.moveLearnMethod,
      required this.versionGroup,
    });

    int levelLearnedAt;
    Species moveLearnMethod;
    Species versionGroup;

    factory VersionGroupDetail.fromJson(String str) => VersionGroupDetail.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory VersionGroupDetail.fromMap(Map<String, dynamic> json) => VersionGroupDetail(
        levelLearnedAt: json["level_learned_at"],
        moveLearnMethod: Species.fromMap(json["move_learn_method"]),
        versionGroup: Species.fromMap(json["version_group"]),
    );

    Map<String, dynamic> toMap() => {
        "level_learned_at": levelLearnedAt,
        "move_learn_method": moveLearnMethod.toMap(),
        "version_group": versionGroup.toMap(),
    };
}

class GenerationV {
    GenerationV({
      required this.blackWhite,
    });

    Sprites blackWhite;

    factory GenerationV.fromJson(String str) => GenerationV.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory GenerationV.fromMap(Map<String, dynamic> json) => GenerationV(
        blackWhite: Sprites.fromMap(json["black-white"]),
    );

    Map<String, dynamic> toMap() => {
        "black-white": blackWhite.toMap(),
    };
}

class GenerationIv {
    GenerationIv({
      required this.diamondPearl,
      required this.heartgoldSoulsilver,
      required this.platinum,
    });

    Sprites diamondPearl;
    Sprites heartgoldSoulsilver;
    Sprites platinum;

    factory GenerationIv.fromJson(String str) => GenerationIv.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory GenerationIv.fromMap(Map<String, dynamic> json) => GenerationIv(
        diamondPearl: Sprites.fromMap(json["diamond-pearl"]),
        heartgoldSoulsilver: Sprites.fromMap(json["heartgold-soulsilver"]),
        platinum: Sprites.fromMap(json["platinum"]),
    );

    Map<String, dynamic> toMap() => {
        "diamond-pearl": diamondPearl.toMap(),
        "heartgold-soulsilver": heartgoldSoulsilver.toMap(),
        "platinum": platinum.toMap(),
    };
}

class Versions {
    Versions({
      required this.generationI,
      required this.generationIi,
      required this.generationIii,
      required this.generationIv,
      required this.generationV,
      required this.generationVi,
      required this.generationVii,
      required this.generationViii,
    });

    GenerationI generationI;
    GenerationIi generationIi;
    GenerationIii generationIii;
    GenerationIv generationIv;
    GenerationV generationV;
    Map<String, GenerationVi> generationVi;
    GenerationVii generationVii;
    GenerationViii generationViii;

    factory Versions.fromJson(String str) => Versions.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Versions.fromMap(Map<String, dynamic> json) => Versions(
        generationI: GenerationI.fromMap(json["generation-i"]),
        generationIi: GenerationIi.fromMap(json["generation-ii"]),
        generationIii: GenerationIii.fromMap(json["generation-iii"]),
        generationIv: GenerationIv.fromMap(json["generation-iv"]),
        generationV: GenerationV.fromMap(json["generation-v"]),
        generationVi: Map.from(json["generation-vi"]).map((k, v) => MapEntry<String, GenerationVi>(k, GenerationVi.fromMap(v))),
        generationVii: GenerationVii.fromMap(json["generation-vii"]),
        generationViii: GenerationViii.fromMap(json["generation-viii"]),
    );

    Map<String, dynamic> toMap() => {
        "generation-i": generationI.toMap(),
        "generation-ii": generationIi.toMap(),
        "generation-iii": generationIii.toMap(),
        "generation-iv": generationIv.toMap(),
        "generation-v": generationV.toMap(),
        "generation-vi": Map.from(generationVi).map((k, v) => MapEntry<String, dynamic>(k, v.toMap())),
        "generation-vii": generationVii.toMap(),
        "generation-viii": generationViii.toMap(),
    };
}

class Sprites {
    Sprites({
      required this.backDefault,
      required this.backFemale,
      required this.backShiny,
      required this.backShinyFemale,
      required this.frontDefault,
      required this.frontFemale,
      required this.frontShiny,
      required this.frontShinyFemale,
      this.other,
      this.versions,
      this.animated,
    });

    String backDefault;
    dynamic backFemale;
    String backShiny;
    dynamic backShinyFemale;
    String frontDefault;
    dynamic frontFemale;
    String frontShiny;
    dynamic frontShinyFemale;
    Other? other;
    Versions? versions;
    Sprites? animated;

    factory Sprites.fromJson(String str) => Sprites.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Sprites.fromMap(Map<String, dynamic> json) => Sprites(
        backDefault: json["back_default"],
        backFemale: json["back_female"],
        backShiny: json["back_shiny"],
        backShinyFemale: json["back_shiny_female"],
        frontDefault: json["front_default"],
        frontFemale: json["front_female"],
        frontShiny: json["front_shiny"],
        frontShinyFemale: json["front_shiny_female"],
        other: json["other"] == null ? null : Other.fromMap(json["other"]),
        versions: json["versions"] == null ? null : Versions.fromMap(json["versions"]),
        animated: json["animated"] == null ? null : Sprites.fromMap(json["animated"]),
    );

    Map<String, dynamic> toMap() => {
        "back_default": backDefault,
        "back_female": backFemale,
        "back_shiny": backShiny,
        "back_shiny_female": backShinyFemale,
        "front_default": frontDefault,
        "front_female": frontFemale,
        "front_shiny": frontShiny,
        "front_shiny_female": frontShinyFemale,
        "other": other == null ? null : other!.toMap(),
        "versions": versions == null ? null : versions!.toMap(),
        "animated": animated == null ? null : animated!.toMap(),
    };
}

class GenerationI {
    GenerationI({
      required this.redBlue,
      required this.yellow,
    });

    RedBlue redBlue;
    RedBlue yellow;

    factory GenerationI.fromJson(String str) => GenerationI.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory GenerationI.fromMap(Map<String, dynamic> json) => GenerationI(
        redBlue: RedBlue.fromMap(json["red-blue"]),
        yellow: RedBlue.fromMap(json["yellow"]),
    );

    Map<String, dynamic> toMap() => {
        "red-blue": redBlue.toMap(),
        "yellow": yellow.toMap(),
    };
}

class RedBlue {
    RedBlue({
      required this.backDefault,
      required this.backGray,
      required this.frontDefault,
      required this.frontGray,
    });

    String backDefault;
    String backGray;
    String frontDefault;
    String frontGray;

    factory RedBlue.fromJson(String str) => RedBlue.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory RedBlue.fromMap(Map<String, dynamic> json) => RedBlue(
        backDefault: json["back_default"],
        backGray: json["back_gray"],
        frontDefault: json["front_default"],
        frontGray: json["front_gray"],
    );

    Map<String, dynamic> toMap() => {
        "back_default": backDefault,
        "back_gray": backGray,
        "front_default": frontDefault,
        "front_gray": frontGray,
    };
}

class GenerationIi {
    GenerationIi({
      required this.crystal,
      required this.gold,
      required this.silver,
    });

    Crystal crystal;
    Crystal gold;
    Crystal silver;

    factory GenerationIi.fromJson(String str) => GenerationIi.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory GenerationIi.fromMap(Map<String, dynamic> json) => GenerationIi(
        crystal: Crystal.fromMap(json["crystal"]),
        gold: Crystal.fromMap(json["gold"]),
        silver: Crystal.fromMap(json["silver"]),
    );

    Map<String, dynamic> toMap() => {
        "crystal": crystal.toMap(),
        "gold": gold.toMap(),
        "silver": silver.toMap(),
    };
}

class Crystal {
    Crystal({
      required this.backDefault,
      required this.backShiny,
      required this.frontDefault,
      required this.frontShiny,
    });

    String backDefault;
    String backShiny;
    String frontDefault;
    String frontShiny;

    factory Crystal.fromJson(String str) => Crystal.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Crystal.fromMap(Map<String, dynamic> json) => Crystal(
        backDefault: json["back_default"],
        backShiny: json["back_shiny"],
        frontDefault: json["front_default"],
        frontShiny: json["front_shiny"],
    );

    Map<String, dynamic> toMap() => {
        "back_default": backDefault,
        "back_shiny": backShiny,
        "front_default": frontDefault,
        "front_shiny": frontShiny,
    };
}

class GenerationIii {
    GenerationIii({
      required this.emerald,
      required this.fireredLeafgreen,
      required this.rubySapphire,
    });

    Emerald emerald;
    Crystal fireredLeafgreen;
    Crystal rubySapphire;

    factory GenerationIii.fromJson(String str) => GenerationIii.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory GenerationIii.fromMap(Map<String, dynamic> json) => GenerationIii(
        emerald: Emerald.fromMap(json["emerald"]),
        fireredLeafgreen: Crystal.fromMap(json["firered-leafgreen"]),
        rubySapphire: Crystal.fromMap(json["ruby-sapphire"]),
    );

    Map<String, dynamic> toMap() => {
        "emerald": emerald.toMap(),
        "firered-leafgreen": fireredLeafgreen.toMap(),
        "ruby-sapphire": rubySapphire.toMap(),
    };
}

class Emerald {
    Emerald({
      required this.frontDefault,
      required this.frontShiny,
    });

    String frontDefault;
    String frontShiny;

    factory Emerald.fromJson(String str) => Emerald.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Emerald.fromMap(Map<String, dynamic> json) => Emerald(
        frontDefault: json["front_default"],
        frontShiny: json["front_shiny"],
    );

    Map<String, dynamic> toMap() => {
        "front_default": frontDefault,
        "front_shiny": frontShiny,
    };
}

class GenerationVi {
    GenerationVi({
      required this.frontDefault,
      required this.frontFemale,
      required this.frontShiny,
      required this.frontShinyFemale,
    });

    String frontDefault;
    dynamic frontFemale;
    String frontShiny;
    dynamic frontShinyFemale;

    factory GenerationVi.fromJson(String str) => GenerationVi.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory GenerationVi.fromMap(Map<String, dynamic> json) => GenerationVi(
        frontDefault: json["front_default"],
        frontFemale: json["front_female"],
        frontShiny: json["front_shiny"],
        frontShinyFemale: json["front_shiny_female"],
    );

    Map<String, dynamic> toMap() => {
        "front_default": frontDefault,
        "front_female": frontFemale,
        "front_shiny": frontShiny,
        "front_shiny_female": frontShinyFemale,
    };
}

class GenerationVii {
    GenerationVii({
      required this.icons,
      required this.ultraSunUltraMoon,
    });

    DreamWorld icons;
    GenerationVi ultraSunUltraMoon;

    factory GenerationVii.fromJson(String str) => GenerationVii.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory GenerationVii.fromMap(Map<String, dynamic> json) => GenerationVii(
        icons: DreamWorld.fromMap(json["icons"]),
        ultraSunUltraMoon: GenerationVi.fromMap(json["ultra-sun-ultra-moon"]),
    );

    Map<String, dynamic> toMap() => {
        "icons": icons.toMap(),
        "ultra-sun-ultra-moon": ultraSunUltraMoon.toMap(),
    };
}

class DreamWorld {
    DreamWorld({
      required this.frontDefault,
      required this.frontFemale,
    });

    String frontDefault;
    dynamic frontFemale;

    factory DreamWorld.fromJson(String str) => DreamWorld.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory DreamWorld.fromMap(Map<String, dynamic> json) => DreamWorld(
        frontDefault: json["front_default"],
        frontFemale: json["front_female"],
    );

    Map<String, dynamic> toMap() => {
        "front_default": frontDefault,
        "front_female": frontFemale,
    };
}

class GenerationViii {
    GenerationViii({
      required this.icons,
    });

    DreamWorld icons;

    factory GenerationViii.fromJson(String str) => GenerationViii.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory GenerationViii.fromMap(Map<String, dynamic> json) => GenerationViii(
        icons: DreamWorld.fromMap(json["icons"]),
    );

    Map<String, dynamic> toMap() => {
        "icons": icons.toMap(),
    };
}

class Other {
    Other({
      required this.dreamWorld,
      required this.officialArtwork,
    });

    DreamWorld dreamWorld;
    OfficialArtwork officialArtwork;

    factory Other.fromJson(String str) => Other.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Other.fromMap(Map<String, dynamic> json) => Other(
        dreamWorld: DreamWorld.fromMap(json["dream_world"]),
        officialArtwork: OfficialArtwork.fromMap(json["official-artwork"]),
    );

    Map<String, dynamic> toMap() => {
        "dream_world": dreamWorld.toMap(),
        "official-artwork": officialArtwork.toMap(),
    };
}

class OfficialArtwork {
    OfficialArtwork({
      required this.frontDefault,
    });

    String frontDefault;

    factory OfficialArtwork.fromJson(String str) => OfficialArtwork.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory OfficialArtwork.fromMap(Map<String, dynamic> json) => OfficialArtwork(
        frontDefault: json["front_default"],
    );

    Map<String, dynamic> toMap() => {
        "front_default": frontDefault,
    };
}

class Stat {
    Stat({
      required this.baseStat,
      required this.effort,
      required this.stat,
    });

    int baseStat;
    int effort;
    Species stat;

    factory Stat.fromJson(String str) => Stat.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Stat.fromMap(Map<String, dynamic> json) => Stat(
        baseStat: json["base_stat"],
        effort: json["effort"],
        stat: Species.fromMap(json["stat"]),
    );

    Map<String, dynamic> toMap() => {
        "base_stat": baseStat,
        "effort": effort,
        "stat": stat.toMap(),
    };
}

class Type {
    Type({
      required this.slot,
      required this.type,
    });

    int slot;
    Species type;

    factory Type.fromJson(String str) => Type.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Type.fromMap(Map<String, dynamic> json) => Type(
        slot: json["slot"],
        type: Species.fromMap(json["type"]),
    );

    Map<String, dynamic> toMap() => {
        "slot": slot,
        "type": type.toMap(),
    };
}
