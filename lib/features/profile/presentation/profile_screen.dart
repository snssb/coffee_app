import 'package:coffee_shop_app/core/data/local_storage/user_preferences.dart';
import 'package:coffee_shop_app/core/presentation/widgets/bottom_menu_widget.dart';
import 'package:coffee_shop_app/core/presentation/widgets/top_search_widget.dart';
import 'package:coffee_shop_app/features/cart/presentation/screens/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController nameController = TextEditingController();
  String savedName = '';

  TextStyle pmcStyle = GoogleFonts.poppins(
    textStyle: const TextStyle(
      color: Color.fromARGB(255, 35, 12, 2),
      fontWeight: FontWeight.w600,
      fontSize: 28,
    ),
  );

  Color brightMilk = const Color.fromARGB(255, 238, 220, 198);
  Color grey = const Color.fromARGB(255, 174, 174, 174);

  @override
  void initState() {
    super.initState();
    loadName();
  }

  Future<void> loadName() async {
    savedName = await UserPreferences.loadName();
    setState(() {
      nameController.text = savedName;
    });
  }

  Future<void> saveName() async {
    await UserPreferences.saveName(nameController.text);
    setState(() {
      savedName = nameController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          decoration: BoxDecoration(color: brightMilk),
          child: Column(
            children: [
              TopMenuWidget(),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: Container(
                    decoration: BoxDecoration(color: brightMilk),
                    child: Column(
                      children: [
                        TextField(
                          controller: nameController,
                          decoration: const InputDecoration(labelText: 'Name'),
                        ),
                        ElevatedButton(
                          onPressed: saveName,
                          child: Text(
                            'Save Name',
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
                            padding: EdgeInsets.all(10),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              BottomMenuWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
