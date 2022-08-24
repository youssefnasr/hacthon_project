import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:hacthon_project/bloc/authentication/authentication_cubit.dart';
import 'package:hacthon_project/core/utlis.dart';
import 'package:hacthon_project/screens/home_screen.dart';
import 'package:hacthon_project/screens/sign_up_screen.dart';
import 'package:hexcolor/hexcolor.dart';

import '../constants/auth_app_bar.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isChecked = false;
  var formKey = GlobalKey<FormState>();

  @override

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
                    return Colors.black;
                  }),
                ),
                onPressed: () {
                  AppNavigator.customNavigator(
                    context: context,
                    screen: SignUpScreen(),
                    finish: false,
                  );
                },
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
                    if (states.contains(MaterialState.hovered)) {
                      return color;
                    }
                    return color;
                  }),
                ),
                onPressed: () {},
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
              BlocConsumer<AuthenticationCubit,AuthenticationState>(
                listener: (context, state)
                {
                  if(state is LoginSuccessState)
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
                          Text('Email',
                              style: TextStyle(
                                color: HexColor('FF#6F6F6F'),
                              )),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: authCubit.emailController,
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
                            controller: authCubit.passwordController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                            validator: (String? value) {
                              if (value!.isEmpty) {
                                return 'Password must not be empty!';
                              }
                              return null;
                            },
                          ),
                          Row(
                            children: [
                              Checkbox(
                                value: isChecked,
                                onChanged: (bool? value) {
                                  setState(() {
                                    isChecked = value!;
                                  });
                                },
                              ),
                              const Text(
                                'Remember me',
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                              const SizedBox(
                                width: 459,
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
                                onPressed: () {},
                                child: const Text(
                                  'Forget password ?',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              onPrimary: Colors.white,
                              primary: color,
                              fixedSize: const Size(1000,50),
                            ),
                            onPressed: () {
                              if (formKey.currentState!.validate())
                              {
                                authCubit.userLogin(
                                    authCubit.emailController.text,
                                    authCubit.passwordController.text,
                                );
                              }
                            },
                            child: const Text('Login'),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Dont have an account?',
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
                                      screen: SignUpScreen(),
                                      finish: false);
                                },
                                child: const Text(
                                  'Sign Up',
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
                          Stack(
                            fit: StackFit.passthrough,
                            alignment: AlignmentDirectional.bottomEnd,
                            children:
                            [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  SizedBox(
                                    width: 200,
                                    height: 200,
                                    child: Image.asset('assets/images/flowers bottomrigth.png')),],),
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
