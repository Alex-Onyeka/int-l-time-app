import 'package:flutter/material.dart';
import 'package:timeapp/resources/list_time_class.dart';

class Location extends StatefulWidget {
  const Location({super.key});

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  List timeZones = [
    ListTimeClass(name: 'Nigeria', url: 'Africa/Lagos'),
    ListTimeClass(name: 'France', url: 'Europe/Paris'),
    ListTimeClass(name: 'Russia', url: 'Europe/Moscow'),
    ListTimeClass(name: 'South Africa', url: 'Africa/Johannesburg'),
    ListTimeClass(name: 'Egypt', url: 'Africa/Cairo'),
    ListTimeClass(name: 'United Kingdom', url: 'Europe/London'),
    ListTimeClass(name: 'USA', url: 'America/New_York'),
    ListTimeClass(name: 'South Africa', url: 'Africa/Johannesburg'),
    ListTimeClass(name: 'Spain', url: 'Europe/Madrid'),
    ListTimeClass(name: 'Kenya', url: 'Africa/Nairobi'),
    ListTimeClass(name: 'Canada', url: 'America/Toronto'),
    ListTimeClass(name: 'Mexico', url: 'America/Mexico_City'),
    ListTimeClass(name: 'Brazil', url: 'America/Sao_Paulo'),
    ListTimeClass(name: 'Argentina', url: 'America/Argentina/Buenos_Aires'),
    ListTimeClass(name: 'Colombia', url: 'America/Bogota'),
    ListTimeClass(name: 'Germany', url: 'Europe/Berlin'),
    ListTimeClass(name: 'China', url: 'Asia/Shanghai'),
    ListTimeClass(name: 'India', url: 'Asia/Kolkata'),
    ListTimeClass(name: 'Japan', url: 'Asia/Tokyo'),
    ListTimeClass(name: 'Saudi Arabia', url: 'Asia/Riyadh'),
    ListTimeClass(name: 'UAE', url: 'Asia/Dubai'),
    ListTimeClass(name: 'Turkey', url: 'Europe/Istanbul'),
    ListTimeClass(name: 'Israel', url: 'Asia/Jerusalem'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
            style: TextStyle(
              //
              //
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
              //
              //
            ),
            'Choose Location'),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: ListView.builder(
          itemCount: timeZones.length, // Total number of items
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: ListTile(
                onTap: () {
                  Navigator.pushReplacementNamed(
                    context,
                    '/loading',
                    arguments: ListTimeClass(
                        name: timeZones[index].name, url: timeZones[index].url),
                  );
                },
                tileColor: const Color.fromARGB(90, 144, 202, 249),
                title: Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Text('${index + 1}.'),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                              style: TextStyle(fontWeight: FontWeight.bold),
                              '${timeZones[index].name}'),
                        ],
                      ),
                    ),
                    Icon(
                        color: Colors.grey.shade500,
                        Icons.keyboard_arrow_right_rounded),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
