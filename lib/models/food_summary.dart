class FoodSummary {
  final String id;
  final String name;
  final String iconUrl;
  final int count;

  static String DEFAULT_IMAGE_URL = "https://icons-for-free.com/iconfiles/png/512/meal-1320568026248944827.png";

  FoodSummary({this.id, this.name, this.iconUrl, this.count});

  factory FoodSummary.fromJson(Map<String, dynamic> json){
      return FoodSummary(
        id: json["id"],
        name: json["name"],
        iconUrl: json["iconUrl"],
        count: json["count"],
      );
  }

  Map<String, dynamic> toJson(){
    return {
      "id": id,
      "name": name,
      "iconUrl": iconUrl,
      "count": count,
    };
  }
}