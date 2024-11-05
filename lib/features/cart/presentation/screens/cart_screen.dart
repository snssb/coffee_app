import 'package:coffee_shop_app/core/presentation/widgets/bottom_menu_widget.dart';
import 'package:coffee_shop_app/core/presentation/widgets/top_search_widget.dart';
import 'package:coffee_shop_app/features/cart/presentation/blocs/cart_bloc/cart_bloc.dart';
import 'package:coffee_shop_app/features/cart/presentation/blocs/cart_bloc/cart_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class CartPaymentScreen extends StatefulWidget {
  const CartPaymentScreen({super.key});

  @override
  State<CartPaymentScreen> createState() => _CartPaymentScreenState();
}

const Color black = Color.fromARGB(255, 35, 12, 2);
const Color white_milk = Color.fromARGB(255, 238, 220, 198);

class _CartPaymentScreenState extends State<CartPaymentScreen> {
  bool isRecentlySelected = true;
  final Color selectedColor = Color.fromARGB(255, 35, 12, 2);
  final Color normalColor = Color.fromARGB(255, 238, 220, 198);

  String address = '';
  bool isEditing = false;
  TextEditingController addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 238, 220, 198),
          ),
          child: Column(
            children: [
              TopMenuWidget(),
              Padding(
                padding: const EdgeInsets.only(
                    top: 0, left: 32, right: 32, bottom: 15),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Cart',
                        style: GoogleFonts.josefinSans(
                          textStyle: const TextStyle(
                            color: Color.fromARGB(255, 35, 12, 2),
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            height: 0,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 13),
                    Row(
                      children: [
                        SvgPicture.asset(
                          'assets/images/shopping_cart_icon.svg',
                          width: 24,
                          height: 24,
                        ),
                        Expanded(child: SizedBox()),
                        Container(
                          width: 165,
                          height: 25,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            border: Border.all(color: selectedColor, width: 1),
                            borderRadius: BorderRadius.all(
                              Radius.circular(8.0),
                            ),
                          ),
                          child: Stack(
                            children: [
                              Align(
                                alignment: isRecentlySelected
                                    ? Alignment(-1, 0)
                                    : Alignment(1, 0),
                                child: Container(
                                  width: 165 * 0.5,
                                  height: 25,
                                  decoration: BoxDecoration(
                                    color: selectedColor,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(8.0),
                                    ),
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () {
                                        print(1);
                                        setState(() {
                                          isRecentlySelected = true;
                                        });
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(8.0),
                                          ),
                                        ),
                                        child: Text(
                                          'Recently',
                                          style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                              color: isRecentlySelected
                                                  ? normalColor
                                                  : selectedColor,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 11,
                                              height: 1,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () {
                                        print(2);
                                        setState(() {
                                          isRecentlySelected = false;
                                        });
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(8.0),
                                          ),
                                        ),
                                        child: Text(
                                          'Past Orders',
                                          style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                              color: isRecentlySelected
                                                  ? selectedColor
                                                  : normalColor,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 11,
                                              height: 1,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 9, top: 0, bottom: 9, right: 9),
                child: Container(
                  // height: 185,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 255, 245, 233),
                    borderRadius: BorderRadius.all(
                      Radius.circular(6.0),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 13, right: 13, top: 10, bottom: 1),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Transform.rotate(
                              angle: 0.8,
                              child: Icon(
                                Icons.navigation_rounded,
                                color: Color.fromARGB(255, 255, 212, 102),
                              ),
                            ),
                            const SizedBox(width: 6),
                            Text(
                              'Closest cafe:',
                              style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                  color: Color.fromARGB(255, 35, 12, 2),
                                  fontWeight: FontWeight.w700,
                                  fontSize: 15,
                                  height: 0,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Co/Choc Tebet (1.5 km)',
                          style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                              color: Color.fromARGB(255, 35, 12, 2),
                              fontWeight: FontWeight.w400,
                              fontSize: 13,
                              height: 0,
                            ),
                          ),
                        ),
                        SizedBox(height: 4),
                        Container(
                          width: 260,
                          child: Text(
                            'Jl. Santuy no. 41, Tebet Barat, Tebet, Jakarta Selatan',
                            style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                color: Color.fromARGB(255, 35, 12, 2),
                                fontWeight: FontWeight.w400,
                                fontSize: 13,
                                height: 0,
                              ),
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        SizedBox(height: 7),
                        Divider(
                          height: 1,
                          color: Color.fromARGB(255, 35, 12, 2),
                        ),
                        SizedBox(height: 7),
                        Row(
                          children: [
                            SvgPicture.asset(
                                'assets/images/map_marker_icon.svg'),
                            const SizedBox(width: 15),
                            Text(
                              'Deliver to:',
                              style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                  color: Color.fromARGB(255, 35, 12, 2),
                                  fontWeight: FontWeight.w700,
                                  fontSize: 15,
                                  height: 0,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (isEditing)
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextField(
                                    controller: addressController,
                                    decoration: InputDecoration(
                                      labelText: 'Enter Address',
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Align(
                                    alignment: Alignment.center,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        backgroundColor:
                                            Color.fromARGB(255, 23, 12, 2),
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          address = addressController.text;
                                          isEditing = false;
                                        });
                                      },
                                      child: Text(
                                        'Save Address',
                                        style: GoogleFonts.poppins(
                                          textStyle: const TextStyle(
                                            color: white_milk,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 13,
                                            height: 0,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            else
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      address.isNotEmpty
                                          ? address
                                          : 'No saved address',
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      setState(() {
                                        isEditing = true;
                                        addressController.text = address;
                                      });
                                    },
                                    child: Text(
                                      'Edit',
                                      style: GoogleFonts.poppins(
                                        textStyle: const TextStyle(
                                          color: black,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 13,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 9, top: 0, bottom: 1, right: 9),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(
                      Radius.circular(6.0),
                    ),
                    child: SingleChildScrollView(
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 255, 245, 233),
                          borderRadius: BorderRadius.all(
                            Radius.circular(6.0),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 15, top: 10, right: 15, bottom: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Your order:',
                                style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                    color: black,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16,
                                    height: 0,
                                  ),
                                ),
                              ),
                              Row(
                                //mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: BlocBuilder<CartBloc, CartState>(
                                      builder: (context, state) {
                                        if (state is CartLoaded) {
                                          final cartItems = state.cart.items;
                                          return SingleChildScrollView(
                                            scrollDirection: Axis.horizontal,
                                            child: Row(
                                              children: cartItems.map((item) {
                                                return Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Colors.grey),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                    ),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(7),
                                                          child: Image.asset(
                                                            'assets/images/${item.coffee.image}',
                                                            width: 50,
                                                            height: 50,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                            width: 8),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                                  right: 8,
                                                                  top: 4),
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            children: [
                                                              Text(
                                                                '${item.quantity}x',
                                                                style:
                                                                    GoogleFonts
                                                                        .poppins(
                                                                  textStyle:
                                                                      const TextStyle(
                                                                    color: Colors
                                                                        .black,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    fontSize:
                                                                        14,
                                                                  ),
                                                                ),
                                                              ),
                                                              Text(
                                                                '£${item.totalItemPrice.toStringAsFixed(2)}',
                                                                style:
                                                                    GoogleFonts
                                                                        .poppins(
                                                                  textStyle:
                                                                      const TextStyle(
                                                                    color: Colors
                                                                        .black,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontSize:
                                                                        14,
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              }).toList(),
                                            ),
                                          );
                                        } else if (state is CartInitial) {
                                          return const Center(
                                              child: Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              'Cart is empty',
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                              style: TextStyle(fontSize: 16),
                                            ),
                                          ));
                                        } else {
                                          return const Center(
                                              child:
                                                  CircularProgressIndicator());
                                        }
                                      },
                                    ),
                                  ),
                                  TextButton(
                                    style: TextButton.styleFrom(
                                      minimumSize: const Size(0, 0),
                                    ),
                                    onPressed: () {
                                      Navigator.of(context)
                                          .pushNamed('/cart/edit');
                                    },
                                    child: Text(
                                      'Edit',
                                      style: GoogleFonts.poppins(
                                        textStyle: const TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 13,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 8),
                              Divider(
                                height: 1,
                                color: Color.fromARGB(255, 35, 12, 2),
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Other drinks we recommend',
                                    style: GoogleFonts.poppins(
                                      textStyle: const TextStyle(
                                        color: black,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 13,
                                      ),
                                    ),
                                  ),
                                  Expanded(child: SizedBox()),
                                  TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      'See all',
                                      style: GoogleFonts.poppins(
                                        textStyle: const TextStyle(
                                          color: black,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(height: 5),
                              Row(
                                children: [
                                  Container(
                                    width: 164,
                                    height: 85,
                                    child: GestureDetector(
                                      onTap: () {},
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8)),
                                        child: Stack(
                                          fit: StackFit.expand,
                                          children: [
                                            Image.asset(
                                              'assets/images/iced_yin_and_yang_cart_rec.png',
                                              fit: BoxFit.cover,
                                            ),
                                            Container(
                                              color:
                                                  Colors.black.withOpacity(0.3),
                                            ),
                                            Positioned(
                                                bottom: 10,
                                                left: 10,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'ICED YIN & YANG',
                                                      style:
                                                          GoogleFonts.poppins(
                                                        textStyle:
                                                            const TextStyle(
                                                          color: Color.fromARGB(
                                                              255,
                                                              255,
                                                              245,
                                                              233),
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: 11,
                                                        ),
                                                      ),
                                                    ),
                                                    Text(
                                                      '£4.95',
                                                      style:
                                                          GoogleFonts.poppins(
                                                        textStyle:
                                                            const TextStyle(
                                                          color: Color.fromARGB(
                                                              255,
                                                              255,
                                                              245,
                                                              233),
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 14,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ))
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 16),
                                  Container(
                                    width: 164,
                                    height: 85,
                                    child: GestureDetector(
                                      onTap: () {},
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8)),
                                        child: Stack(
                                          fit: StackFit.expand,
                                          children: [
                                            Image.asset(
                                              'assets/images/iced_chocolate_cart_rec.png',
                                              fit: BoxFit.cover,
                                            ),
                                            Container(
                                              color:
                                                  Colors.black.withOpacity(0.3),
                                            ),
                                            Positioned(
                                                bottom: 10,
                                                left: 10,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'ICED CHOCOLATE',
                                                      style:
                                                          GoogleFonts.poppins(
                                                        textStyle:
                                                            const TextStyle(
                                                          color: Color.fromARGB(
                                                              255,
                                                              255,
                                                              245,
                                                              233),
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: 11,
                                                        ),
                                                      ),
                                                    ),
                                                    Text(
                                                      '£6.95',
                                                      style:
                                                          GoogleFonts.poppins(
                                                        textStyle:
                                                            const TextStyle(
                                                          color: Color.fromARGB(
                                                              255,
                                                              255,
                                                              245,
                                                              233),
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 14,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ))
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 9),
                              Row(
                                children: [
                                  Text(
                                    'Subtotal',
                                    style: GoogleFonts.poppins(
                                      textStyle: const TextStyle(
                                        color: black,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                  Expanded(child: SizedBox()),
                                  Text(
                                    '£4.95',
                                    style: GoogleFonts.poppins(
                                      textStyle: const TextStyle(
                                        color: black,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 8),
                              Row(
                                children: [
                                  Text(
                                    'Delivery fee',
                                    style: GoogleFonts.poppins(
                                      textStyle: const TextStyle(
                                        color: black,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                  Expanded(child: SizedBox()),
                                  Text(
                                    '£1.95',
                                    style: GoogleFonts.poppins(
                                      textStyle: const TextStyle(
                                        color: black,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 8),
                              Row(
                                children: [
                                  Text(
                                    'Packaging fee',
                                    style: GoogleFonts.poppins(
                                      textStyle: const TextStyle(
                                        color: black,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                  Expanded(child: SizedBox()),
                                  Text(
                                    '£2.95',
                                    style: GoogleFonts.poppins(
                                      textStyle: const TextStyle(
                                        color: black,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 8),
                              Row(
                                children: [
                                  Text(
                                    'Promo',
                                    style: GoogleFonts.poppins(
                                      textStyle: const TextStyle(
                                        color: black,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                  Expanded(child: SizedBox()),
                                  Text(
                                    '0',
                                    style: GoogleFonts.poppins(
                                      textStyle: const TextStyle(
                                        color: black,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 8),
                              Row(
                                children: [
                                  Text(
                                    'TOTAL',
                                    style: GoogleFonts.poppins(
                                      textStyle: const TextStyle(
                                        color: black,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                  Expanded(child: SizedBox()),
                                  BlocSelector<CartBloc, CartState, num>(
                                    selector: (state) {
                                      if (state is CartLoaded) {
                                        return state.totalPrice;
                                      }
                                      return 0; // значение по умолчанию, если состояние не CartLoaded
                                    },
                                    builder: (context, totalPrice) {
                                      return Text(
                                        '£${totalPrice.toStringAsFixed(2)}',
                                        style: GoogleFonts.poppins(
                                          textStyle: const TextStyle(
                                            color: black,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 14,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              //Expanded(child: BottomMenuWidget()),
              BottomMenuWidget(),
            ],
          ),
        ),
        resizeToAvoidBottomInset: false,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 110, vertical: 60),
          child: SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              child: Text(
                'Proceed to Payment',
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                    color: white_milk,
                    fontWeight: FontWeight.w700,
                    fontSize: 13,
                    height: 0,
                  ),
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: black,
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
}
