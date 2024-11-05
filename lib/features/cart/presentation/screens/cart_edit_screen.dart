import 'package:coffee_shop_app/core/presentation/widgets/bottom_menu_widget.dart';
import 'package:coffee_shop_app/core/presentation/widgets/top_search_widget.dart';
import 'package:coffee_shop_app/features/cart/presentation/blocs/cart_bloc/cart_bloc.dart';
import 'package:coffee_shop_app/features/cart/presentation/blocs/cart_bloc/cart_event.dart';
import 'package:coffee_shop_app/features/cart/presentation/blocs/cart_bloc/cart_state.dart';
import 'package:coffee_shop_app/features/cart/presentation/screens/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class CartEditScreen extends StatefulWidget {
  const CartEditScreen({super.key});

  @override
  State<CartEditScreen> createState() => _CartEditScreenState();
}

class _CartEditScreenState extends State<CartEditScreen> {
  TextStyle pmcStyle = GoogleFonts.poppins(
    textStyle: const TextStyle(
      color: Color.fromARGB(255, 35, 12, 2),
      fontWeight: FontWeight.w600,
      fontSize: 28,
    ),
  );

  Color bright_milk = Color.fromARGB(255, 238, 220, 198);
  Color grey = const Color.fromARGB(255, 174, 174, 174);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 238, 220, 198),
          ),
          child: Column(
            children: [
              // TopMenuWidget ############################################
              TopMenuWidget(),
              Container(
                padding: const EdgeInsets.only(left: 32),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Cart edit',
                        style: GoogleFonts.josefinSans(
                          textStyle: const TextStyle(
                            color: Color.fromARGB(255, 35, 12, 2),
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            height: 0,
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              Text('+', style: pmcStyle),
                              const SizedBox(width: 10),
                              Text('-', style: pmcStyle),
                              const SizedBox(width: 10),
                              Text('x', style: pmcStyle),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 15),
              Expanded(
                child: SizedBox(
                  height: double.infinity,
                  child: Container(
                    padding: const EdgeInsets.only(top: 20, bottom: 15),
                    height: 510,
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 35, 12, 2)),
                    child: buildCartItems(),
                  ),
                ),
              ),
              //BottomMenuWidget ############################################
              BottomMenuWidget(),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 110, vertical: 60),
          child: SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: Navigator.of(context).pop,
              child: Text(
                'Back to cart',
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                    color: black,
                    fontWeight: FontWeight.w700,
                    fontSize: 13,
                    height: 0,
                  ),
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 223, 236, 185),
                padding: EdgeInsets.symmetric(vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  BlocBuilder<CartBloc, CartState> buildCartItems() {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        if (state is CartLoaded) {
          final cartItems = state.cart.items;
          return ListView.builder(
            itemCount: cartItems.length,
            itemBuilder: (context, index) {
              var item = cartItems[index];
              final _value_order = item.quantity;
              return Padding(
                padding: const EdgeInsets.only(
                    left: 15, top: 9, right: 26, bottom: 8),
                child: SizedBox(
                  height: 104,
                  child: Card(
                    color: const Color.fromARGB(255, 255, 245, 233),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 100,
                          width: 70,
                          margin: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(8),
                            ),
                            image: DecorationImage(
                              image: AssetImage(
                                "assets/images/${item.coffee.image}",
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            child: Container(
                              width: 300,
                              child: Stack(
                                children: [
                                  Positioned(
                                    bottom: 0,
                                    top: 0,
                                    left: 0,
                                    right: 0,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(height: 9),
                                        Row(
                                          children: [
                                            Text(
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 2,
                                              item.coffee.name.toUpperCase(),
                                              style: GoogleFonts.poppins(
                                                textStyle: const TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 35, 12, 2),
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 16,
                                                  height: 1,
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: SizedBox(
                                                width: double.maxFinite,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    left: 0,
                                    right: 0,
                                    child: Row(
                                      children: [
                                        TextButton(
                                          style: TextButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(68.0),
                                            ),
                                            padding: const EdgeInsets.only(
                                              left: 17,
                                              right: 10,
                                              top: 6,
                                              bottom: 6,
                                            ),
                                            minimumSize: Size.zero,
                                          ),
                                          onPressed: () {
                                            if (_value_order > 1) {
                                              setState(() {
                                                context.read<CartBloc>().add(
                                                      UpdateQuantity(item,
                                                          _value_order - 1),
                                                    );
                                              });
                                            }
                                          },
                                          child: Text(
                                            '-',
                                            style: GoogleFonts.poppins(
                                              textStyle: TextStyle(
                                                color: black,
                                                fontWeight: FontWeight.w400,
                                                fontSize: 14,
                                                height: 0,
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 28,
                                          child: Text(
                                            textAlign: TextAlign.center,
                                            "$_value_order",
                                            style: GoogleFonts.poppins(
                                              textStyle: TextStyle(
                                                color: black,
                                                fontWeight: FontWeight.w400,
                                                fontSize: 14,
                                                height: 0,
                                              ),
                                            ),
                                          ),
                                        ),
                                        TextButton(
                                          style: TextButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(68.0),
                                            ),
                                            padding: const EdgeInsets.only(
                                              left: 10,
                                              right: 17,
                                              top: 6,
                                              bottom: 6,
                                            ),
                                            minimumSize: Size.zero,
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              context.read<CartBloc>().add(
                                                    UpdateQuantity(
                                                        item, _value_order + 1),
                                                  );
                                            });
                                          },
                                          child: Text(
                                            '+',
                                            style: GoogleFonts.poppins(
                                              textStyle: TextStyle(
                                                color: black,
                                                fontWeight: FontWeight.w400,
                                                fontSize: 14,
                                                height: 0,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 35,
                          width: 35,
                          child: IconButton(
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(),
                            onPressed: () {
                              context
                                  .read<CartBloc>()
                                  .add(RemoveFromCart(item));
                            },
                            icon: Icon(Icons.cancel_outlined),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        } else if (state is CartInitial) {
          return Center(
              child: Text(
            'Cart is empty',
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                color: const Color.fromARGB(255, 160, 160, 160),
                fontWeight: FontWeight.w400,
                fontSize: 15,
                height: 0,
              ),
            ),
          ));
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
