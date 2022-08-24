part of 'plants_cubit.dart';

@immutable
abstract class PlantsState {}

class PlantsInitial extends PlantsState {}
class PlantsLoadingState extends PlantsState {}
class PlantsSuccessState extends PlantsState {}
class PlantsErrorState extends PlantsState {}

