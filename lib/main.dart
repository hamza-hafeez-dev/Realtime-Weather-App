import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:material_ui/material_ui.dart';
import 'package:weather_ui/API_Call/api_fetch.dart';
import 'package:weather_ui/API_Call/modelclass.dart';
import 'package:weather_ui/homepage.dart';
import 'package:weather_ui/onboardpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 800),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          home: child,
          debugShowCheckedModeBanner: false,
          title: 'Weather UI',
        );
      },
      child: OnBoradPage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<WeatherModelclass> _future;

  @override
  void initState() {
    _future = WeatherAPIService().getData('Bahawalpur');
    super.initState();
  }

  void searchCity(String city) {
    if (city.trim().isEmpty) return;

    setState(() {
      _future = WeatherAPIService().getData(city.trim());
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<WeatherModelclass>(
      future: _future,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF0F2B32),
                  Color(0xFF133B43),
                  Color(0xFF184953),
                ],
              ),
            ),
            child: Center(
              child: CircularProgressIndicator(color: Colors.white),
            ),
          );
        }
        if (snapshot.hasError) {
          return Center(child: Text('Error ${snapshot.error}'));
        }
        if (snapshot.hasData) {
          final weather = snapshot.data!;
          return HomePageUI(weather: weather, onSearch: searchCity);
        }
        return Scaffold(body: Center(child: Text('No weather data found')));
      },
    );
  }
}
