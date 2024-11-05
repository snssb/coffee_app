import 'package:coffee_shop_app/core/data/local_storage/session_manager.dart';
import 'package:coffee_shop_app/core/data/local_storage/user_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:coffee_shop_app/features/auth/presentation/bloc/user_bloc.dart';
import 'package:coffee_shop_app/features/auth/presentation/bloc/user_event.dart';

class TopMenuWidget extends StatefulWidget {
  const TopMenuWidget({Key? key}) : super(key: key);

  @override
  State<TopMenuWidget> createState() => _TopMenuWidgetState();
}

class _TopMenuWidgetState extends State<TopMenuWidget> {
  String name = '';

  @override
  void initState() {
    super.initState();
    getName();
  }

  void getName() async {
    name = await UserPreferences.loadName();
    setState(() {});
  }

  void menuFunc(String value, BuildContext parentContext) async {
    if (value == 'logout') {
      parentContext.read<UserBloc>().add(LogoutUser());
      await SessionManager.setSession(false);
      Navigator.pushNamed(parentContext, '/auth');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 20, right: 30, bottom: 15),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: "Good day, $name",
                hintStyle: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                    color: Color.fromARGB(255, 35, 12, 2),
                    fontWeight: FontWeight.normal,
                    fontSize: 16,
                  ),
                ),
                border: InputBorder.none,
                isCollapsed: true,
                prefixIconConstraints:
                    const BoxConstraints(minWidth: 42, maxHeight: 42),
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Badge(
              backgroundColor: Color.fromARGB(255, 251, 69, 45),
              child: Icon(Icons.notifications_sharp),
            ),
          ),
          PopupMenuButton<String>(
            onSelected: (value) => menuFunc(value, context),
            itemBuilder: (BuildContext context) => [
              PopupMenuItem<String>(
                value: 'logout',
                child: Text(
                  'Logout',
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                      color: Color.fromARGB(255, 35, 12, 2),
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ],
            icon: const Icon(Icons.menu),
          ),
        ],
      ),
    );
  }
}
