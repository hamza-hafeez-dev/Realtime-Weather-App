import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:material_ui/material_ui.dart';

class Properties extends StatelessWidget {
  final double wind;
  final int humidity;
  final String sunrise;

  const Properties({
    super.key,
    required this.wind,
    required this.humidity,
    required this.sunrise,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.air, size: 24.sp, color: Colors.white70),
        SizedBox(width: 5.w),
        Text(
          '${wind.toStringAsFixed(1)} km/h',
          style: TextStyle(fontSize: 17.sp, color: Colors.white),
        ),

        SizedBox(width: 25.w),

        Icon(Icons.water_drop, size: 24.sp, color: Colors.white70),
        SizedBox(width: 5.w),
        Text(
          '$humidity %',
          style: TextStyle(fontSize: 17.sp, color: Colors.white),
        ),

        SizedBox(width: 25.w),

        Icon(Icons.sunny, size: 24.sp, color: Colors.white70),
        SizedBox(width: 5.w),
        Text(
          sunrise,
          style: TextStyle(fontSize: 17.sp, color: Colors.white),
        ),
      ],
    );
  }
}
