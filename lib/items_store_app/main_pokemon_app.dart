import 'package:flutter/material.dart';
import 'package:pokemon_app/items_store_app/model/pokemon_bloc.dart';
import 'package:pokemon_app/items_store_app/model/pokemon_item.dart';
import 'package:pokemon_app/items_store_app/pages/pokemon_details.dart';
import 'package:pokemon_app/items_store_app/widgets/item_card.dart';
import 'package:provider/provider.dart';

class MainItemsStore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => PokemonBloc(),
      child: Consumer<PokemonBloc>(
        builder: (context, bloc, _) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData.light(),
            home: ItemsStoreHome(),
          );
        },
      ),
    );
  }
}

class ItemsStoreHome extends StatelessWidget {
  final ValueNotifier<bool> notifierBottomBarVisible = ValueNotifier(true);

  void _onItemPressed(Pokemon pokemon, BuildContext context) async {
    notifierBottomBarVisible.value = false;
    await Navigator.of(context).push(
      PageRouteBuilder(pageBuilder: (context, animation1, animation2) {
        return FadeTransition(
          opacity: animation1,
          child: PokemonDetails(
            pokemon: pokemon,
          ),
        );
      }),
    );
    notifierBottomBarVisible.value = true;
  }

  @override
  Widget build(BuildContext context) {
    final pokemonBloc = Provider.of<PokemonBloc>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(
                  'assets/pokemons/pokemon_logo.png',
                  height: 60,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: pokemonBloc.pokemons.length,
                    padding: const EdgeInsets.only(bottom: 45),
                    itemBuilder: (context, index) {
                      final pokemon = pokemonBloc.pokemons[index];
                      return PokemonItem(
                        pokemon: pokemon,
                        onTap: () {
                          _onItemPressed(pokemon, context);
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          ValueListenableBuilder<bool>(
              valueListenable: notifierBottomBarVisible,
              builder: (context, value, child) {
                return AnimatedPositioned(
                  duration: const Duration(milliseconds: 200),
                  left: 0,
                  right: 0,
                  bottom: value ? 0 : -kToolbarHeight,
                  height: kToolbarHeight,
                  child: Container(
                    color: Colors.white.withOpacity(0.7),
                    child: Row(
                      children: [
                        Expanded(
                          child: Icon(Icons.home),
                        ),
                        Expanded(
                          child: Icon(Icons.search),
                        ),
                        Expanded(
                          child: Icon(Icons.favorite_border),
                        ),
                        Expanded(
                          child: Center(
                            child: CircleAvatar(
                              backgroundColor: Colors.black,
                              radius: 15,
                              backgroundImage: AssetImage('assets/pokemons/pokeball.png'),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: CircleAvatar(
                              radius: 15,
                              backgroundImage: AssetImage('assets/logo.png'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              })
        ],
      ),
    );
  }
}
