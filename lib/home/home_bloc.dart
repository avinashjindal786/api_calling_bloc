import 'dart:async';

import 'package:api_calling_bloc/services/borad_services.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final BoredService _boredService;
  HomeBloc(this._boredService) : super(HomeLoadingState()){
    on<LoadApiEvent>((event,emit)async{
      final activity = await _boredService.getBoredActivity();
      emit(HomeLoadedState(activityName: activity.activity, activityType: activity.type, participants: activity.participants));
    });
  }

}
