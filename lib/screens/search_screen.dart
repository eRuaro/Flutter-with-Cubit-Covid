import 'package:covid_cubit/model/covid_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:covid_cubit/cubit/covid_data_cubit.dart';
import 'package:covid_cubit/widgets/data_container.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen();

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<CovidDataCubit, CovidDataState>(
        listener: (context, state) {
          if (state is CovidDataException) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        builder: (context, state) {
          if (state is CovidDataInitial) {
            return covidDataInitial();
          } else if (state is CovidDataLoading) {
            return covidDataLoading();
          } else if (state is CovidDataLoaded) {
            return covidDataLoaded(state.covidData);
          } else {
            return covidDataInitial();
          }
        },
      ),
    );
  }

  Widget covidDataInitial() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: TextField(
          onSubmitted: (value) => submitRegionName(context, value.toLowerCase()),
          textInputAction: TextInputAction.search,
          decoration: InputDecoration(
            hintText: "Enter a Country",
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            suffixIcon: Icon(Icons.search),
          ),
        ),
      ),
    );
  }

  Widget covidDataLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget covidDataLoaded(CovidData covidData) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: 20,
                bottom: 15,
              ),
              child: Align(
                child: Text(
                  covidData.region.toUpperCase(),
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff142237),
                  ),
                ),
                alignment: Alignment.topLeft,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            // AspectRatio(
            //   aspectRatio: 1.8,
            //   child: Image(
            //     image: AssetImage(
            //       'assets/images/coronavirus.png',
            //     ),
            //   ),
            // ),
            // SizedBox(
            //   height: 40,
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DataContainer(
                  data: 'Confirmed',
                  color: Color(0xFFFC1441),
                  dataValue: covidData.totalCases,
                ),
                SizedBox(
                  width: 20,
                ),
                DataContainer(
                  color: Color(0xFF157FFB),
                  data: 'Active',
                  dataValue: covidData.activeCases,
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DataContainer(
                  data: 'Recovered',
                  color: Color(0xFF30A64A),
                  dataValue: covidData.recoveries,
                ),
                SizedBox(
                  width: 20,
                ),
                DataContainer(
                  color: Color(0xFF6D757D),
                  data: 'Deceased',
                  dataValue: covidData.deaths,
                ),
              ],
            ),
            SizedBox(
              height: 60,
            ),
            covidDataInitial(),
          ],
        ),
    );
  }

  void submitRegionName(BuildContext context, String regionName) {
    final covidDataCubit = context.read<CovidDataCubit>();

    covidDataCubit.getCovidData(regionName);
  }
}
