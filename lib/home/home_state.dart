part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();
}

class HomeLoadingState extends HomeState {

  @override
  List<Object> get props => [];
}

class HomeLoadedState extends HomeState{

  final String activityName;
  final String activityType;
  final int participants;

  HomeLoadedState({required this.activityName,required this.activityType,required this.participants});

  @override
  // TODO: implement props
  List<Object?> get props => [participants,activityType,activityName];

}