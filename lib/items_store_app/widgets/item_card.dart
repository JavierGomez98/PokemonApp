import 'package:flutter/material.dart';
import 'package:pokemon_app/items_store_app/model/pokemon_bloc.dart';
import 'package:pokemon_app/items_store_app/model/pokemon_item.dart';
import 'package:provider/provider.dart';

class PokemonItem extends StatelessWidget {
  final Pokemon pokemon;
  final VoidCallback onTap;

  const PokemonItem({Key? key, required this.pokemon, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pokemonBloc = Provider.of<PokemonBloc>(context);
    const itemHeight = 290.0;
    const typeHeigth = 25.0;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: InkWell(
        onTap: onTap,
        child: SizedBox(
          height: itemHeight,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Positioned.fill(
                child: Hero(
                  tag: 'background_${pokemon.pokedexNumber}',
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(pokemon.principalColor).withOpacity(0.25),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Hero(
                  tag: 'number_${pokemon.pokedexNumber}',
                  child: SizedBox(
                    height: itemHeight * 0.6,
                    child: Material(
                      color: Colors.transparent,
                      child: FittedBox(
                        child: Text(
                          pokemon.pokedexNumber.toString(),
                          style: TextStyle(
                              color: Colors.black.withOpacity(0.05),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 20,
                left: 100,
                height: itemHeight * 0.5,
                child: Hero(
                  tag: 'image_${pokemon.pokedexNumber}',
                  child: Image.asset(
                    pokemon.images.first,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Positioned(
                bottom: 10,
                left: 10,
                child: IconButton(
                  onPressed: () => pokemonBloc.stateFavorite(pokemon.pokedexNumber),
                  icon: Icon(
                    pokemon.favorite ? Icons.favorite : Icons.favorite_border,
                    color: pokemon.favorite ? Colors.red : Colors.grey,
                  ),
                ),
              ),
              Positioned(
                bottom: 20,
                right: 20,
                child: Column(
                  children: [
                    for ( var type in pokemon.types ) 
                      Column(
                        children: [
                          Container(
                            width: 60,
                            height: typeHeigth,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Color(type.color),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Center(
                                child: Text(
                                  type.name,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 2,)
                        ],
                      ),
                  ],
                ),
                // child: SizedBox(
                //   child: Container(
                //     width: 70,
                //     height: typeHeigth*(pokemon.types.length+1)+2,
                //     child: ListView.separated(
                //       itemCount: pokemon.types.length,
                //       itemBuilder: (_, index){
                //         return Container(
                //           width: 60,
                //           height: typeHeigth,
                //           decoration: BoxDecoration(
                //             borderRadius: BorderRadius.circular(20),
                //             color: Color(pokemon.types[index].color),
                //           ),
                //           child: Padding(
                //             padding: const EdgeInsets.all(5.0),
                //             child: Center(
                //               child: Text(
                //                 pokemon.types[index].name,
                //                 style: TextStyle(
                //                   fontWeight: FontWeight.bold,
                //                   color: Colors.white,
                //                 ),
                //               ),
                //             ),
                //           ),
                //         );
                //       },
                //       separatorBuilder: (_,__) => SizedBox(height: 2,),
                //     ),
                //   ),
                // ),

                
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 25,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      pokemon.name,
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'HP ${pokemon.hp.toInt().toString()}',
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Atk. ${pokemon.attack.toInt().toString()}',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
