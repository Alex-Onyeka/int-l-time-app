import 'package:flutter/material.dart';
import 'package:timeapp/resources/time_action_class.dart';
import 'package:timeapp/resources/time_class.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:timeapp/resources/list_time_class.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  TimeClass? timeData;
  late ListTimeClass timeZone; // Store received object

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final args = ModalRoute.of(context)?.settings.arguments;

    setState(() {
      // If no arguments are passed, use default values
      if (args is ListTimeClass) {
        timeZone = args;
      } else {
        timeZone = ListTimeClass(name: 'Nigeria', url: 'Africa/Lagos');
      }
    });

    getTime(); // Fetch time based on received or default data
  }

  Future<void> getTime() async {
    TimeActionClass mainAction =
        TimeActionClass(mainurl: timeZone.url, parName: timeZone.name);
    TimeClass result = await mainAction.action();

    setState(() {
      timeData = result;
    });

    if (mounted && timeData != null) {
      await Future.delayed(const Duration(seconds: 2)); // Simulate loading
      Navigator.pushReplacementNamed(
        context,
        '/home',
        arguments: timeData,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/night.jpg'), fit: BoxFit.cover),
        ),
        width: double.infinity,
        height: double.infinity,
        child: Container(
          color: const Color.fromARGB(227, 3, 11, 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 60,
                width: 60,
                child: LoadingIndicator(
                  indicatorType: Indicator.ballSpinFadeLoader,
                  colors: const [Color.fromARGB(195, 119, 151, 248)],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
