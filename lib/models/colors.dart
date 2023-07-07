

class ColorsList{
  String colorId;
  String color;
  String colorCode;
  ColorsList({required this.colorId, required this.color, required this.colorCode});
  factory ColorsList.fromJson(Map<String,dynamic>json){
    return ColorsList(
      colorId: json['color_id'],
      color: json['color_name'],
      colorCode: json['color_code']
    );
  }
}