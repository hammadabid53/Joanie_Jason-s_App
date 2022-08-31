import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getxpractice/Resuable_widgets/custom_text_widget.dart';
import 'package:getxpractice/utils/app_color.dart';

class LabeledCheckbox extends StatelessWidget {
  static const String _title = 'Flutter Code Sample';

  const LabeledCheckbox(
      {Key? key,
      required this.label,
      required this.padding,
      this.onTap,
      required this.value,
      required this.onChanged})
      : super(key: key);
  final Function()? onTap;
  final String label;
  final EdgeInsets padding;
  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Row(
        children: <Widget>[
          Checkbox(
            activeColor: AppColor.SECONDARY_COLOR,
            value: value,
            onChanged: (bool? newValue) {
              onChanged(newValue!);
            },
          ),
          Expanded(
            child: InkWell(
              onTap: onTap,
              child: CustomTextWidget(
                text: label,
                fontSize: 1.sp,
                textColor: AppColor.BLACK_COLOR,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
