import 'package:coffee_shop_app/core/presentation/widgets/bottom_menu_widget.dart';
import 'package:coffee_shop_app/core/presentation/widgets/top_search_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FavotiresScreen extends StatefulWidget {
  const FavotiresScreen({super.key});

  @override
  State<FavotiresScreen> createState() => _FavotiresScreenState();
}

class _FavotiresScreenState extends State<FavotiresScreen> {
  final List<String> category = [
    'Popular',
    'Black coffee',
    'Winter special',
    'Decaff',
    '123',
    '123',
    '123',
  ];

  final List<Map<String, dynamic>> cardItems = [
    {
      'category': 'Black coffee',
      'title': 'Iced Americano',
      'image': 'iced_americano.png',
      'count': '1x',
      'date': '04/02',
      'likes': '240',
    },
    {
      'category': 'Winter special',
      'title': 'Cappucino Latte',
      'image': 'cappucino_latte.png',
      'count': '1x',
      'date': '04/02',
      'likes': '260',
    },
    {
      'category': 'Decaff',
      'title': 'Silky Cafe\nAu Lait',
      'image': 'silky_cafe_au_lait.png',
      'count': '1x',
      'date': '04/02',
      'likes': '50',
    },
    {
      'category': 'Chocolate',
      'title': 'Iced Chocolate',
      'image': 'iced_chocolate.png',
      'count': '1x',
      'date': '04/02',
      'likes': '100',
    },
    {
      'category': '123',
      'title': '123 321',
      'image': 'cappucino_latte.png',
      'count': '1x',
      'date': '04/02',
      'likes': '70',
    },
    {
      'category': '123',
      'title': '123 321',
      'image': 'cappucino_latte.png',
      'count': '1x',
      'date': '04/02',
      'likes': '55',
    },
  ];

  bool isRecentlySelected = false;
  final Color selectedColor = Color.fromARGB(255, 35, 12, 2);
  final Color normalColor = Color.fromARGB(255, 238, 220, 198);

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
              // const SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.only(
                    top: 0, left: 22, right: 32, bottom: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Favorites',
                      style: GoogleFonts.josefinSans(
                        textStyle: const TextStyle(
                          color: Color.fromARGB(255, 35, 12, 2),
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          height: 0,
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    Text(
                      'Your favorite drinks to lighten up your day',
                      style: GoogleFonts.josefinSans(
                        textStyle: const TextStyle(
                          color: Color.fromARGB(255, 133, 77, 30),
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          height: 0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: SizedBox(
                  height: double.infinity,
                  child: Container(
                    padding: const EdgeInsets.only(top: 20, bottom: 15),
                    height: 510,
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 35, 12, 2)),
                    child: ListView.builder(
                      itemCount: cardItems.length,
                      itemBuilder: (context, index) {
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
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 10),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                            cardItems[index]['category'],
                                            style: GoogleFonts.poppins(
                                              textStyle: const TextStyle(
                                                color: Color.fromARGB(
                                                    255, 35, 12, 2),
                                                fontWeight: FontWeight.w500,
                                                fontSize: 10,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 6),
                                          Text(
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                            cardItems[index]['title']
                                                .toUpperCase(),
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
                                              child: const SizedBox(height: 1)),
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.favorite,
                                                color: Colors.red,
                                                size: 20,
                                              ),
                                              SizedBox(width: 7),
                                              Text(
                                                cardItems[index]['likes'],
                                                overflow: TextOverflow.ellipsis,
                                                style: GoogleFonts.poppins(
                                                  textStyle: const TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 35, 12, 2),
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 11,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
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
                                          "assets/images/${cardItems[index]['image']}",
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
              //BottomMenuWidget ############################################
              BottomMenuWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
