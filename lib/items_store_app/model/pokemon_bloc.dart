import 'package:flutter/cupertino.dart';
import 'package:pokemon_app/items_store_app/model/pokemon_item.dart';

class PokemonBloc extends ChangeNotifier {

  void stateFavorite(pokedexNumber) {
    pokemons.forEach((element) {
      if(element.pokedexNumber == pokedexNumber)
        element.stateFavorite();
    });
    notifyListeners();
  }

  List<Pokemon> pokemons = <Pokemon>[
    Pokemon(
      name: 'Bulbasaur',
      attack: 149,
      hp: 299,
      images: ['assets/pokemons/pokemon1_1.png','assets/pokemons/pokemon1_2.png'],
      pokedexNumber: '001',
      types: <Type>[
        Type(
          name: 'Grass',
          color: 0xFF9bcc50
        ),
        Type(
          name: 'Poison',
          color: 0xFFb97fc9
        ),
      ],
      principalColor: 0xFF9bcc50,
      evolutions: ['Bulbasaur','Ivysaur','Venusaur'],
      description: 'There is a plant seed on its back right from the day this Pokémon is born. The seed slowly grows larger.',
      cp: 477
    ),
    Pokemon(
      name: 'Charmander',
      attack: 249,
      hp: 399,
      images: ['assets/pokemons/pokemon2_1.png','assets/pokemons/pokemon2_2.png'],
      pokedexNumber: '004',
      types: <Type>[
        Type(
          name: 'Fire',
          color: 0xFFfd7d24
        ),
      ],
      principalColor: 0xFFfd7d24,
      evolutions: ['Charmander','Charmeleon ','Charizard '],
      description: 'It has a preference for hot things. When it rains, steam is said to spout from the tip of its tail.',
      cp: 420
    ),
    Pokemon(
      name: 'Squirtle',
      attack: 349,
      hp: 499,
      images: ['assets/pokemons/pokemon3_1.png','assets/pokemons/pokemon3_2.png'],
      pokedexNumber: '007',
      types: <Type>[
        Type(
          name: 'Water',
          color: 0xFF30a7d7
        ),
      ],
      principalColor: 0xFF30a7d7,
      evolutions: ['Squirtle','Wartortle ','Blastoise '],
      description: 'When it retracts its long neck into its shell, it squirts out water with vigorous force.',
      cp: 405
    ),
    Pokemon(
      name: 'Zorua',
      attack: 449,
      hp: 599,
      images: ['assets/pokemons/pokemon4_1.png','assets/pokemons/pokemon4_2.png'],
      pokedexNumber: '570',
      types: <Type>[
        Type(
          name: 'Dark',
          color: 0xFF707070
        ),
      ],
      principalColor: 0xFF707070,
      evolutions: ['Zorua','Zoroark '],
      description: 'Zorua is a timid Pokémon. This disposition seems to be what led to the development of Zorua’s ability to take on the forms of other creatures.',
      cp: 503
    ),
  ];
}