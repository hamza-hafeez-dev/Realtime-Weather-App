import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:material_ui/material_ui.dart';
import 'package:weather_ui/API_Call/modelclass.dart';
import 'package:weather_ui/listtiles.dart';
import 'package:weather_ui/properties.dart';
import 'package:weather_ui/searchbar.dart';

class HomePageUI extends StatefulWidget {
  final WeatherModelclass weather;
  final ValueChanged<String> onSearch;

  const HomePageUI({super.key, required this.weather, required this.onSearch});

  @override
  State<HomePageUI> createState() => _HomePageUIState();
}

class _HomePageUIState extends State<HomePageUI> {
  List<ModelClass> get modellist {
    final forecast = widget.weather.forecastDays;

    if (forecast.isEmpty) {
      return [];
    }

    final firstDate = DateTime.parse(forecast.first.date);

    final dayUnitlSunday = DateTime.sunday - firstDate.weekday + 1;

    const dayNames = [
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday',
    ];

    return forecast.take(dayUnitlSunday).map((item) {
      final date = DateTime.parse(item.date);

      return ModelClass(
        day: dayNames[date.weekday - 1],
        degree: item.temperature.toStringAsFixed(1),
        iconPath: item.iconUrl,
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,

        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: AlignmentGeometry.topCenter,
            end: AlignmentGeometry.bottomCenter,
            colors: [Color(0xFF0F2B32), Color(0xFF133B43), Color(0xFF184953)],
          ),
        ),

        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: .center,
            children: [
              SizedBox(height: 70.h),
              SearchBarUI(onSearch: widget.onSearch),

              SizedBox(height: 30.h),
              Row(
                mainAxisAlignment: .center,
                children: [
                  Text(
                    '${widget.weather.cityName ?? 'Unknown'},',
                    style: TextStyle(
                      fontSize: 18.sp,
                      color: Colors.white,
                      fontWeight: .w500,
                    ),
                  ),
                  Text(
                    ' ${widget.weather.countryName ?? ''},',
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: Colors.white60,
                      fontWeight: .w300,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 40.h),
              SizedBox(
                height: 130.h,
                width: 130.w,
                child: Image.asset('assets/sun_bg.png'),
              ),

              SizedBox(height: 40.h),
              Text(
                textAlign: TextAlign.center,
                ' ${widget.weather.tempC?.toStringAsFixed(1) ?? ''} °',
                style: TextStyle(
                  fontSize: 50.sp,
                  color: Colors.white,
                  fontWeight: .w800,
                  height: 1,
                ),
              ),

              SizedBox(height: 10.h),
              Text(
                textAlign: TextAlign.center,
                widget.weather.conditionText ?? 'Unknown',
                style: TextStyle(
                  fontSize: 18.sp,
                  color: Colors.white,
                  fontWeight: .w500,
                  height: 1,
                ),
              ),

              SizedBox(height: 40.h),
              Properties(
                wind: widget.weather.windKph ?? 0.0,
                humidity: widget.weather.humidity ?? 0,
                sunrise: widget.weather.sunrise ?? '---',
              ),

              SizedBox(height: 40.h),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  crossAxisAlignment: .start,
                  children: [
                    Icon(
                      Icons.calendar_month_outlined,
                      size: 25.sp,
                      color: Colors.white70,
                    ),
                    SizedBox(width: 5.w),
                    Text(
                      'Daily Forecast',
                      style: TextStyle(fontSize: 18.sp, color: Colors.white),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 10.h),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: SizedBox(
                  height: 135.h,
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: modellist.length,

                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 12),
                        child: ListTiles(modelClass: modellist[index]),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
