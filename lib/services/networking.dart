import 'dart:convert';

import 'package:http/http.dart' as http;

class Networking {
  Future getCovidData() async {
    const String url = 'https://api.quarantine.country/api/v1/summary/latest';

    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var decodedCovidData = jsonDecode(response.body);

      return decodedCovidData;
    } else {
      throw Exception();
    }
  }
}

//response
//[
//  status: 200
//  data: [
//    regions:[
//      usa: [
//        total_cases:
//        active_cases:
//        recovered:
//        deaths: 
//   ]  india: [
//  ]
// ]
// ]
//]