import 'package:coffee_shop_app/core/data/remote_storage/coffees/coffees_model.dart';
import 'package:coffee_shop_app/features/auth/presentation/screens/auth_screen.dart';
import 'package:coffee_shop_app/features/cart/presentation/screens/cart_edit_screen.dart';
import 'package:coffee_shop_app/features/cart/presentation/screens/cart_screen.dart';
import 'package:coffee_shop_app/features/favorites/presentation/screens/favorites_screen.dart';
import 'package:coffee_shop_app/features/home/presentation/screens/coffee_detail_screen.dart';
import 'package:coffee_shop_app/features/home/presentation/screens/home_screen.dart';
import 'package:coffee_shop_app/features/profile/presentation/profile_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case '/auth':
        return MaterialPageRoute(builder: (_) => AuthScreen());
      case '/cart':
        return MaterialPageRoute(builder: (_) => CartPaymentScreen());
      case '/cart/edit':
        return MaterialPageRoute(builder: (_) => CartEditScreen());
      case '/favorites':
        return MaterialPageRoute(builder: (_) => FavotiresScreen());
      case '/profile':
        return MaterialPageRoute(builder: (_) => ProfileScreen());
      case '/detail':
        final coffee = settings.arguments as Coffee;
        return MaterialPageRoute(
            builder: (_) => CoffeeDetailScreen(coffee: coffee));
      default:
        return MaterialPageRoute(builder: (_) => HomeScreen());
    }
  }
}
