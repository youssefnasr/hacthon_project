import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacthon_project/model/plants.dart';
import 'package:hacthon_project/services/dio/dio_services.dart';
import 'package:meta/meta.dart';

part 'plants_state.dart';

class PlantsCubit extends Cubit<PlantsState> {
  PlantsCubit() : super(PlantsInitial());
  static PlantsCubit get(context)=>BlocProvider.of(context);

  PlantsModel?plantsModel;
  List<PlantsModel> plants = [];

  getPlants()
  {
    emit(PlantsLoadingState());
    DioHelper.getData(
        url: 'v1/plants',
      token: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiJiMzQ0ZGVjNS00N2Q5LTQzYmQtYTFkMi0xYzE0OTc2MDRiNmQiLCJpYXQiOjE2NjEyNDY1OTcsImV4cCI6MTY2MTQxOTM5N30.NV6KNn0TitbsHu9jlAMEotDqO1J_Q6HFJUhy6KzqDKA',
    ).then((value) {
      var jsonData = jsonDecode(value.data);
      plantsModel = PlantsModel.fromJson(jsonData);
      print(value.data);
      emit(PlantsSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(PlantsErrorState());
    });

  }
}
