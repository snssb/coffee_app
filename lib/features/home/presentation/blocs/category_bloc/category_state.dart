import 'package:coffee_shop_app/core/data/remote_storage/categories/category_model.dart';

class CategoryState {
  final bool isLoading;
  final List<Category> categories;
  final String? error;

  CategoryState(
      {this.isLoading = false, this.categories = const [], this.error});
}
