import 'dart:html';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacthon_project/bloc/authentication/authentication_cubit.dart';
import 'package:hacthon_project/bloc/blog/blog_cubit.dart';
import 'package:hacthon_project/bloc/products/products_cubit.dart';
import 'package:hacthon_project/screens/login_screen.dart';
class AppRoot extends StatelessWidget {
  const AppRoot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers:
      [
        BlocProvider(create: (BuildContext context) =>AuthenticationCubit()),
        BlocProvider(create: (BuildContext context) =>BlogCubit()..getBlogData()),
        BlocProvider(create: (BuildContext context) =>ProductsCubit()..getProducts()),
      ],
      child:MaterialApp(
        home:LoginScreen(),//SharedPreferencesHelper.getData(key: 'token')==null?LoginScreen():HomeScreen(),
        debugShowCheckedModeBanner: false,
    ));
  }
}
