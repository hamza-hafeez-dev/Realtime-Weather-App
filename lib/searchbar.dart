import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:material_ui/material_ui.dart';

class SearchBarUI extends StatefulWidget {
  final ValueChanged<String> onSearch;
  const SearchBarUI({super.key, required this.onSearch});

  @override
  State<SearchBarUI> createState() => _SearchBarUIState();
}

class _SearchBarUIState extends State<SearchBarUI> {
  final TextEditingController controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      width: 320.w,
      child: TextField(
        controller: controller,
        maxLines: 1,
        textAlign: TextAlign.center,
        cursorColor: Colors.white,
        style: TextStyle(fontSize: 17.sp, color: Colors.white),
        decoration: InputDecoration(
          fillColor: Colors.white12,
          filled: true,

          isDense: true,
          hintText: 'Search City',
          hintStyle: TextStyle(fontSize: 17.sp, color: Colors.white54),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30.r)),

          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.r),
            borderSide: BorderSide(color: Colors.white38, width: 1.w),
          ),
          suffixIcon: GestureDetector(
            onTap: () {
              widget.onSearch(controller.text);
            },
            child: Container(
              margin: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.white24,
                borderRadius: BorderRadius.circular(30.r),
              ),
              child: Icon(Icons.close, size: 20, color: Colors.white),
            ),
          ),
        ),
        onSubmitted: (value) {
          widget.onSearch(value);
        },
      ),
    );
  }
}
