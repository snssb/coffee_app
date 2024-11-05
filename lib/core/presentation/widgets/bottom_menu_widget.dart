import 'package:coffee_shop_app/core/presentation/bottom_bloc/bottom_menu_bloc.dart';
import 'package:coffee_shop_app/core/presentation/bottom_bloc/bottom_menu_event.dart';
import 'package:coffee_shop_app/core/presentation/bottom_bloc/bottom_menu_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomMenuWidget extends StatelessWidget {
  BottomMenuWidget({super.key});

  final List<dynamic> bottomBarIcons = [
    'assets/images/home_icon.svg',
    'assets/images/shopping_cart_icon.svg',
    Icons.favorite_border_outlined,
    'assets/images/user_icon.svg',
  ];

  final List<String> routes = [
    '/', // Главный экран
    '/cart', // Корзина
    '/favorites', // Избранное
    '/profile', // Профиль
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomMenuBloc, BottomMenuState>(
      builder: (context, state) {
        return Container(
          height: 57,
          child: Column(
            children: [
              const Divider(
                  height: 1, color: Color.fromARGB(255, 238, 220, 198)),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Container(
                  color: const Color.fromARGB(255, 238, 220, 198),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(bottomBarIcons.length, (index) {
                      return Column(
                        children: [
                          state.selectedIndex == index
                              ? Container(
                                  height: 5,
                                  width: 42,
                                  decoration: BoxDecoration(
                                    color: const Color.fromARGB(255, 35, 12, 2),
                                    border: Border.all(
                                      color:
                                          const Color.fromARGB(255, 35, 12, 2),
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      bottomLeft: Radius.elliptical(45, 40),
                                      bottomRight: Radius.elliptical(45, 40),
                                    ),
                                  ),
                                )
                              : Container(height: 5),
                          InkWell(
                            onTap: () {
                              context
                                  .read<BottomMenuBloc>()
                                  .add(SelectBottomMenuItem(index));
                              Navigator.pushNamed(context, routes[index]);
                            },
                            child: Container(
                              padding: EdgeInsets.only(top: 13),
                              child: index == 2
                                  ? Icon(bottomBarIcons[index], size: 25)
                                  : SvgPicture.asset(bottomBarIcons[index],
                                      width: 25, height: 25),
                            ),
                          ),
                        ],
                      );
                    }),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
