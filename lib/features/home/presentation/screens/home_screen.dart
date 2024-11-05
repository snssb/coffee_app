import 'package:coffee_shop_app/core/data/remote_storage/coffees/coffees_model.dart';
import 'package:coffee_shop_app/core/presentation/widgets/bottom_menu_widget.dart';
import 'package:coffee_shop_app/core/presentation/widgets/top_search_widget.dart';
import 'package:coffee_shop_app/features/home/presentation/blocs/category_bloc/category_bloc.dart';
import 'package:coffee_shop_app/features/home/presentation/blocs/category_bloc/category_event.dart';
import 'package:coffee_shop_app/features/home/presentation/blocs/category_bloc/category_state.dart';
import 'package:coffee_shop_app/features/home/presentation/blocs/coffee_bloc/coffee_bloc.dart';
import 'package:coffee_shop_app/features/home/presentation/blocs/coffee_bloc/coffee_event.dart';
import 'package:coffee_shop_app/features/home/presentation/blocs/coffee_bloc/coffee_state.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    context.read<CategoryBloc>().add(LoadCategories());
    context.read<CoffeeBloc>().add(LoadCoffees());
  }

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
              TopMenuWidget(),
              _buildTitle(),
              _buildCategoryList(),
              const SizedBox(height: 25),
              _buildCoffeeCards(),
              BottomMenuWidget(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Container(
      padding: const EdgeInsets.only(left: 32),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          'What would you like\nto drink today?',
          style: GoogleFonts.josefinSans(
            textStyle: const TextStyle(
              color: Color.fromARGB(255, 35, 12, 2),
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryList() {
    return Padding(
      padding: const EdgeInsets.only(left: 30, top: 19),
      child: SizedBox(
        height: 44,
        child: BlocBuilder<CategoryBloc, CategoryState>(
          builder: (context, state) {
            if (state.isLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state.error != null) {
              return Center(child: Text('Error: ${state.error}'));
            } else if (state.categories.isEmpty) {
              return const Center(
                  child: Text('There are no available categories.'));
            }

            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.categories.length,
              itemBuilder: (context, index) {
                final isSelected = _selectedIndex == index;
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 1.0),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 9.5),
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          _selectedIndex = index;
                        });
                        final selectedCategory = state.categories[index].name;
                        context
                            .read<CoffeeBloc>()
                            .add(FilterCoffeesByCategory(selectedCategory));
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: isSelected
                            ? const Color.fromARGB(255, 35, 12, 2)
                            : Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(68.0),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 17),
                      ),
                      child: Text(
                        state.categories[index].name,
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            color: isSelected
                                ? Colors.white
                                : const Color.fromARGB(255, 35, 12, 2),
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }

  Widget _buildCoffeeCards() {
    return Expanded(
      child: Container(
        height: 500,
        decoration: const BoxDecoration(color: Color.fromARGB(255, 35, 12, 2)),
        child: BlocBuilder<CoffeeBloc, CoffeeState>(
          builder: (context, state) {
            if (state.isLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state.error != null) {
              return Center(child: Text('Error: ${state.error}'));
            } else if (state.filteredCoffees.isEmpty) {
              return Center(
                  child: Text(
                'There is no coffee for the selected category.',
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    color: const Color.fromARGB(255, 160, 160, 160),
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                    height: 0,
                  ),
                ),
              ));
            }

            return ListView.builder(
              itemCount: state.filteredCoffees.length,
              itemBuilder: (context, index) {
                final coffee = state.filteredCoffees[index];
                return _buildCoffeeCard(coffee);
              },
            );
          },
        ),
      ),
    );
  }

  Widget _buildCoffeeCard(Coffee coffee) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, top: 9, right: 26, bottom: 8),
      child: SizedBox(
        height: 104,
        child: Card(
          color: const Color.fromARGB(255, 255, 245, 233),
          child: InkWell(
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            onTap: () {
              Navigator.pushNamed(context, '/detail', arguments: coffee);
            },
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18, vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          coffee.category,
                          style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                              color: Color.fromARGB(255, 35, 12, 2),
                              fontWeight: FontWeight.w500,
                              fontSize: 10,
                            ),
                          ),
                        ),
                        const SizedBox(height: 9),
                        Text(
                          coffee.name.toUpperCase(),
                          style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                              color: Color.fromARGB(255, 35, 12, 2),
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                          ),
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
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    image: DecorationImage(
                      image: NetworkImage(coffee.imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
