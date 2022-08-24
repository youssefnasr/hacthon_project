import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacthon_project/model/blog.dart';
import 'package:hacthon_project/services/dio/dio_services.dart';
import 'package:meta/meta.dart';

part 'blog_state.dart';

class BlogCubit extends Cubit<BlogState> {
  BlogCubit() : super(BlogInitial());

  static BlogCubit get(context) => BlocProvider.of(context);
  BlogsModel blogsModel = BlogsModel();
  List<Plants> plants = [];

   getBlogData() {
    emit(BlogLoadingState());
    DioHelper.getData(
      url: 'v1/products/blogs',
      token:
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiJiMzQ0ZGVjNS00N2Q5LTQzYmQtYTFkMi0xYzE0OTc2MDRiNmQiLCJpYXQiOjE2NjEyNDY1OTcsImV4cCI6MTY2MTQxOTM5N30.NV6KNn0TitbsHu9jlAMEotDqO1J_Q6HFJUhy6KzqDKA',
    ).then((value) {
      print(value);
      print('------------------------');
      plants = value.data['data']['plants'];
      blogsModel = BlogsModel.fromJson(value.data);
      print('=========================');
      print(blogsModel.data.seeds.length);
      emit(BlogSuccessState());
    }).catchError((error) {
      print(error.toString());
        emit(BlogErrorState());

    });
  }
}
