class FoodReview {
  String id;
  String name;
  double texture;
  double flavor;
  double sauce;


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
      "name": name,
      "texture": texture,
      "flavor": flavor,
      "sauce": sauce,
    };
  }

  @override
  String toString() {
    return "id: ${this.id}; name: ${this.name}; texture: ${this.texture}; flavor: ${this.flavor}; sauce: ${this.sauce}";
  }
}