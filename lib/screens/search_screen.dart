import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:covid_cubit/cubit/covid_data_cubit.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen();

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: TextField(
            onSubmitted: (value) => submitRegionName(context, value),
            textInputAction: TextInputAction.search,
            decoration: InputDecoration(
              hintText: "Enter a Country",
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              suffixIcon: Icon(Icons.search),
            ),
          ),
        ),
      ),
    );
  }

  void submitRegionName(BuildContext context, String regionName) {
    final covidDataCubit = context.read<CovidDataCubit>();

    covidDataCubit.getCovidData(regionName);
  }
}
