import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_shop_app/core/data/remote_storage/coffees/coffees_model.dart';

class CoffeeRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Coffee>> getCoffees() async {
    try {
      QuerySnapshot snapshot = await _firestore.collection('coffees').get();
      return snapshot.docs
          .map(
              (doc) => Coffee.fromFirestore(doc.data() as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw Exception("Error when receiving coffee cards: $e");
    }
  }
}
