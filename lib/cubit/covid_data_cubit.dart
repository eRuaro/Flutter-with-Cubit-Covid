import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:covid_cubit/model/covid_data.dart';
import 'package:covid_cubit/model/covid_data_repository.dart';
import 'package:covid_cubit/services/networking.dart';

part 'covid_data_state.dart';

class CovidDataCubit extends Cubit<CovidDataState> {
  final CovidDataRepository _covidDataRepository;
  CovidDataCubit(this._covidDataRepository) : super(CovidDataInitial());

  Future<void> getCovidData(String regionName) async {
    try {
      emit(CovidDataLoading());
      final covidData = await _covidDataRepository.fetchCovidData(regionName);
      emit(
        CovidDataLoaded(covidData: covidData),
      );
    } on NetworkException {
      emit(CovidDataException(message: 'Failed to Load Covid Data'));
    }
  }
}
