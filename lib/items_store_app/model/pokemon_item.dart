class Pokemon {
  final String name;
  final double attack;
  final double hp;
  final List<String> images;
  final String pokedexNumber;
  final List<Type> types;
  final int principalColor;
  final List<String> evolutions;
  final String description;
  final int cp;
  bool favorite;

  Pokemon({
    required this.name, 
    required this.attack, 
    required this.hp, 
    required this.images, 
    required this.pokedexNumber,
    required this.types,
    required this.principalColor,
    required this.evolutions,
    required this.description,
    required this.cp,
    this.favorite = false
  });
}

class Type {
  final String name;
  final int color;

  Type({required this.name, required this.color});
}