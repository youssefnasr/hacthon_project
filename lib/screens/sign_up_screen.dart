import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:hacthon_project/bloc/authentication/authentication_cubit.dart';
import 'package:hacthon_project/core/utlis.dart';
import 'package:hacthon_project/screens/home_screen.dart';
import 'package:hacthon_project/screens/login_screen.dart';
import 'package:hexcolor/hexcolor.dart';
import '../constants/auth_app_bar.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AuthAppBar(),
          const SizedBox(
            height: 70,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                    if (states.contains(MaterialState.hovered)) {
                      return color;
                    }
                    return color;
                  }),
                ),
                onPressed: () {},
                child: const Text(
                  'Sign Up',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              const SizedBox(
                width: 240,
              ),
              TextButton(
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                    if (states.contains(MaterialState.pressed)) {
                      return color;
                    }
                    return Colors.black;
                  }),
                ),
                onPressed: () {
                  AppNavigator.customNavigator(
                      context: context, screen: const LoginScreen(), finish: false);
                },
                child: const Text(
                  'Login',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          const Divider(
            endIndent: 120,
            indent: 120,
          ),
          const SizedBox(
            height: 30,
          ),
          Stack(
            children: [
              SizedBox(
                height: 200,
                width: 200,
                child: Image.asset('assets/images/flowers topleft.png'),
              ),
              // Align(
              //   alignment: AlignmentDirectional.bottomEnd,
              //   child: Container(
              //       width: 200,
              //       height: 200,
              //       child: Image.asset('assets/images/flowers bottomrigth.png')
              //   ),
              // ),
              BlocConsumer<AuthenticationCubit,AuthenticationState>(
                listener: (context, state)
                {
                  if(state is SignupSuccessState)
                    {
                      AppNavigator.customNavigator(
                          context: context,
                          screen: HomeScreen(),
                          finish: false,
                      );
                    }
                },
                builder: (context, state) {
                  var authCubit=AuthenticationCubit.get(context);
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 330),
                    child: Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('First Name',
                                      style: TextStyle(
                                        color: HexColor('FF#6F6F6F'),
                                      )),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  SizedBox(
                                    width: 300,
                                    child: TextFormField(
                                      controller: authCubit.firstNameController,
                                      keyboardType: TextInputType.emailAddress,
                                      decoration: const InputDecoration(
                                          border: OutlineInputBorder()),
                                      validator: (String? value) {
                                        if (value!.isEmpty) {
                                          return 'First Name must not be empty!';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                width: 106,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Last Name',
                                      style: TextStyle(
                                        color: HexColor('FF#6F6F6F'),
                                      )),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  SizedBox(
                                    width: 300,
                                    child: TextFormField(
                                      controller: authCubit.lastNameController,
                                      keyboardType: TextInputType.emailAddress,
                                      decoration: const InputDecoration(
                                          border: OutlineInputBorder()),
                                      validator: (String? value) {
                                        if (value!.isEmpty) {
                                          return 'Last Name must not be empty!';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text('Email',
                              style: TextStyle(
                                color: HexColor('FF#6F6F6F'),
                              )),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller:authCubit.emailController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder()),
                            validator: (String? value) {
                              if (value!.isEmpty) {
                                return 'Email must not be empty!';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text('Password',
                              style: TextStyle(
                                color: HexColor('FF#6F6F6F'),
                              )),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller:authCubit.passwordController,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder()),
                            validator: (String? value) {
                              if (value!.isEmpty) {
                                return 'Password must not be empty!';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text('Confirm Password',
                              style: TextStyle(
                                color: HexColor('FF#6F6F6F'),
                              )),
                          const SizedBox(
                            height: 20,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              onPrimary: Colors.white,
                              primary: color,
                              fixedSize: const Size(1000, 50),
                            ),
                            onPressed: () {
                              if (formKey.currentState!.validate())
                              {
                                authCubit.userSignUp(
                                  authCubit.firstNameController.text,
                                  authCubit.lastNameController.text,
                                  authCubit.emailController.text,
                                  authCubit.passwordController.text,
                                );
                              }
                            },
                            child: const Text('Sign Up'),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Already have an account?',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                              TextButton(
                                style: ButtonStyle(
                                  foregroundColor:
                                      MaterialStateProperty.resolveWith<Color>(
                                          (Set<MaterialState> states) {
                                    if (states.contains(MaterialState.hovered)) {
                                      return color;
                                    }
                                    return Colors.grey;
                                  }),
                                ),
                                onPressed: () {
                                  AppNavigator.customNavigator(
                                      context: context,
                                      screen: const LoginScreen(),
                                      finish: false);
                                },
                                child: const Text(
                                  'Login',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(children: [
                            const Expanded(
                              child: Divider(
                                indent: 60,
                                color: Colors.grey,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextButton(
                                style: ButtonStyle(
                                  foregroundColor:
                                      MaterialStateProperty.resolveWith<Color>(
                                          (Set<MaterialState> states) {
                                    if (states.contains(MaterialState.hovered)) {
                                      return color;
                                    }
                                    return Colors.grey;
                                  }),
                                ),
                                onPressed: () {},
                                child: const Text(
                                  'or continue with',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                            const Expanded(
                              child: Divider(
                                endIndent: 40,
                                color: Colors.grey,
                              ),
                            ),
                          ]),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SignInButtonBuilder(
                                text: 'Sign in with Google',
                                textColor: color,
                                image: Image.asset(
                                  'assets/images/Google.png',
                                  width: 22,
                                  height: 22,
                                ),
                                onPressed: () {},
                                backgroundColor: Colors.white,
                              ),
                              const SizedBox(
                                width: 180,
                              ),
                              SignInButtonBuilder(
                                text: 'Sign in with Facebook',
                                textColor: color,
                                image: Image.asset(
                                  'assets/images/Facebook.png',
                                  width: 22,
                                  height: 22,
                                ),
                                onPressed: () {},
                                backgroundColor: Colors.white,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 70,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
