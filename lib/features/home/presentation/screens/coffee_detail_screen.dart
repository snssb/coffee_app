import 'package:coffee_shop_app/core/data/remote_storage/coffees/coffees_model.dart';
import 'package:coffee_shop_app/core/presentation/widgets/top_search_widget.dart';
import 'package:coffee_shop_app/features/cart/data/cart_model.dart';
import 'package:coffee_shop_app/features/cart/presentation/blocs/cart_bloc/cart_bloc.dart';
import 'package:coffee_shop_app/features/cart/presentation/blocs/cart_bloc/cart_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CoffeeDetailScreen extends StatefulWidget {
  final Coffee coffee;

  const CoffeeDetailScreen({Key? key, required this.coffee}) : super(key: key);

  @override
  State<CoffeeDetailScreen> createState() => _CoffeeDetailScreenState();
}

class _CoffeeDetailScreenState extends State<CoffeeDetailScreen> {
  final _buttonLabels = ['250', '350', '450'];
  final _coffeeCupSize = [18.0, 19.0, 20.0];
  int _valueOrder = 1;
  int _selectedCoffeeIndex = 0;
  Color brightMilk = Color.fromARGB(255, 238, 220, 198);
  Color grey = const Color.fromARGB(255, 174, 174, 174);
  late Coffee coffee;

  @override
  void initState() {
    super.initState();
    coffee = widget.coffee;
  }

  @override
  Widget build(BuildContext context) {
    num? selectedPrice;
    switch (_selectedCoffeeIndex) {
      case 0:
        selectedPrice = coffee.smallPrice;
        break;
      case 1:
        selectedPrice = coffee.mediumPrice;
        break;
      case 2:
        selectedPrice = coffee.largePrice;
        break;
      default:
        selectedPrice = coffee.smallPrice;
    }

    return SafeArea(
      child: Scaffold(
        body: Container(
          color: brightMilk,
          child: Column(
            children: [
              TopMenuWidget(),
              Expanded(
                child: Stack(
                  children: [
                    Container(
                      height: 240,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                              "assets/images/cappucino_latte_vb.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: 490,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 35, 12, 2),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30.0),
                            topRight: Radius.circular(30.0),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 29, top: 35, right: 29),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      coffee.category,
                                      style: GoogleFonts.josefinSans(
                                        textStyle: TextStyle(
                                          color: brightMilk,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 36,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const Icon(
                                    Icons.favorite,
                                    color: Color.fromARGB(255, 255, 245, 233),
                                    size: 30,
                                  ),
                                  const SizedBox(width: 23),
                                  const Icon(
                                    Icons.share_outlined,
                                    color: Color.fromARGB(255, 150, 114, 89),
                                    size: 28,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      coffee.name,
                                      style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                          color: brightMilk,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      'Complex, yet smooth flavor made to order.',
                                      style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                          color: brightMilk,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 15),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.star_rate_rounded,
                                    color: Color.fromARGB(255, 242, 153, 74),
                                    size: 25,
                                  ),
                                  Text(
                                    '4.5',
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                        color:
                                            Color.fromARGB(255, 242, 153, 74),
                                        fontWeight: FontWeight.w700,
                                        fontSize: 17,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Text(
                                    '(10k)',
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                        color:
                                            Color.fromARGB(255, 224, 220, 220),
                                        fontWeight: FontWeight.w400,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 26),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Size',
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                        color: brightMilk,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 7),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: List.generate(
                                      _buttonLabels.length,
                                      (index) => OutlinedButton(
                                        style: OutlinedButton.styleFrom(
                                          backgroundColor: const Color.fromARGB(
                                              255, 59, 44, 38),
                                          side: _selectedCoffeeIndex == index
                                              ? BorderSide(
                                                  color: brightMilk,
                                                  width: 1,
                                                )
                                              : BorderSide.none,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(6),
                                          ),
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            _selectedCoffeeIndex = index;
                                          });
                                        },
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            SvgPicture.asset(
                                              'assets/images/coffee_cup.svg',
                                              width: _coffeeCupSize[index],
                                              height: _coffeeCupSize[index],
                                              color:
                                                  _selectedCoffeeIndex == index
                                                      ? brightMilk
                                                      : grey,
                                            ),
                                            const SizedBox(width: 6),
                                            Text(
                                              _buttonLabels[index],
                                              style: GoogleFonts.poppins(
                                                textStyle: TextStyle(
                                                  color: _selectedCoffeeIndex ==
                                                          index
                                                      ? brightMilk
                                                      : grey,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 25),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "£${(selectedPrice! * _valueOrder).toStringAsFixed(2)}",
                                  style: GoogleFonts.josefinSans(
                                    textStyle: TextStyle(
                                      color: brightMilk,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 32,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 25),
                              Row(
                                children: [
                                  Container(
                                    height: 48,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: brightMilk, width: 2),
                                      borderRadius: BorderRadius.circular(40),
                                    ),
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
                                            setState(() {
                                              if (_valueOrder > 1)
                                                _valueOrder--;
                                            });
                                          },
                                          child: Text(
                                            '-',
                                            style: GoogleFonts.poppins(
                                              textStyle: TextStyle(
                                                color: brightMilk,
                                                fontWeight: FontWeight.w400,
                                                fontSize: 14,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 5),
                                          child: Text(
                                            '$_valueOrder',
                                            style: GoogleFonts.poppins(
                                              textStyle: TextStyle(
                                                color: brightMilk,
                                                fontWeight: FontWeight.w400,
                                                fontSize: 14,
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
                                              _valueOrder++;
                                            });
                                          },
                                          child: Text(
                                            '+',
                                            style: GoogleFonts.poppins(
                                              textStyle: TextStyle(
                                                color: brightMilk,
                                                fontWeight: FontWeight.w400,
                                                fontSize: 14,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  TextButton(
                                    style: TextButton.styleFrom(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 45, vertical: 12),
                                      backgroundColor: brightMilk,
                                    ),
                                    onPressed: () {
                                      context.read<CartBloc>().add(
                                            AddToCart(
                                                cartItem: CartItem(
                                                    coffee: coffee,
                                                    quantity: _valueOrder,
                                                    size: _buttonLabels[
                                                        _selectedCoffeeIndex],
                                                    price: selectedPrice!)),
                                          );
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content: Text('Added to cart'),
                                          duration: Duration(seconds: 1),
                                        ),
                                      );
                                    },
                                    child: Text(
                                      'ADD TO CART',
                                      style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                          color: const Color.fromARGB(
                                              255, 51, 34, 21),
                                          fontWeight: FontWeight.w700,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
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
    );
  }
}
