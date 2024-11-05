import 'package:flutter_dotenv/flutter_dotenv.dart';

String? app_name = dotenv.env['app_name'];

class Coffee {
  final String name;
  final String image;
  final String category;
  final num? smallPrice;
  final num? mediumPrice;
  final num? largePrice;

  Coffee({
    required this.name,
    required this.image,
    required this.category,
    this.smallPrice,
    this.mediumPrice,
    this.largePrice,
  });

  factory Coffee.fromFirestore(Map<String, dynamic> data) {
    return Coffee(
      name: data['name'] as String,
      image: data['image'] as String,
      category: data['category'] as String,
      smallPrice: (data['smallPrice'] as num?) ?? 4.95,
      mediumPrice: (data['mediumPrice'] as num?) ?? 5.95,
      largePrice: (data['largePrice'] as num?) ?? 6.5,
    );
  }

  String get imageUrl {
    return "https://firebasestorage.googleapis.com/v0/b/${app_name}.appspot.com/o/assets%2Fcoffees%2F${Uri.encodeComponent(image)}?alt=media";
  }
}
