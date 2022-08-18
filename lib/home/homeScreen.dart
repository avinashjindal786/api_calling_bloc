

import 'package:api_calling_bloc/home/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../services/borad_services.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context)=> HomeBloc(RepositoryProvider.of<BoredService>(context)),
    child: Scaffold(
      appBar: AppBar(
        title: Text('Activities for bored people'),
        actions:  [
          BlocBuilder<HomeBloc,HomeState>(builder: (context, state) => InkWell(
        onTap: (){
      BlocProvider.of<HomeBloc>(context).add(LoadApiEvent());
      },
      child: Icon(Icons.add),
    )),
        ],
      ),
      body: BlocBuilder<HomeBloc,HomeState>(
        builder: (context, state) {
          if(state is HomeLoadingState){
            print(state);
            return const Center(
              child: CircularProgressIndicator(),
            );
          }if (state is HomeLoadedState) {
            print(state.participants);
            return Column(
              children: [
                Text(state.activityName),
                Text(state.activityType),
                Text(
                  state.participants.toString(),
                ),
                ElevatedButton(
                  onPressed: () => BlocProvider.of<HomeBloc>(context).add(LoadApiEvent()),
                  child: Text('LOAD NEXT'),
                )
              ],
            );
          }
          return Container();
        }),
      ),

    );
  }

}
