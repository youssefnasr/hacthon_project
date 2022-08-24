import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacthon_project/model/products.dart';
import 'package:hacthon_project/services/dio/dio_services.dart';
import 'package:meta/meta.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit() : super(ProductsInitial());
  static ProductsModel get(context)=>BlocProvider.of(context);
  ProductsModel productsModel = ProductsModel(type: '', message:'', data:[]);

  getProducts()
  {
    emit(ProductsLoadingState());
    DioHelper.getData(
        url:'v1/products',
      token: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiJiMzQ0ZGVjNS00N2Q5LTQzYmQtYTFkMi0xYzE0OTc2MDRiNmQiLCJpYXQiOjE2NjEyNDY1OTcsImV4cCI6MTY2MTQxOTM5N30.NV6KNn0TitbsHu9jlAMEotDqO1J_Q6HFJUhy6KzqDKA',
    ).then((value) {
      productsModel=ProductsModel.fromJson(value.data);
      print(value.data);
      emit(ProductsSuccessState());
    }).catchError((error)
    {
      print(error.toString());
      emit(ProductsErrorState());
    });
  }

}
