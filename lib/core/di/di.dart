import 'package:coffee_shop_app/core/data/api_client/firebase/firebase_api_client_repository.dart';
import 'package:coffee_shop_app/core/data/api_client/firebase/firebase_user_service.dart';
import 'package:coffee_shop_app/core/data/remote_storage/categories/categories_repository.dart';
import 'package:coffee_shop_app/core/data/remote_storage/coffees/coffees_repository.dart';
import 'package:coffee_shop_app/core/presentation/bottom_bloc/bottom_menu_bloc.dart';
import 'package:coffee_shop_app/features/auth/data/user_repository_impl.dart';
import 'package:coffee_shop_app/features/auth/presentation/bloc/user_bloc.dart';
import 'package:coffee_shop_app/features/cart/presentation/blocs/cart_bloc/cart_bloc.dart';
import 'package:coffee_shop_app/features/home/presentation/blocs/category_bloc/category_bloc.dart';
import 'package:coffee_shop_app/features/home/presentation/blocs/coffee_bloc/coffee_bloc.dart';
import 'package:coffee_shop_app/features/home/presentation/blocs/detail_bloc/detail_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final getIt = GetIt.instance;

void setupDi() {
  // firebase и внешние сервисы
  getIt.registerSingleton<FirebaseAuth>(FirebaseAuth.instance);
  getIt.registerSingleton<FirebaseFirestore>(FirebaseFirestore.instance);

  // репозитории и сервисы
  getIt.registerLazySingleton<FirebaseApiClientRepository>(
      () => FirebaseApiClientRepository(
            getIt<FirebaseAuth>(),
            getIt<FirebaseFirestore>(),
          ));
  getIt.registerLazySingleton<FirebaseUserService>(
      () => FirebaseUserService(getIt<FirebaseApiClientRepository>()));
  getIt.registerLazySingleton<UserRepositoryImpl>(
      () => UserRepositoryImpl(getIt<FirebaseUserService>()));
  getIt.registerLazySingleton<CategoriesRepository>(
      () => CategoriesRepository());
  getIt.registerLazySingleton<CoffeeRepository>(() => CoffeeRepository());

  // bloc
  getIt.registerFactory<UserBloc>(() => UserBloc(getIt<UserRepositoryImpl>()));
  getIt.registerFactory<CategoryBloc>(
      () => CategoryBloc(getIt<CategoriesRepository>()));
  getIt
      .registerFactory<CoffeeBloc>(() => CoffeeBloc(getIt<CoffeeRepository>()));
  getIt.registerFactory<BottomMenuBloc>(() => BottomMenuBloc());
  getIt.registerFactory<CoffeeDetailBloc>(() => CoffeeDetailBloc());
  getIt.registerFactory<CartBloc>(() => CartBloc());
}
