import 'dart:convert';

class Product {
  final String itemCode;
  final String itemName;
  final String codeBars;

  Product(
      {required this.itemCode, required this.itemName, required this.codeBars});

  // Método para mapear el JSON a la clase Product
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
        itemCode: json['ItemCode'],
        itemName: json['ItemName'],
        codeBars: json['CodeBars']);
  }
// to json
  Map<String, dynamic> toMap() => {
        "ItemCode": itemCode,
        "ItemName": itemName,
        "CodeBars": codeBars,
      };

      // to json
  String toJson() => jsonEncode({
        "ItemCode": itemCode,
        "ItemName": itemName,
        "CodeBars": codeBars,
      });


}
