class FoodSummary {
  final String id;
  final String name;
  final int count;

  FoodSummary({this.id, this.name, this.count});

  factory FoodSummary.fromJson(Map<String, dynamic> json){
      return FoodSummary(
        id: json["id"],
        name: json["name"],
        count: json["count"],
      );
  }

  Map<String, dynamic> toJson(){
    return {
      "id": id,
      "name": name,
      "count": count,
    };
  }
}