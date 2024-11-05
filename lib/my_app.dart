import 'package:coffee_shop_app/core/navigation/app_router.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  final isAuthenticated;

  const MyApp({Key? key, required this.isAuthenticated}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: AppRouter.generateRoute,
      initialRoute: isAuthenticated ? '/' : '/auth',
    );
  }
}
