import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:material_ui/material_ui.dart';
import 'package:weather_ui/main.dart';

class OnBoradPage extends StatefulWidget {
  const OnBoradPage({super.key});

  @override
  State<OnBoradPage> createState() => _OnBoradPageState();
}

class _OnBoradPageState extends State<OnBoradPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF0F2B32), Color(0xFF133B43), Color(0xFF184953)],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),

          child: Column(
            crossAxisAlignment: .center,
            mainAxisAlignment: .center,
            children: [
              LottieBuilder.asset(
                'assets/weather_partly_shower.json',
                frameRate: FrameRate(500),
              ),

              SizedBox(height: 30.h),
              Text(
                textAlign: TextAlign.center,
                'Welcome to our Weather App Search the Weather for any city.',
                style: TextStyle(
                  fontSize: 22.sp,
                  color: Colors.white,
                  fontWeight: .w600,
                ),
              ),

              SizedBox(height: 50.h),
              SizedBox(
                width: 200.w,
                height: 50.h,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    side: BorderSide(color: Color(0xFF184953), width: 2),
                    backgroundColor: Color(0xFF0F2B32),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => MyHomePage()),
                    );
                  },
                  child: Text(
                    'Get Started',
                    style: TextStyle(fontSize: 18.sp, color: Colors.white),
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
