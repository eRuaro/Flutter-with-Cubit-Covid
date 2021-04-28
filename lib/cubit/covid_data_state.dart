part of 'covid_data_cubit.dart';

@immutable
abstract class CovidDataState {
  const CovidDataState();
}

class CovidDataInitial extends CovidDataState {
  const CovidDataInitial();
}

class CovidDataLoading extends CovidDataState {
  const CovidDataLoading();
}

class CovidDataLoaded extends CovidDataState {
  final CovidData covidData;

  const CovidDataLoaded({required this.covidData});

  //Always override equality of the state classes.
  //Bloc will not emit two states which are equal after one another.
  //
  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is CovidDataLoaded && o.covidData == covidData;
  }

  @override
  int get hashCode => covidData.hashCode;
}

class CovidDataException extends CovidDataState {
  final String message;

  const CovidDataException({required this.message});

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is CovidDataException && o.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}
