import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:material_ui/material_ui.dart';

class ModelClass {
  final String day;
  final String degree;
  final String iconPath;

  ModelClass({required this.day, required this.degree, required this.iconPath});
}

class ListTiles extends StatelessWidget {
  final ModelClass modelClass;

  const ListTiles({super.key, required this.modelClass});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130.h,
      width: 110.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: Colors.white30, width: 1.w),
      ),

      child: Column(
        crossAxisAlignment: .center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
            modelClass.iconPath,
            errorBuilder: (context, error, stackTrace) {
              return Icon(Icons.cloud, color: Colors.white, size: 32);
            },
          ),
          Text(
            modelClass.day,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),

          SizedBox(height: 4.h),
          Text(
            '${modelClass.degree} °',
            style: TextStyle(
              fontSize: 15.sp,
              fontWeight: .w600,
              color: Colors.white70,
            ),
          ),
          SizedBox(height: 10.h),
        ],
      ),
    );
  }
}
