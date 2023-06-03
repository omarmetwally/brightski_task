class Recipe {
  late final String? id;
  late final String? name;
  late final String? image;
  late final String? time;
  late final num? rating;
  late final String? description;
  late final List<String>? ingredients;

  Recipe({
    required this.id,
    required this.name,
    required this.image,
    required this.time,
    required this.rating,
    required this.description,
    required this.ingredients,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      id: json["id"],
      name: json["name"],
      image: json["image"],
      time: json["time"],
      rating: json["rating"],
      description: json["description"],
      ingredients: List<String>.from(json["ingredients"].map((e) => e)),
    );
  }

  static List<Recipe> recipesFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return Recipe.fromJson(data);
    }).toList();
  }

  @override
  String toString() {
    return '{"id":"$id","name": "$name", "image": "$image", "time": "$time", "rating": $rating,"description":"$description","ingredients":"$ingredients"}';
  }
}
