import 'package:flutter/material.dart';
import 'package:prueba_flutter/models/models.dart';

class PokemonCard extends StatelessWidget {
  final PokemonDetail pokemon;
  const PokemonCard({ Key? key, required this.pokemon }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, 'detail', arguments: pokemon);
      },
      child: Container(
        height: size.height * 0.3,
        margin: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: Offset(0, 4)
            )
          ]
        ),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: size.height * 0.1,
                  ),
                  Container(
                    width: size.width * 0.4,
                    child: Text(
                      "${pokemon.name}".toUpperCase(),
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    "${pokemon.types.first.type.name}".toUpperCase(),
                    style: TextStyle(
                      color: Colors.grey
                    ),
                  )
                ],
              ),
            ),
            FadeInImage(
              placeholder: AssetImage(
                "assets/loading.gif"
              ), 
              image: NetworkImage(
                "${pokemon.sprites.other!.officialArtwork.frontDefault}"
              ),
              fit: BoxFit.cover,
              width: size.width * 0.53,
              height: size.height * 0.5,
            )
          ],
        ),
      ),
    );
  }
}