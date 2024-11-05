import 'package:coffee_shop_app/core/data/local_storage/session_manager.dart';
import 'package:coffee_shop_app/core/di/di.dart';
import 'package:coffee_shop_app/core/presentation/bottom_bloc/bottom_menu_bloc.dart';
import 'package:coffee_shop_app/features/auth/presentation/bloc/user_bloc.dart';
import 'package:coffee_shop_app/features/cart/presentation/blocs/cart_bloc/cart_bloc.dart';
import 'package:coffee_shop_app/features/home/presentation/blocs/category_bloc/category_bloc.dart';
import 'package:coffee_shop_app/features/home/presentation/blocs/coffee_bloc/coffee_bloc.dart';
import 'package:coffee_shop_app/features/home/presentation/blocs/detail_bloc/detail_bloc.dart';
import 'package:coffee_shop_app/my_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await dotenv.load(fileName: "assets/.env");

  final isAuthenticated = await SessionManager.getSession();
  final app = MyApp(isAuthenticated: isAuthenticated);

  setupDi();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<UserBloc>(create: (context) => getIt<UserBloc>()),
        BlocProvider<BottomMenuBloc>(
            create: (context) => getIt<BottomMenuBloc>()),
        BlocProvider<CategoryBloc>(create: (context) => getIt<CategoryBloc>()),
        BlocProvider<CoffeeBloc>(create: (context) => getIt<CoffeeBloc>()),
        BlocProvider<CoffeeDetailBloc>(
            create: (context) => getIt<CoffeeDetailBloc>()),
        BlocProvider<CartBloc>(create: (context) => getIt<CartBloc>()),
      ],
      child: app,
    ),
  );
}
