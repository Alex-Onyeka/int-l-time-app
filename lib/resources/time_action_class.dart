import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'dart:convert';
import 'package:timeapp/resources/time_class.dart';

class TimeActionClass {
  final String mainurl;
  final String parName;
  TimeActionClass({required this.mainurl, required this.parName});

  Future<TimeClass> action() async {
    Uri url =
        Uri.parse('https://timeapi.io/api/Time/current/zone?timeZone=$mainurl');

    Response response = await get(url);

    Map mainData = jsonDecode(response.body);

    DateTime dateTime = DateTime.parse(mainData['dateTime']);

    String hrs24Time = DateFormat('HH:mm').format(dateTime);

    String formattedTime = DateFormat('hh:mm a').format(dateTime);

    return TimeClass(
      countryName: mainData['timeZone'].toString(),
      day: mainData['day'].toString(),
      dayOfTheWeek: mainData['dayOfWeek'].toString(),
      month: mainData['month'].toString(),
      year: mainData['year'].toString(),
      time: formattedTime.toString(),
      hrs24Time: hrs24Time.toString(),
      name: parName,
    );
  }
}
