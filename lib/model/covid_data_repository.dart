import 'covid_data.dart';
import 'package:covid_cubit/services/networking.dart';

class CovidDataRepository {
  Future<CovidData> fetchCovidData(String regionName) async {
    var networking = Networking();

    var covidData = await networking.getCovidData();

    return CovidData(
      totalCases: covidData['data']['regions'][regionName]['total_cases'].toString(),
      activeCases: covidData['data']['regions'][regionName]['active_cases'].toString(),
      recoveries: covidData['data']['regions'][regionName]['recovered'].toString(),
      deaths: covidData['data']['regions'][regionName]['deaths'].toString(),
      region: covidData['data']['regions'][regionName]['name'].toString(),
    );
  }
}

