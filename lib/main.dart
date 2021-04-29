import 'package:covid_cubit/cubit/covid_data_cubit.dart';
import 'package:covid_cubit/model/covid_data_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'screens/search_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final CovidDataCubit _covidDataCubit = CovidDataCubit(CovidDataRepository());
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (covidDataContext) => CovidDataCubit(CovidDataRepository()),
      child: MaterialApp(
        title: 'Flutter Cubit Demo',
        routes: {
          'Search Screeen': (context) => BlocProvider.value(
            value: _covidDataCubit, 
            child: SearchScreen(),
          ),
        },
      ),
    );
  }
}
