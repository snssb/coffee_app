import 'package:coffee_shop_app/features/auth/presentation/bloc/user_bloc.dart';
import 'package:coffee_shop_app/features/auth/presentation/bloc/user_event.dart';
import 'package:coffee_shop_app/features/auth/presentation/bloc/user_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthScreen extends StatelessWidget {
  AuthScreen({super.key});

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _submitRegForm(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      final email = _emailController.text;
      final password = _passwordController.text;

      BlocProvider.of<UserBloc>(context).add(
        RegisterUser(email, password),
      );
    }
  }

  void _submitLoginForm(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      final email = _emailController.text;
      final password = _passwordController.text;

      BlocProvider.of<UserBloc>(context).add(
        LoginUser(email, password),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: BlocListener<UserBloc, UserState>(
          listener: (context, state) {
            if (state is UserAuthenticated) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Authentication Successful')),
              );
              Navigator.pushNamed(context, '/');
            } else if (state is UserAuthFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.error)),
              );
            }
          },
          child: BlocBuilder<UserBloc, UserState>(
            builder: (context, state) {
              return Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/auth_background.png"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.only(left: 29),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 308),
                            Text(
                              'Welcome \nBack!',
                              style: GoogleFonts.josefinSans(
                                textStyle: const TextStyle(
                                  color: Color.fromARGB(255, 35, 12, 2),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 36,
                                  height: 0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          Form(
                            key: _formKey,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 29, top: 20, right: 29),
                              child: Column(
                                children: [
                                  TextFormField(
                                    controller: _emailController,
                                    decoration:
                                        InputDecoration(labelText: 'Email'),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter your email';
                                      }
                                      if (!value.contains('@')) {
                                        return 'Please enter a valid email';
                                      }
                                      return null;
                                    },
                                  ),
                                  SizedBox(height: 16),
                                  TextFormField(
                                    controller: _passwordController,
                                    decoration:
                                        InputDecoration(labelText: 'Password'),
                                    obscureText: true,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter your password';
                                      }
                                      if (value.length < 6) {
                                        return 'Password must be at least 6 characters';
                                      }
                                      return null;
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(height: 60),
                          ElevatedButton(
                            onPressed: () => _submitLoginForm(context),
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 35, 12, 2),
                              minimumSize: Size(333, 47),
                            ),
                            child: Text(
                              'Login',
                              style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                  color: Color.fromARGB(255, 238, 221, 201),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 13),
                          OutlinedButton(
                            onPressed: () => _submitRegForm(context),
                            style: OutlinedButton.styleFrom(
                              minimumSize: const Size(333, 47),
                              side: const BorderSide(width: 2),
                            ),
                            child: Text(
                              'Create an account',
                              style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                  color: Color.fromARGB(255, 35, 12, 2),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 25),
                          TextButton(
                            onPressed: () {},
                            style: OutlinedButton.styleFrom(
                              minimumSize: const Size(333, 47),
                            ),
                            child: Text(
                              'Forgot your password?',
                              style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                  color: Color.fromARGB(255, 35, 12, 2),
                                  fontWeight: FontWeight.w500,
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
              );
            },
          ),
        ),
      ),
    );
  }
}
