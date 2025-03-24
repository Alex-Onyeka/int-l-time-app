import 'package:flutter/material.dart';
import 'package:timeapp/resources/time_class.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late TimeClass time;

  @override
  void didChangeDependencies() {
    super
        .didChangeDependencies(); // Call parent class method

    time = ModalRoute.of(context)!.settings.arguments
        as TimeClass;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                  'assets/${int.parse(time.hrs24Time.substring(0, 2)) > 6 && int.parse(time.hrs24Time.substring(0, 2)) < 18 ? "day.jpg" : "night.jpg"}'),
              fit: BoxFit.cover),
        ),
        child: Container(
          color: const Color.fromARGB(127, 0, 0, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                  //
                  //Style
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                  //End Style
                  //
                  time.name),
              SizedBox(
                height: 5,
              ),
              Text(
                  //
                  //Style
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 60,
                    fontWeight: FontWeight.bold,
                  ),
                  //End Style
                  //
                  time.time),
              SizedBox(
                height: 5,
              ),
              Text(
                  //
                  //Style
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                  //End Style
                  //
                  '${time.dayOfTheWeek}. ${time.month}. ${time.day}. ${time.year}'),
              SizedBox(height: 20),
              TextButton.icon(
                style: TextButton.styleFrom(
                  backgroundColor: const Color.fromARGB(221,
                      1, 51, 92), // Set background color
                  foregroundColor:
                      Colors.white, // Set text color
                  padding: EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 24), // Add padding
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        8), // Rounded corners
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/location');
                },
                label: Text(
                    style: TextStyle(color: Colors.white),
                    'Set Location'),
                icon: Icon(
                    color: Colors.grey.shade100,
                    Icons.location_on_outlined),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
