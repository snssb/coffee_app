import 'package:coffee_shop_app/core/data/remote_storage/categories/categories_repository.dart';
import 'package:coffee_shop_app/features/home/presentation/blocs/category_bloc/category_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'category_event.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoriesRepository _categoriesRepository;

  CategoryBloc(this._categoriesRepository) : super(CategoryState()) {
    on<LoadCategories>((event, emit) async {
      if (state.categories.isNotEmpty) {
        emit(state);
        return;
      }
      emit(CategoryState(isLoading: true));
      try {
        final categories = await _categoriesRepository.getCategories();
        emit(CategoryState(categories: categories));
      } catch (e) {
        emit(CategoryState(error: e.toString()));
      }
    });
  }
}
