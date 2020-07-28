class FoodReview {
  final String id;
  final String name;
  final double texture;
  final double flavor;
  final double sauce;


  FoodReview({this.id, this.name, this.texture, this.flavor, this.sauce});

  factory FoodReview.fromJson(Map<String, dynamic> json){
    return FoodReview(
      id: json["id"],
      name: json["name"],
      texture: json["texture"].toDouble(),
      flavor: json["flavor"].toDouble(),
      sauce: json["sauce"].toDouble(),
    );
  }

  double get average => (texture + flavor + sauce) / 3;

  Map<String, dynamic> toJson(){
    return {
      "id": id,
      "name": name,
      "texture": texture,
      "flavor": flavor,
      "sauce": sauce,
    };
  }
}