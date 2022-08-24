import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacthon_project/model/authentication.dart';
import 'package:hacthon_project/services/dio/dio_services.dart';
import 'package:hacthon_project/services/sheared_preference/shearedprefrence_services.dart';
part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit() : super(AuthenticationInitial());
  static AuthenticationCubit get(context)=>BlocProvider.of(context);

  var firstNameController=TextEditingController();
  var lastNameController=TextEditingController();
  var emailController=TextEditingController();
  var passwordController=TextEditingController();

  AuthenticationHub?authenticationHub;
  userLogin(String? email,String? password)
  {
    emit(LoginLoadingState());
    DioHelper.postData(
        url: 'v1/auth/signin',
        data:
        {
          'email': email,
          'password': password,
        }
    ).then((value) {
      var jsonData = jsonDecode(value.data);
      authenticationHub = AuthenticationHub.fromJson(jsonData);
      print(value.data);
      SharedPreferencesHelper.saveData(key: 'token', value: authenticationHub!.data!.accessToken);
      print(authenticationHub!.data!.accessToken);
      emit(LoginSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(LoginErrorState());
    });
  }

  userSignUp(String?firstName,String? lastName,String? email,String? password) {
    emit(SignupLoadingState());
    DioHelper.postData(
        url: 'v1/auth/signup',
        data:
        {
          'firstName':firstName,
          'lastName':lastName,
          'email': email,
          'password': password,
        }
    ).then((value) {
      var jsonData = jsonDecode(value.data);
      authenticationHub = AuthenticationHub.fromJson(jsonData);
      print(value.data);
      emit(SignupSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(SignupErrorState());
    });
  }
}
