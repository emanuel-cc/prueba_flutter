import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_flutter/models/models.dart';
import 'package:prueba_flutter/services/pokemon_services.dart';
import 'package:prueba_flutter/widgets/pokemon_card.dart';

class PokemonScreen extends StatefulWidget {
  PokemonScreen({Key? key}) : super(key: key);

  @override
  _PokemonScreenState createState() => _PokemonScreenState();
}

class _PokemonScreenState extends State<PokemonScreen> {
  final pokemonServices = PokemonServices();
  @override
  void initState() {
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final pokemonServices = Provider.of<PokemonServices>(context);
    //pokemonServices.getListPokemon();
    pokemonServices.getListPokemon();
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          children: [
            Container(
              child: Text(
                "Choose your pokemon".toUpperCase(),
                style: TextStyle(
                  color: Colors.grey[350],
                  fontSize: 18,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              height: size.height * 0.9,
              child: StreamBuilder(
                stream: pokemonServices.pokemonListStream,
                builder: (context, AsyncSnapshot<List<PokemonDetail>> snapshot) {
                  if(!snapshot.hasData){
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }else{
                    
                    final listPokemon = snapshot.data!;
                    
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemCount: listPokemon.length,
                    itemBuilder: (BuildContext context, int i){
                      return PokemonCard(
                        pokemon: listPokemon[i],
                      );
                    }
                    );
                  }
                }
              ),
            ),
          ],
        ),
      ),
    );
  }
}