import 'package:flutter/material.dart';
import 'package:prueba_flutter/models/models.dart';
import 'package:prueba_flutter/services/pokemon_services.dart';

class PokemonDetailScreen extends StatefulWidget {
  PokemonDetailScreen({ Key? key }) : super(key: key);

  @override
  _PokemonDetailScreenState createState() => _PokemonDetailScreenState();
}

class _PokemonDetailScreenState extends State<PokemonDetailScreen> {
  final pokemonServices = PokemonServices();
  @override
  Widget build(BuildContext context) {
    PokemonDetail pokemon = ModalRoute.of(context)?.settings.arguments as PokemonDetail;
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: (){
            Navigator.pop(context);
          }
        ),
        backgroundColor: Color(0xffFDE167),
        elevation: 0,
      ),
      body: Stack(
        children: [
          
          Container(
            height: double.infinity,
            color: Color(0xffFDE167),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Image(
              image: AssetImage(
                "assets/pokebola.PNG"
              ),
              fit: BoxFit.fill,
            )
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              height: size.height * 0.5,
              margin: EdgeInsets.symmetric(horizontal: 10.0),
              decoration: BoxDecoration(
                color: Color(0xffFAEAAF),
                borderRadius: BorderRadius.circular(10)
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              width: size.width * 0.9,
              height: size.height * 0.6,
              margin: EdgeInsets.symmetric(horizontal: 20.0),
              padding: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${pokemon.name}".toUpperCase(),
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  Text(
                    "${pokemon.types.first.type.name}".toUpperCase(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.06,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Height",
                            style: TextStyle(
                              color: Color(0xffFDE3A2)
                            ),
                          ),
                          Text(
                            "${pokemon.height}",
                            style: TextStyle(
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Weight",
                            style: TextStyle(
                              color: Color(0xffFDE3A2)
                            ),
                          ),
                          Text(
                            "${pokemon.weight}",
                            style: TextStyle(
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Category",
                            style: TextStyle(
                              color: Color(0xffFDE3A2)
                            ),
                          ),
                          Text(
                            "${pokemon.species.name}",
                            style: TextStyle(
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Abilities",
                            style: TextStyle(
                              color: Color(0xffFDE3A2)
                            ),
                          ),
                          Text(
                            "${pokemon.abilities.first.ability.name}",
                            style: TextStyle(
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  FutureBuilder(
                    future: pokemonServices.getDescription(pokemon.id),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if(!snapshot.hasData){
                        return Container(
                          child: Text(
                            "Cargando"
                          ),
                        );
                      }else{
                        PokemonDescription pokemonDesc = PokemonDescription.fromMap(snapshot.data);
                        return Text(
                          "${pokemonDesc.descriptions.first.description}"
                        );
                      }
                    },
                  ),
                  SizedBox(
                    height: size.height * 0.06,
                  ),
                  Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: pokemon.stats.length,
                      itemBuilder: (BuildContext context, int i){
                        return Container(
                          margin: EdgeInsets.only(right: 2),
                          width: size.width * 0.18,
                          child: Column(
                            children: [
                              Container(
                                alignment: Alignment.bottomCenter,
                                width: size.width * 0.06,
                                height: 100,//size.height * 0.1
                                child: Container(
                                  width: size.width * 0.06,
                                  height: pokemon.stats[i].baseStat.toDouble(),
                                  color: Color(0xffFEE167),
                                ),
                              ),
                              SizedBox(
                                height: size.height * 0.02,
                              ),
                              Text(
                                "${pokemon.stats[i].stat.name}".toUpperCase(),
                                style: TextStyle(
                                  fontWeight: FontWeight.bold
                                ),
                                maxLines: 2,
                              )
                            ],
                          ),
                        );
                      }
                    )
                  ),
                  
                ],
              ),
            ),
          ),
          Positioned(
            left: size.width * 0.45,
            //right: size.width * 0.01,
            child: FadeInImage(
              placeholder: AssetImage(
                "assets/loading.gif"
              ), 
              image: NetworkImage(
                "${pokemon.sprites.other!.officialArtwork.frontDefault}"
              ),
              fit: BoxFit.fill,
              height: size.height * 0.3,
            )
          )
        ]
      ),
    );
  }
}