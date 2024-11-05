import 'package:cloud_firestore/cloud_firestore.dart';
import 'category_model.dart';

class CategoriesRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Category>> getCategories() async {
    try {
      // Получаем данные из коллекции 'categories'
      QuerySnapshot snapshot = await _firestore.collection('categories').get();

      // Преобразуем полученные документы в список категорий
      return snapshot.docs.map((doc) {
        return Category.fromFirestore(
            doc.data() as Map<String, dynamic>, doc.id);
      }).toList();
    } catch (e) {
      throw Exception("Error when getting categories: $e");
    }
  }
}
